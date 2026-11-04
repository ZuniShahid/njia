// Prototype `documents()`: counts by status, filter tabs, one row per document the route needs
// (from requirement proofs and permit checklists) merged with what the student uploaded; right
// panel: selected document, upload, "needed for", note. Files go to Firebase Storage.
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../app/router.dart';
import '../../app/theme.dart';
import '../../core/engine/engine.dart';
import '../../core/models/models.dart';
import '../../shared/format.dart';
import '../../shared/widgets/tabs.dart';
import '../../shared/widgets/ui.dart';
import '../../shared/widgets/view_scaffold.dart';

enum DocState { missing, uploaded, checked, expired }

const _stateLabel = {DocState.missing: 'Missing', DocState.uploaded: 'Uploaded', DocState.checked: 'Verified', DocState.expired: 'Expired'};
const _stateTone = {DocState.missing: BadgeTone.bad, DocState.uploaded: BadgeTone.info, DocState.checked: BadgeTone.ok, DocState.expired: BadgeTone.warn};

UserDocumentCategory categoryOf(String type) {
  final t = type.toLowerCase();
  if (t.contains('passport') || t.contains('birth') || t.contains('photo') || t == 'id') return UserDocumentCategory.identity;
  if (t.contains('ielts') || t.contains('language') || t.contains('german') || t.contains('french') || t.contains('toefl')) return UserDocumentCategory.language;
  if (t.contains('bank') || t.contains('blocked') || t.contains('funds') || t.contains('contract')) return UserDocumentCategory.finance;
  if (t.contains('visa') || t.contains('insurance')) return UserDocumentCategory.visa;
  if (t.contains('cv') || t.contains('reference') || t.contains('letter') && !t.contains('admission')) return UserDocumentCategory.career;
  if (t.contains('wassce') || t.contains('degree') || t.contains('transcript') || t.contains('admission') || t.contains('anabin') || t.contains('gmat') || t.contains('certificate')) return UserDocumentCategory.education;
  return UserDocumentCategory.other;
}

String docTypeLabel(String type) {
  final s = type.replaceAll('_', ' ');
  return s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
}

/// One line of the list: a document type the route needs and/or a document the student uploaded.
class DocRow {
  const DocRow({required this.type, required this.category, required this.neededFor, this.doc});
  final String type;
  final UserDocumentCategory category;
  final List<String> neededFor;
  final UserDocument? doc;
  DocState get state {
    final d = doc;
    if (d == null) return DocState.missing;
    if (d.status == UserDocumentStatus.expired) return DocState.expired;
    final exp = d.expiresAt == null ? null : DateTime.tryParse(d.expiresAt!.length == 7 ? '${d.expiresAt}-01' : d.expiresAt!);
    if (exp != null && exp.isBefore(DateTime.now())) return DocState.expired;
    return d.status == UserDocumentStatus.checked ? DocState.checked : DocState.uploaded;
  }
}

List<DocRow> buildDocRows({required List<UserDocument> docs, required Goal? goal, required ContentBundle? content}) {
  final needed = <String, List<String>>{};
  if (goal != null && content != null) {
    final permitById = {for (final p in content.residencePermits) p.id: p};
    final pathways = selectPathways(goal, content);
    for (final id in neededRequirementIds(pathways, permitById)) {
      final r = content.requirements.where((x) => x.id == id).firstOrNull;
      if (r?.evidenceDocType != null) needed.putIfAbsent(r!.evidenceDocType!, () => []).add(r.label.en);
    }
    for (final p in pathways) {
      for (final pid in p.unlocksPermitIds) {
        final permit = permitById[pid];
        if (permit == null) continue;
        for (final c in permit.checklist) {
          if (c.docType != null) needed.putIfAbsent(c.docType!, () => []).add(permit.name.en);
        }
      }
    }
  }
  final byType = <String, UserDocument>{};
  for (final d in docs) {
    if (d.type != null) byType.putIfAbsent(d.type!, () => d);
  }
  final rows = <DocRow>[
    for (final e in needed.entries) DocRow(type: e.key, category: categoryOf(e.key), neededFor: e.value.toSet().toList(), doc: byType[e.key]),
    for (final d in docs)
      if (d.type == null || !needed.containsKey(d.type)) DocRow(type: d.type ?? 'other', category: d.category ?? categoryOf(d.type ?? ''), neededFor: const [], doc: d),
  ];
  rows.sort((a, b) => a.category.index.compareTo(b.category.index));
  return rows;
}

class DocumentsView extends ConsumerStatefulWidget {
  const DocumentsView({super.key});

  @override
  ConsumerState<DocumentsView> createState() => _DocumentsViewState();
}

class _DocumentsViewState extends ConsumerState<DocumentsView> {
  DocState? _filter;
  String? _selected;
  bool _busy = false;

  Future<void> _upload(DocRow row) async {
    final uid = ref.read(currentUidProvider);
    if (uid == null) return;
    final picked = await FilePicker.pickFiles();
    final f = picked.firstOrNull;
    if (f == null) return;
    setState(() => _busy = true);
    try {
      final bytes = await f.readAsBytes();
      await ref.read(documentsRepositoryProvider).upload(uid, type: row.type, category: row.category, fileName: f.name, bytes: bytes);
      if (mounted) toast(context, 'Uploaded ${f.name}');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final docs = ref.watch(documentsProvider).value ?? const <UserDocument>[];
    final goal = ref.watch(activeGoalProvider);
    final content = goal?.countryId == null ? null : ref.watch(corridorBundleProvider(goal!.countryId!)).value;
    final rows = buildDocRows(docs: docs, goal: goal, content: content);
    int count(DocState s) => rows.where((r) => r.state == s).length;
    final list = rows.where((r) => _filter == null || r.state == _filter).toList();
    final sel = rows.where((r) => r.type == _selected).firstOrNull ?? rows.firstOrNull;

    return ViewScaffold(
      center: [
        PageHead(
          over: 'Support',
          title: 'Documents',
          caption: 'Everything your path needs, in one place.',
          actions: [
            FilledButton.icon(
              onPressed: _busy || sel == null ? null : () => _upload(sel),
              icon: const Icon(Icons.add_rounded, size: 14),
              label: Text(sel == null ? 'Upload document' : 'Upload ${docTypeLabel(sel.type)}'),
            ),
          ],
        ),
        LayoutBuilder(
          builder: (context, c) {
            final cols = c.maxWidth >= 640 ? 4 : 2;
            final w = (c.maxWidth - 16 * (cols - 1)) / cols;
            return Wrap(spacing: 16, runSpacing: 16, children: [
              for (final s in DocState.values)
                SizedBox(width: w, child: StatTile(label: _stateLabel[s]!, value: '${count(s)}', valueColor: switch (s) { DocState.checked => t.ok, DocState.uploaded => t.info, DocState.expired => t.warn, DocState.missing => t.bad })),
            ]);
          },
        ),
        NjiaCard(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 4),
          gap: 0,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: NjiaTabs<DocState?>(
                tabs: [(null, 'All'), for (final s in DocState.values) (s, _stateLabel[s]!)],
                value: _filter,
                onChanged: (v) => setState(() => _filter = v),
              ),
            ),
            for (final r in list)
              Material(
                color: sel?.type == r.type ? t.brandSoft : Colors.transparent,
                child: InkWell(
                  onTap: () => setState(() => _selected = r.type),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    decoration: BoxDecoration(border: Border(top: BorderSide(color: t.line))),
                    child: Row(
                      children: [
                        const IconBox(Icons.description_outlined),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(docTypeLabel(r.type), style: const TextStyle(fontWeight: FontWeight.w700)),
                              Text('${r.category.value} · ${r.doc == null ? 'no file yet' : '${r.doc!.fileName ?? r.doc!.name ?? ''} · ${formatDate(r.doc!.uploadedAt)}'}${r.doc?.expiresAt == null ? '' : ' · expires ${r.doc!.expiresAt}'}', style: text.bodySmall),
                            ],
                          ),
                        ),
                        NjiaBadge(_stateLabel[r.state]!, tone: _stateTone[r.state]!),
                      ],
                    ),
                  ),
                ),
              ),
            if (list.isEmpty) Padding(padding: const EdgeInsets.all(20), child: Text('Nothing here.', style: text.bodySmall)),
          ],
        ),
        Text('Files are stored in your private folder in the EU (Firebase Storage, europe-west1). Only you and reviewers you ask can see them.', style: text.bodySmall),
      ],
      right: sel == null
          ? [Text('No documents on your route yet.', style: text.bodySmall)]
          : [
              Row(children: [NjiaBadge(sel.category.value), const Spacer(), NjiaBadge(_stateLabel[sel.state]!, tone: _stateTone[sel.state]!)]),
              Section(
                gap: 4,
                children: [
                  Text(docTypeLabel(sel.type), style: text.titleLarge),
                  Text(sel.doc == null ? 'No file yet' : '${sel.doc!.fileName ?? sel.doc!.name ?? ''} · uploaded ${formatDate(sel.doc!.uploadedAt)}${sel.doc!.expiresAt == null ? '' : ' · expires ${sel.doc!.expiresAt}'}', style: text.bodySmall),
                ],
              ),
              if (sel.state == DocState.missing || sel.state == DocState.expired)
                FilledButton(onPressed: _busy ? null : () => _upload(sel), child: Text('Upload ${docTypeLabel(sel.type)}'))
              else if (sel.category == UserDocumentCategory.career)
                OutlinedButton(onPressed: () => context.go(Routes.coach), child: const Text('Review with Study coach')),
              if (sel.doc != null)
                TextButton.icon(
                  onPressed: () async {
                    final uid = ref.read(currentUidProvider);
                    if (uid != null && sel.doc!.id != null) await ref.read(documentsRepositoryProvider).delete(uid, sel.doc!.id!);
                  },
                  icon: const Icon(Icons.delete_outline_rounded, size: 14),
                  label: const Text('Remove file'),
                ),
              Section(
                children: [
                  const OverLabel('Needed for'),
                  if (sel.neededFor.isEmpty) Text('Not required by your current route.', style: text.bodySmall),
                  for (final n in sel.neededFor) Row(children: [const IconBox(Icons.route_outlined), const SizedBox(width: 10), Expanded(child: Text(n, style: const TextStyle(fontSize: 12)))]),
                ],
              ),
              const NoteBox(warn: false, title: 'Keep originals safe', body: 'Embassies and uni-assist usually want certified copies. Keep originals at home.'),
            ],
    );
  }
}
