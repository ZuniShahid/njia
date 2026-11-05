// Prototype `milestone()`: checklist of the current phase grouped by area, each item with status,
// due date and help buttons; milestone selector and filter chips. Right panel: donut, help &
// tutoring preferences, tutors & mentors from the `providers` collection.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/providers.dart';
import '../../app/router.dart';
import '../../app/theme.dart';
import '../../core/engine/milestone_model.dart';
import '../../core/engine/roadmap_model.dart';
import '../../core/models/models.dart';
import '../../shared/format.dart';
import '../../shared/widgets/provenance_chip.dart';
import '../../shared/widgets/ui.dart';
import '../../shared/widgets/view_scaffold.dart';
import '../assistant/assistant.dart';

enum _Filter { all, open, soon, done }

class MilestoneView extends ConsumerStatefulWidget {
  const MilestoneView({super.key});

  @override
  ConsumerState<MilestoneView> createState() => _MilestoneViewState();
}

class _MilestoneViewState extends ConsumerState<MilestoneView> {
  int? _phaseIndex;
  _Filter _filter = _Filter.all;
  final _openGroups = <String>{};
  bool _groupsInit = false;
  String? _openItem;

  @override
  Widget build(BuildContext context) {
    final goal = ref.watch(activeGoalProvider);
    if (goal == null) {
      return const ViewScaffold(center: [PageHead(over: 'Next milestone', title: 'No goal yet', caption: 'Add a goal; the checklist follows from its roadmap.')]);
    }
    final roadmap = ref.watch(roadmapProvider);
    return roadmap.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => ViewScaffold(center: [PageHead(over: 'Next milestone', title: 'Milestone', caption: '$e')]),
      data: (rm) => rm == null ? const Center(child: CircularProgressIndicator()) : _build(context, rm),
    );
  }

  Widget _build(BuildContext context, RoadmapModel rm) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final phase = rm.phases.where((p) => p.index == _phaseIndex).firstOrNull ?? rm.currentPhase;
    final m = MilestoneModel.build(rm, phase: phase);
    if (!_groupsInit) {
      final first = m.groups.where((g) => g.items.any((i) => !i.done)).firstOrNull;
      if (first != null) _openGroups.add(first.key);
      _groupsInit = true;
    }
    bool pass(MilestoneItem it) => switch (_filter) {
          _Filter.all => true,
          _Filter.open => !it.done,
          _Filter.soon => !it.done && it.due < m.today + 1,
          _Filter.done => it.done,
        };
    final goalId = rm.goal.id!;

    return ViewScaffold(
      center: [
        PageHead(
          over: 'Next milestone',
          title: m.title,
          caption: '${formatYear(m.due)} · ${m.monthsLeft} months to go · ${m.done} of ${m.total} done',
          actions: [
            SizedBox(
              width: 260,
              child: SelectField<int>(
                label: 'Milestone',
                value: phase.index,
                items: [for (final p in rm.phases) (p.index, '${p.isMove ? p.name.split(' · ').first : p.shortName} · ${formatYear(p.end)}')],
                onChanged: (v) => setState(() {
                  _phaseIndex = v;
                  _groupsInit = false;
                  _openGroups.clear();
                }),
              ),
            ),
          ],
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final (f, label) in const [(_Filter.all, 'All'), (_Filter.open, 'Open'), (_Filter.soon, 'Due in 12 months'), (_Filter.done, 'Done')])
              ToggleChip(label: label, selected: _filter == f, onTap: () => setState(() => _filter = f)),
          ],
        ),
        Section(
          children: [
            for (final g in m.groups)
              if (g.items.any(pass))
                AccordionItem(
                  title: g.name,
                  subtitle: '${g.done} of ${g.items.length} done',
                  open: _openGroups.contains(g.key),
                  onToggle: () => setState(() => _openGroups.contains(g.key) ? _openGroups.remove(g.key) : _openGroups.add(g.key)),
                  body: Column(
                    children: [
                      for (final (i, it) in g.items.where(pass).indexed)
                        _Item(
                          item: it,
                          today: m.today,
                          first: i == 0,
                          open: _openItem == it.key,
                          onToggleOpen: () => setState(() => _openItem = _openItem == it.key ? null : it.key),
                          onStatus: (v) => saveProgress(ref, goalId: goalId, section: it.section, key: it.key, value: v),
                        ),
                    ],
                  ),
                ),
            if (m.groups.isEmpty) Text('Nothing to do in this phase.', style: text.bodySmall),
          ],
        ),
      ],
      right: [
        Row(
          children: [
            _Donut(fraction: m.total == 0 ? 0 : m.done / m.total),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${m.done} of ${m.total} done', style: text.titleMedium),
                  RichText(
                    text: TextSpan(
                      style: text.bodySmall,
                      children: [
                        if (m.overdue > 0) ...[TextSpan(text: '${m.overdue} overdue', style: TextStyle(color: t.bad, fontWeight: FontWeight.w600)), const TextSpan(text: ' · ')],
                        TextSpan(text: '${m.monthsLeft} months to go'),
                      ],
                    ),
                  ),
                  Text('Tick items as you go. Expand one for help.', style: text.bodySmall),
                ],
              ),
            ),
          ],
        ),
        _HelpPreferences(profile: ref.watch(profileProvider).value),
        _Tutors(model: m),
      ],
    );
  }
}

class _Item extends ConsumerWidget {
  const _Item({required this.item, required this.today, required this.first, required this.open, required this.onToggleOpen, required this.onStatus});
  final MilestoneItem item;
  final double today;
  final bool first;
  final bool open;
  final VoidCallback onToggleOpen;
  final ValueChanged<int> onStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final it = item;
    final overdue = it.isOverdue(today);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(border: first ? null : Border(top: BorderSide(color: t.line))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Semantics(
                checked: it.done,
                label: 'Mark done',
                child: InkWell(
                  key: ValueKey('ms-${it.key}'),
                  borderRadius: BorderRadius.circular(5),
                  onTap: () => onStatus(it.done ? 0 : 2),
                  child: Container(
                    width: 18,
                    height: 18,
                    margin: const EdgeInsets.only(top: 2),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: it.status == 2 ? t.brand : it.status == 1 ? t.warnSoft : t.surface,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: it.status == 2 ? t.brand : it.status == 1 ? t.warn : t.lineStrong, width: 1.5),
                    ),
                    child: it.status == 0 ? null : Text(it.status == 2 ? '✓' : '…', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: it.status == 2 ? t.onBrand : t.warn, height: 1)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: InkWell(
                  onTap: onToggleOpen,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(it.title, style: TextStyle(fontWeight: FontWeight.w500, decoration: it.done ? TextDecoration.lineThrough : null, color: it.done ? t.muted : t.ink)),
                            Text('${overdue ? 'Overdue · ' : ''}by ${formatYear(it.due)}', style: text.bodySmall?.copyWith(color: overdue ? t.bad : null, fontWeight: overdue ? FontWeight.w600 : null)),
                          ],
                        ),
                      ),
                      Icon(open ? Icons.expand_less_rounded : Icons.expand_more_rounded, size: 16, color: t.muted),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (open)
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (it.how != null && it.how!.isNotEmpty) Text(it.how!),
                  if (it.requirement != null) Padding(padding: const EdgeInsets.only(top: 6), child: ProvenanceChip(it.requirement!.provenance)),
                  const SizedBox(height: 10),
                  Segmented<int>(options: const [(0, 'Not started'), (1, 'In progress'), (2, 'Done')], value: it.status, onChanged: onStatus),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      if (it.help.contains('coach')) OutlinedButton.icon(onPressed: () => ref.read(assistantProvider.notifier).openAbout(it.title, {if (it.stepKey != null) 'stepKey': it.stepKey}), icon: const Icon(Icons.chat_bubble_outline_rounded, size: 14), label: const Text('Ask coach')),
                      if (it.help.contains('tutor')) OutlinedButton.icon(onPressed: () => Scrollable.ensureVisible(context), icon: const Icon(Icons.people_outline_rounded, size: 14), label: const Text('Find a tutor')),
                      if (it.help.contains('guide')) OutlinedButton.icon(onPressed: () => context.go(it.section == 'checks' || it.key.startsWith('visa') ? Routes.visa : '${Routes.roadmap}?step=${Uri.encodeComponent(it.stepKey ?? '')}'), icon: const Icon(Icons.info_outline_rounded, size: 14), label: const Text('Read guide')),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _Donut extends StatelessWidget {
  const _Donut({required this.fraction});
  final double fraction;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(width: 120, height: 120, child: CircularProgressIndicator(value: fraction, strokeWidth: 12, backgroundColor: t.subtle, color: t.brand, strokeCap: StrokeCap.round)),
          Text('${(fraction * 100).round()}%', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

const helpStyles = ['Chat coach', 'Human mentor', 'Group sessions', 'Peer buddy'];
const helpSubjects = ['IELTS', 'German', 'French', 'Maths', 'CV & letters', 'Mentoring', 'Study group'];
const helpAvailability = ['Mornings', 'Evenings', 'Weekends'];

class _HelpPreferences extends ConsumerWidget {
  const _HelpPreferences({required this.profile});
  final UserProfile? profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = Theme.of(context).textTheme;
    final h = profile?.helpPreferences ?? const HelpPreferences();
    Future<void> save(HelpPreferences next) async {
      final uid = ref.read(currentUidProvider);
      if (uid != null) await ref.read(userRepositoryProvider).updateProfile(uid, {'helpPreferences': next.toJson()});
    }

    List<String> toggle(List<String> list, String v) => list.contains(v) ? ([...list]..remove(v)) : [...list, v];
    Widget chips(String label, List<String> options, List<String> selected, ValueChanged<List<String>> onChanged) => Field(
          label: label,
          child: Wrap(spacing: 6, runSpacing: 6, children: [for (final o in options) ToggleChip(label: o, selected: selected.contains(o), onTap: () => onChanged(toggle(selected, o)))]),
        );
    return Section(
      children: [
        Text('Help & tutoring', style: text.titleMedium),
        FormGrid(children: [
          SelectField<HelpPreferencesChannel>(
            label: 'Reminders via',
            value: h.channel ?? HelpPreferencesChannel.whatsapp,
            items: const [(HelpPreferencesChannel.whatsapp, 'WhatsApp'), (HelpPreferencesChannel.sms, 'SMS'), (HelpPreferencesChannel.email, 'Email'), (HelpPreferencesChannel.app, 'In the app')],
            onChanged: (v) => save(h.copyWith(channel: v)),
          ),
          SelectField<HelpPreferencesFrequency>(
            label: 'How often',
            value: h.frequency ?? HelpPreferencesFrequency.weekly,
            items: const [(HelpPreferencesFrequency.weekly, 'Weekly'), (HelpPreferencesFrequency.biweekly, 'Every 2 weeks'), (HelpPreferencesFrequency.monthly, 'Monthly')],
            onChanged: (v) => save(h.copyWith(frequency: v)),
          ),
        ]),
        chips('How you like to get help', helpStyles, h.styles, (v) => save(h.copyWith(styles: v))),
        chips('Tutoring in', helpSubjects, h.subjects, (v) => save(h.copyWith(subjects: v))),
        chips("When you're free", helpAvailability, h.availability, (v) => save(h.copyWith(availability: v))),
        Row(children: [Expanded(child: Text('Budget per session', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: context.tokens.muted))), Text((h.budgetPerSession ?? 0) > 0 ? 'up to €${h.budgetPerSession}' : 'free only', style: const TextStyle(fontWeight: FontWeight.w700))]),
        Slider(value: (h.budgetPerSession ?? 0).toDouble().clamp(0, 15), min: 0, max: 15, divisions: 15, onChanged: (_) {}, onChangeEnd: (v) => save(h.copyWith(budgetPerSession: v.round()))),
        SelectField<String>(label: 'Language of support', value: h.language ?? 'English', items: const [('English', 'English'), ('Krio', 'Krio'), ('French', 'French')], onChanged: (v) => save(h.copyWith(language: v))),
      ],
    );
  }
}

/// Providers whose `services` cover an open requirement of this milestone (or the chosen subjects).
class _Tutors extends ConsumerWidget {
  const _Tutors({required this.model});
  final MilestoneModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final providers = ref.watch(providersProvider).value ?? const <ServiceProvider>[];
    final openReqs = model.items.where((i) => !i.done && i.requirement != null).map((i) => i.requirement!.id).toSet();
    final subjects = (ref.watch(profileProvider).value?.helpPreferences?.subjects ?? const []).map((s) => s.toLowerCase()).toList();
    final list = providers.where((p) {
      final byReq = p.services.any(openReqs.contains);
      final bySubject = subjects.any((s) => p.services.any((x) => x.contains(s.split(' ').first)) || p.name.toLowerCase().contains(s));
      return byReq || bySubject;
    }).toList();
    return Section(
      children: [
        Text('Tutors & mentors for you', style: text.titleMedium),
        if (list.isEmpty) Text('No match yet. Add a subject under Help & tutoring.', style: text.bodySmall),
        for (final p in list)
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(color: t.line), borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Avatar(p.name),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(p.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                      Text('${p.type.value.replaceAll('_', ' ')} · ${p.online == true ? 'online' : p.countryIds.join(', ')} · ${p.priceFrom == null ? 'price on request' : 'from ${formatMoney(p.priceFrom!.amount, p.priceFrom!.currency)}'}', style: text.bodySmall),
                      Wrap(spacing: 6, children: [
                        NjiaBadge(p.verification.value.replaceAll('_', ' '), tone: p.verification == ServiceProviderVerification.verified ? BadgeTone.ok : BadgeTone.neutral),
                        ProvenanceChip(p.provenance),
                      ]),
                    ],
                  ),
                ),
                if (p.contact?.url != null)
                  TextButton(onPressed: () => launchUrl(Uri.parse(p.contact!.url!), mode: LaunchMode.externalApplication), child: const Text('Contact')),
              ],
            ),
          ),
        Text('Helpers are checked before they appear; "unverified" means not checked yet. Students never pay for job placement.', style: text.bodySmall),
      ],
    );
  }
}
