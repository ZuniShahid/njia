// Prototype `jobs()`: search + filters, job cards with match %, salary (estimate flag), source and
// fetched date, save / open original posting; right panel: saved jobs, "for these filters", pay note.
// Postings come from the `jobs` collection (API imports only, rule 4); nothing is generated here.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/providers.dart';
import '../../app/router.dart';
import '../../app/theme.dart';
import '../../core/engine/roadmap_model.dart';
import '../../core/models/models.dart';
import '../../shared/format.dart';
import '../../shared/widgets/tabs.dart';
import '../../shared/widgets/ui.dart';
import '../../shared/widgets/view_scaffold.dart';
import '../profile/profile_constants.dart';

enum JobSort { match, pay, newest }

const jobLevelLabel = {JobLevel.internship: 'Internship', JobLevel.entry: 'Entry', JobLevel.mid: 'Mid', JobLevel.senior: 'Senior'};

/// Yearly EUR estimate of a salary range (midpoint); null when not EUR or missing.
double? yearlyEur(MoneyRange? s) {
  if (s == null || s.currency != 'EUR') return null;
  final mid = (s.min + s.max) / 2;
  return s.period == MoneyPeriod.month ? mid * 12 : mid;
}

/// Match 3–97 from occupation, country, level vs. roadmap position, language and sponsorship.
({int score, List<String> have, List<String> gaps}) jobMatch(Job j, {required Goal goal, required UserProfile profile, RoadmapModel? roadmap}) {
  var s = 20;
  final have = <String>[], gaps = <String>[];
  if (j.occupationId != null && j.occupationId == goal.occupationId) {
    s += 35;
    have.add('Occupation matches your goal');
  } else {
    gaps.add('Different occupation than your goal');
  }
  if (j.countryId == goal.countryId) s += 15;
  final lang = j.languageRequired;
  if (lang != null) {
    final have0 = profile.languages.where((l) => l.lang == lang && (l.native == true || (l.cefr != null && l.cefr!.index >= Cefr.b1.index))).isNotEmpty;
    if (have0) {
      s += 15;
      have.add('${languageName(lang)} ${profile.languages.firstWhere((l) => l.lang == lang).native == true ? 'native' : 'B1+'}');
    } else {
      gaps.add('${languageName(lang)} B1 or better');
    }
  }
  final done = roadmap?.stepsDone ?? 0;
  final total = roadmap?.stepsTotal ?? 1;
  final progress = total == 0 ? 0.0 : done / total;
  final levelFit = switch (j.level) {
    JobLevel.internship => progress < 0.5 ? 15 : 5,
    JobLevel.entry => progress < 0.75 ? 10 : 15,
    JobLevel.mid => progress > 0.5 ? 10 : -5,
    JobLevel.senior => progress > 0.8 ? 10 : -15,
    null => 0,
  };
  s += levelFit;
  if (j.level == JobLevel.mid || j.level == JobLevel.senior) gaps.add(j.level == JobLevel.senior ? 'Several years of experience and a leadership record' : 'A few years of experience');
  if (j.visaSponsorship == JobVisaSponsorship.yes) {
    s += 10;
    have.add('Visa sponsorship offered');
  } else if (j.visaSponsorship == JobVisaSponsorship.no) {
    gaps.add('No visa sponsorship stated');
  }
  if (have.isEmpty) have.add('Field fits your route');
  return (score: s.clamp(3, 97), have: have, gaps: gaps);
}

class JobsView extends ConsumerStatefulWidget {
  const JobsView({super.key, this.initialQuery});
  final String? initialQuery;

  @override
  ConsumerState<JobsView> createState() => _JobsViewState();
}

class _JobsViewState extends ConsumerState<JobsView> {
  late String _q = widget.initialQuery ?? '';
  String? _country;
  JobLevel? _level;
  JobSort _sort = JobSort.match;
  double _minPay = 0;
  bool _onRoadmap = false;
  int _shown = 8;
  String? _open;

  @override
  Widget build(BuildContext context) {
    final goal = ref.watch(activeGoalProvider);
    final profile = ref.watch(profileProvider).value;
    final jobs = ref.watch(jobsProvider);
    final text = Theme.of(context).textTheme;
    final t = context.tokens;
    final roadmap = ref.watch(roadmapProvider).value;
    final countries = ref.watch(countriesProvider).value ?? const <Country>[];
    final progress = roadmap?.progress ?? const <String, dynamic>{};
    final saved = Map<String, dynamic>.from(progress['savedJobs'] as Map? ?? const {});
    final goalId = goal?.id;

    return jobs.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => ViewScaffold(center: [PageHead(over: 'Go global', title: 'Jobs', caption: '$e')]),
      data: (all) {
        final scored = [
          for (final j in all)
            (job: j, match: goal == null || profile == null ? (score: 50, have: <String>[], gaps: <String>[]) : jobMatch(j, goal: goal, profile: profile, roadmap: roadmap)),
        ];
        final q = _q.toLowerCase();
        var list = scored.where((x) {
          final j = x.job;
          final pay = yearlyEur(j.salary) ?? 0;
          return (_country == null || j.countryId == _country) &&
              (_level == null || j.level == _level) &&
              pay >= _minPay &&
              (!_onRoadmap || (j.occupationId != null && j.occupationId == goal?.occupationId)) &&
              (q.isEmpty || '${j.title} ${j.employer ?? ''} ${j.city ?? ''} ${j.countryId}'.toLowerCase().contains(q));
        }).toList();
        list.sort((a, b) => switch (_sort) {
              JobSort.match => b.match.score.compareTo(a.match.score),
              JobSort.pay => (yearlyEur(b.job.salary) ?? 0).compareTo(yearlyEur(a.job.salary) ?? 0),
              JobSort.newest => (b.job.postedAt ?? '').compareTo(a.job.postedAt ?? ''),
            });
        final shown = list.take(_shown).toList();
        final pays = list.map((x) => yearlyEur(x.job.salary)).whereType<double>().toList();
        final avg = pays.isEmpty ? null : pays.reduce((a, b) => a + b) / pays.length;
        final savedJobs = scored.where((x) => saved[x.job.id] == true).toList();

        return ViewScaffold(
          center: [
            PageHead(over: 'Go global', title: 'Jobs', caption: goal == null ? 'Add a goal to match jobs against it.' : 'Matched to: ${goal.title ?? ''}${goal.employer == null ? '' : ' · ${goal.employer}'}'),
            NjiaCard(
              children: [
                FormGrid(children: [
                  Field(label: 'Search', child: TextFormField(initialValue: _q, decoration: const InputDecoration(hintText: 'Title, company, city'), onChanged: (v) => setState(() => _q = v))),
                  SelectField<String?>(label: 'Country', value: _country, items: [(null, 'All'), for (final c in countries) (c.id, c.name.en)], onChanged: (v) => setState(() => _country = v)),
                  SelectField<JobLevel?>(label: 'Level', value: _level, items: [(null, 'All'), for (final e in jobLevelLabel.entries) (e.key, e.value)], onChanged: (v) => setState(() => _level = v)),
                  SelectField<JobSort>(label: 'Sort', value: _sort, items: const [(JobSort.match, 'Best match'), (JobSort.pay, 'Highest pay'), (JobSort.newest, 'Newest')], onChanged: (v) => setState(() => _sort = v ?? JobSort.match)),
                ]),
                Wrap(
                  spacing: 20,
                  runSpacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: [
                    SizedBox(
                      width: 320,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [Expanded(child: Text('Minimum pay (per year, EUR)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: t.muted))), Text(_minPay > 0 ? '${formatMoney(_minPay, 'EUR')}+' : 'Any', style: const TextStyle(fontWeight: FontWeight.w700))]),
                          Slider(value: _minPay, min: 0, max: 120000, divisions: 60, onChanged: (v) => setState(() => _minPay = v)),
                        ],
                      ),
                    ),
                    Row(mainAxisSize: MainAxisSize.min, children: [Switch(value: _onRoadmap, onChanged: (v) => setState(() => _onRoadmap = v)), const SizedBox(width: 8), Text('On my roadmap', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: t.muted))]),
                  ],
                ),
              ],
            ),
            Text(all.isEmpty ? 'No postings in the job feed yet. Jobs arrive daily from Adzuna and partner feeds once the import is connected.' : '${list.length} jobs match · showing ${shown.length}', style: text.bodySmall),
            Section(
              children: [
                for (final x in shown)
                  _JobItem(
                    job: x.job,
                    match: x.match,
                    saved: saved[x.job.id] == true,
                    open: _open == x.job.id,
                    workStepKey: roadmap?.steps.where((s) => s.kind == PlanStepKind.work).firstOrNull?.key,
                    onToggle: () => setState(() => _open = _open == x.job.id ? null : x.job.id),
                    onSave: goalId == null ? null : () => saveProgress(ref, goalId: goalId, section: 'savedJobs', key: x.job.id, value: saved[x.job.id] == true ? null : true),
                  ),
                if (shown.isEmpty && all.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(border: Border.all(color: t.lineStrong, width: 1.5), borderRadius: BorderRadius.circular(NjiaTokens.radius)),
                    child: Column(children: [const Text('No jobs match', style: TextStyle(fontWeight: FontWeight.w700)), Text('Lower the minimum pay or change the country.', style: text.bodySmall)]),
                  ),
              ],
            ),
            if (list.length > _shown)
              Center(child: OutlinedButton(onPressed: () => setState(() => _shown += 8), child: Text('Load more jobs (${(list.length - _shown).clamp(0, 8)} more)'))),
          ],
          right: [
            Section(
              children: [
                Text('Saved jobs', style: text.titleMedium),
                if (savedJobs.isEmpty) Text('Save jobs to compare them later.', style: text.bodySmall),
                for (final x in savedJobs)
                  InkWell(
                    onTap: () => setState(() => _open = x.job.id),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(children: [
                        _Logo(x.job.employer ?? x.job.title, size: 32),
                        const SizedBox(width: 10),
                        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(x.job.title, style: const TextStyle(fontWeight: FontWeight.w600)), Text('${x.job.employer ?? ''}${yearlyEur(x.job.salary) == null ? '' : ' · ${formatMoney(yearlyEur(x.job.salary)!, 'EUR')}'}', style: text.bodySmall)])),
                        NjiaBadge('${x.match.score}%'),
                      ]),
                    ),
                  ),
              ],
            ),
            Section(
              children: [
                Text('For these filters', style: text.titleMedium),
                KeyValueRow('Average pay (EUR, per year)', avg == null ? '—' : formatMoney(avg, 'EUR')),
                KeyValueRow('On your roadmap', '${list.where((x) => x.job.occupationId != null && x.job.occupationId == goal?.occupationId).length}'),
                KeyValueRow('Strong matches (70%+)', '${list.where((x) => x.match.score >= 70).length}'),
              ],
            ),
            const NoteBox(warn: false, title: 'About pay', body: 'Pay comes from the posting. "Estimate" means the feed estimated it; check the original posting for the real figure. The match score is never for sale.'),
          ],
        );
      },
    );
  }
}

class _JobItem extends StatelessWidget {
  const _JobItem({required this.job, required this.match, required this.saved, required this.open, required this.workStepKey, required this.onToggle, required this.onSave});
  final Job job;
  final ({int score, List<String> have, List<String> gaps}) match;
  final bool saved, open;
  final String? workStepKey;
  final VoidCallback onToggle;
  final VoidCallback? onSave;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final j = job;
    final yearly = yearlyEur(j.salary);
    final salaryText = j.salary == null ? 'Pay not stated' : '${formatMoney(j.salary!.min, j.salary!.currency)} – ${formatMoney(j.salary!.max, j.salary!.currency)}${j.salary!.period == null ? '' : ' / ${j.salary!.period!.value}'}';
    final m = match.score;
    final posted = j.postedAt == null ? null : DateTime.tryParse(j.postedAt!);
    final days = posted == null ? null : DateTime.now().difference(posted).inDays;
    return Container(
      decoration: BoxDecoration(color: t.surface, borderRadius: BorderRadius.circular(NjiaTokens.radius), border: Border.all(color: open ? t.brand : t.line, width: open ? 2 : 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(NjiaTokens.radius),
            onTap: onToggle,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Logo(j.employer ?? j.title),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(spacing: 8, crossAxisAlignment: WrapCrossAlignment.center, children: [Text(j.title, style: const TextStyle(fontWeight: FontWeight.w700)), if (saved) const NjiaBadge('Saved', tone: BadgeTone.brand)]),
                        Text('${j.employer ?? 'Employer not stated'} · ${[j.city, j.countryId].where((x) => x != null && x.isNotEmpty).join(', ')}${j.level == null ? '' : ' · ${jobLevelLabel[j.level]}'}', style: text.bodySmall),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [Text(yearly == null ? '—' : formatMoney(yearly, 'EUR'), style: const TextStyle(fontWeight: FontWeight.w700)), Text(j.salaryIsEstimate == true ? 'est. / year' : '/ year', style: text.bodySmall)]),
                  const SizedBox(width: 10),
                  NjiaBadge('$m%', tone: m >= 70 ? BadgeTone.ok : m >= 45 ? BadgeTone.brand : BadgeTone.neutral),
                  Icon(open ? Icons.expand_less_rounded : Icons.expand_more_rounded, color: t.muted),
                ],
              ),
            ),
          ),
          if (open)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: t.line, height: 1),
                  const SizedBox(height: 14),
                  Wrap(spacing: 8, runSpacing: 8, children: [
                    NjiaBadge(salaryText + (j.salaryIsEstimate == true ? ' · estimate' : ''), tone: j.salaryIsEstimate == true ? BadgeTone.warn : BadgeTone.neutral),
                    NjiaBadge('via ${j.source}${j.postedAt == null ? '' : ' · ${formatDate(j.postedAt)}'}'),
                    if (days != null) NjiaBadge('$days days ago'),
                    if (j.visaSponsorship != null) NjiaBadge('Visa sponsorship: ${j.visaSponsorship!.value}', tone: j.visaSponsorship == JobVisaSponsorship.yes ? BadgeTone.ok : BadgeTone.neutral),
                    if (j.languageRequired != null) NjiaBadge('Language: ${languageName(j.languageRequired)}'),
                  ]),
                  const SizedBox(height: 14),
                  LayoutBuilder(
                    builder: (context, c) {
                      final cols = c.maxWidth >= 640 ? 3 : 1;
                      final w = (c.maxWidth - 20 * (cols - 1)) / cols;
                      return Wrap(spacing: 20, runSpacing: 16, children: [
                        SizedBox(width: w, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const OverLabel('You have'), const SizedBox(height: 6), for (final h in match.have) Padding(padding: const EdgeInsets.only(bottom: 6), child: Row(children: [const StatusMark(2), const SizedBox(width: 10), Expanded(child: Text(h, style: const TextStyle(fontSize: 12)))]))])),
                        SizedBox(width: w, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const OverLabel('Gaps'), const SizedBox(height: 6), if (match.gaps.isEmpty) Text('None we can see.', style: text.bodySmall), for (final g in match.gaps) Padding(padding: const EdgeInsets.only(bottom: 6), child: Row(children: [const StatusMark(0), const SizedBox(width: 10), Expanded(child: Text(g, style: const TextStyle(fontSize: 12)))]))])),
                        SizedBox(width: w, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [OverLabel('Match $m%'), const SizedBox(height: 6), ProgressBar(m / 100), const SizedBox(height: 6), Text(m >= 70 ? 'Good fit. Apply now.' : m >= 45 ? 'Reachable with the gaps on the left.' : 'Long-term target.', style: text.bodySmall)])),
                      ]);
                    },
                  ),
                  const SizedBox(height: 14),
                  Wrap(spacing: 8, runSpacing: 8, children: [
                    if (onSave != null) (saved ? OutlinedButton(onPressed: onSave, child: const Text('Saved ✓')) : FilledButton(onPressed: onSave, child: const Text('Save job'))),
                    if (j.url != null) OutlinedButton.icon(onPressed: () => launchUrl(Uri.parse(j.url!), mode: LaunchMode.externalApplication), icon: const Icon(Icons.open_in_new_rounded, size: 14), label: const Text('Open original posting')),
                    if (workStepKey != null) TextButton(onPressed: () => context.go('${Routes.roadmap}?step=${Uri.encodeComponent(workStepKey!)}'), child: const Text('See the work step')),
                  ]),
                  const SizedBox(height: 6),
                  Text('Applications go to the employer on ${j.source}. Njia never charges for placement.', style: text.bodySmall),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo(this.name, {this.size = 40});
  final String name;
  final double size;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: t.brandSoft, borderRadius: BorderRadius.circular(10)),
      child: Text(Avatar.initials(name), style: TextStyle(fontSize: size * 0.33, fontWeight: FontWeight.w700, color: t.brand)),
    );
  }
}
