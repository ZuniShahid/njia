// /admin/changes – review queue for editors and admins (users/{uid}.roles mirrored from the
// custom claims). Rule 1 in CLAUDE.md: nothing about visas, recognition or money goes live without
// human approval. Each pending changeRequest shows target, diff (before → after), source quote and
// Approve / Reject; the Cloud Function onChangeRequestWritten applies approved ones.
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/providers.dart';
import '../../app/theme.dart';
import '../../core/models/models.dart';
import '../../shared/format.dart';
import '../../shared/widgets/tabs.dart';
import '../../shared/widgets/ui.dart';
import '../../shared/widgets/view_scaffold.dart';

class AdminChangesView extends ConsumerStatefulWidget {
  const AdminChangesView({super.key});

  @override
  ConsumerState<AdminChangesView> createState() => _AdminChangesViewState();
}

class _AdminChangesViewState extends ConsumerState<AdminChangesView> {
  final _notes = <String, TextEditingController>{};
  final _showJson = <String>{};
  String? _busy;

  @override
  void dispose() {
    for (final c in _notes.values) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _decide(ChangeRequest c, bool approve) async {
    final uid = ref.read(currentUidProvider);
    if (uid == null) return;
    setState(() => _busy = c.id);
    try {
      await ref.read(changeRequestRepositoryProvider).decide(c.id, approve: approve, reviewerUid: uid, note: _notes[c.id]?.text.trim());
      if (mounted) toast(context, approve ? 'Approved · ${c.targetCollection}/${c.targetId} will be applied' : 'Rejected · ${c.targetCollection}/${c.targetId}');
    } catch (e) {
      if (mounted) toast(context, 'Could not save the decision: $e');
    } finally {
      if (mounted) setState(() => _busy = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final isEditor = ref.watch(isEditorProvider);
    final profileLoading = ref.watch(profileProvider).isLoading;
    if (profileLoading) return const Center(child: CircularProgressIndicator());
    if (!isEditor) {
      return const ViewScaffold(center: [
        PageHead(over: 'Admin', title: 'Editors only', caption: 'This page is for reviewers with the editor or admin role. Ask an admin to grant it (setRole).'),
      ]);
    }
    final pending = ref.watch(pendingChangesProvider);
    final sources = ref.watch(sourceNamesProvider).value ?? const <String, String>{};
    return pending.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => ViewScaffold(center: [PageHead(over: 'Admin', title: 'Review queue', caption: '$e')]),
      data: (items) => ViewScaffold(
        center: [
          PageHead(over: 'Admin', title: 'Review queue', caption: '${items.length} pending change${items.length == 1 ? '' : 's'} · nothing goes live without your approval'),
          if (items.isEmpty)
            NjiaCard(children: [Text('Nothing to review', style: text.titleMedium), Text('The 14-day source check (n8n) adds requests here when an official page changes.', style: text.bodySmall)]),
          for (final c in items)
            _ChangeCard(
              change: c,
              sourceName: sources[c.sourceId] ?? c.sourceId,
              note: _notes.putIfAbsent(c.id, TextEditingController.new),
              showJson: _showJson.contains(c.id),
              busy: _busy == c.id,
              onToggleJson: () => setState(() => _showJson.contains(c.id) ? _showJson.remove(c.id) : _showJson.add(c.id)),
              onApprove: () => _decide(c, true),
              onReject: () => _decide(c, false),
            ),
        ],
        right: [
          Section(
            children: [
              Text('How to review', style: text.titleMedium),
              Text('1. Open the source link and find the quoted sentence.\n2. Compare before → after field by field.\n3. Approve only what the source says. If unsure, reject and add a note; the fact stays as it is, marked "estimate".', style: text.bodySmall),
            ],
          ),
          const NoteBox(warn: true, title: 'Money, visas, recognition', body: 'These fields reach students directly. Approve only with the official page open next to you.'),
        ],
      ),
    );
  }
}

class _ChangeCard extends StatelessWidget {
  const _ChangeCard({required this.change, required this.sourceName, required this.note, required this.showJson, required this.busy, required this.onToggleJson, required this.onApprove, required this.onReject});
  final ChangeRequest change;
  final String sourceName;
  final TextEditingController note;
  final bool showJson, busy;
  final VoidCallback onToggleJson, onApprove, onReject;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final c = change;
    final conf = c.confidence == null ? null : (c.confidence! * 100).round();
    const enc = JsonEncoder.withIndent('  ');
    return NjiaCard(
      key: ValueKey('cr-${c.id}'),
      children: [
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.start,
          runSpacing: 8,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                OverLabel('${c.op.value} · ${c.targetCollection}'),
                Text(c.targetId, style: text.titleMedium),
                Text('Created ${formatDate(c.createdAt)}${c.extractedBy == null ? '' : ' · extracted by ${c.extractedBy}'}', style: text.bodySmall),
              ],
            ),
            Wrap(spacing: 8, children: [
              if (conf != null) NjiaBadge('$conf% confidence', tone: conf >= 85 ? BadgeTone.ok : conf >= 60 ? BadgeTone.warn : BadgeTone.bad),
              NjiaBadge(c.status.value, tone: BadgeTone.info),
            ]),
          ],
        ),
        // diff
        const OverLabel('Changes (before → after)'),
        if (c.diff.isEmpty) Text('No field-level diff recorded; compare the JSON below.', style: text.bodySmall),
        for (final d in c.diff)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: t.line))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 200, child: Text(d.path ?? '', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600))),
                Expanded(child: Text(_fmt(d.from), style: TextStyle(fontSize: 12, color: t.bad, decoration: TextDecoration.lineThrough))),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text('→', style: TextStyle(fontSize: 12))),
                Expanded(child: Text(_fmt(d.to), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: t.ok))),
              ],
            ),
          ),
        // evidence
        const OverLabel('Source'),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: t.subtle, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(sourceName, style: const TextStyle(fontWeight: FontWeight.w600)),
              if (c.evidence?.quote != null) Padding(padding: const EdgeInsets.only(top: 4), child: Text('“${c.evidence!.quote}”', style: const TextStyle(fontStyle: FontStyle.italic))),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Wrap(spacing: 12, crossAxisAlignment: WrapCrossAlignment.center, children: [
                  if (c.evidence?.fetchedAt != null) Text('Fetched ${formatDate(c.evidence!.fetchedAt)}', style: text.bodySmall),
                  if (c.evidence?.url != null) TextButton.icon(onPressed: () => launchUrl(Uri.parse(c.evidence!.url!), mode: LaunchMode.externalApplication), icon: const Icon(Icons.open_in_new_rounded, size: 14), label: const Text('Open source page')),
                ]),
              ),
            ],
          ),
        ),
        TextButton(onPressed: onToggleJson, child: Text(showJson ? 'Hide before / after JSON' : 'Show before / after JSON')),
        if (showJson)
          LayoutBuilder(
            builder: (context, cc) {
              final two = cc.maxWidth >= 640;
              final w = two ? (cc.maxWidth - 12) / 2 : cc.maxWidth;
              Widget box(String title, Object? v) => SizedBox(
                    width: w,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      OverLabel(title),
                      const SizedBox(height: 4),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: t.bg, border: Border.all(color: t.line), borderRadius: BorderRadius.circular(8)),
                        child: SelectableText(v == null ? '—' : enc.convert(v), style: const TextStyle(fontSize: 11, fontFamily: 'monospace')),
                      ),
                    ]),
                  );
              return Wrap(spacing: 12, runSpacing: 12, children: [box('Before', c.before), box('After', c.after)]);
            },
          ),
        Field(label: 'Note for the record (optional)', child: TextField(controller: note, decoration: const InputDecoration(hintText: 'e.g. verified on the official page on 4 Nov'))),
        Wrap(spacing: 8, runSpacing: 8, children: [
          FilledButton.icon(onPressed: busy ? null : onApprove, icon: const Icon(Icons.check_rounded, size: 16), label: const Text('Approve')),
          OutlinedButton.icon(style: OutlinedButton.styleFrom(foregroundColor: t.bad), onPressed: busy ? null : onReject, icon: const Icon(Icons.close_rounded, size: 16), label: const Text('Reject')),
        ]),
      ],
    );
  }

  static String _fmt(Object? v) => v == null ? '—' : v is String ? v : jsonEncode(v);
}
