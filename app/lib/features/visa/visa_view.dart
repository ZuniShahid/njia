// Prototype `visa()`: destination selector, one tab per permit type, fact tiles (where to apply,
// processing, fee, proof of money) each with provenance, requirements table with tap-to-change
// status, source line, application checklist, trust alerts; right panel: donut, cost to apply.
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../app/router.dart';
import '../../app/theme.dart';
import '../../core/engine/engine.dart';
import '../../core/models/models.dart';
import '../../shared/format.dart';
import '../../shared/widgets/provenance_chip.dart';
import '../../shared/widgets/tabs.dart';
import '../../shared/widgets/ui.dart';
import '../../shared/widgets/view_scaffold.dart';

const _permitOrder = [PermitType.student, PermitType.jobSeeker, PermitType.work, PermitType.blueCard, PermitType.trainee, PermitType.researcher, PermitType.languageCourse, PermitType.family];

String permitLabel(PermitType t) => switch (t) {
      PermitType.student => 'Student visa',
      PermitType.jobSeeker => 'After graduation',
      PermitType.work => 'Work permit',
      PermitType.blueCard => 'EU Blue Card',
      PermitType.trainee => 'Trainee',
      PermitType.researcher => 'Researcher',
      PermitType.languageCourse => 'Language course',
      PermitType.family => 'Family',
    };

class VisaView extends ConsumerStatefulWidget {
  const VisaView({super.key});

  @override
  ConsumerState<VisaView> createState() => _VisaViewState();
}

class _VisaViewState extends ConsumerState<VisaView> {
  String? _country;
  String? _permitId;

  @override
  Widget build(BuildContext context) {
    final goal = ref.watch(activeGoalProvider);
    final countries = ref.watch(countriesProvider).value ?? const <Country>[];
    final text = Theme.of(context).textTheme;
    final home = goal?.countryId == null || goal!.countryId == 'SL';
    final country = _country ?? (home ? 'DE' : goal.countryId!);
    final bundle = ref.watch(corridorBundleProvider(country));
    final alerts = ref.watch(trustAlertsProvider(country)).value ?? const <TrustAlert>[];
    final sources = ref.watch(sourceNamesProvider).value ?? const <String, String>{};
    final profile = ref.watch(profileProvider).value;

    return bundle.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => ViewScaffold(center: [PageHead(over: 'Go global', title: 'Visa & residence', caption: '$e')]),
      data: (c) {
        final permits = c.residencePermits.where((p) => p.countryId == country).toList()
          ..sort((a, b) => _permitOrder.indexOf(a.type).compareTo(_permitOrder.indexOf(b.type)));
        final permit = permits.where((p) => p.id == _permitId).firstOrNull ?? permits.firstOrNull;
        final corridor = c.corridors.firstOrNull;
        final countryDoc = c.countries.where((x) => x.id == country).firstOrNull;
        final countryName = countryDoc?.name.en ?? country;
        final facts = profile == null ? <String, Object?>{} : factsFromProfile(profile);
        final goalId = goal?.id;
        final roadmapProgress = goalId == null ? const <String, dynamic>{} : Map<String, dynamic>.from(profile?.progress?[goalId] as Map? ?? const {});
        final visaProgress = Map<String, dynamic>.from(roadmapProgress['visa'] as Map? ?? const {});

        // requirements with status: user override in progress, else from facts
        final reqs = <({Requirement req, int status, String key})>[];
        if (permit != null) {
          for (final id in permit.requirementIds) {
            final r = c.requirements.where((x) => x.id == id).firstOrNull;
            if (r == null) continue;
            final key = '${permit.id}|$id';
            final override = (visaProgress[key] as num?)?.toInt();
            final st = override ?? switch (evaluateRequirement(r, facts).status) { RequirementStatus.met => 2, RequirementStatus.gap => 0, RequirementStatus.unknown => 0 };
            reqs.add((req: r, status: st, key: key));
          }
        }
        int count(int s) => reqs.where((r) => r.status == s).length;
        final met = count(2), prog = count(1), miss = count(0);
        final visaApp = corridor?.visaApplication;
        String src(Provenance p) => sources[p.sourceId] ?? p.sourceId;

        final costItems = <(String, String, Provenance?)>[
          if (permit?.fee != null) ('Visa fee', formatMoney(permit!.fee!.amount, permit.fee!.currency), permit.provenance),
          if (permit?.fundsProof != null) ('Proof of funds', '${formatMoney(permit!.fundsProof!.amount, permit.fundsProof!.currency)}${permit.fundsProof!.period == null ? '' : ' / ${permit.fundsProof!.period!.value}'}', permit.provenance),
          ('Health insurance', 'add yours', null),
          (visaApp?.travelRequired == true ? 'Travel to ${visaApp!.city}' : 'Travel', visaApp?.travelRequired == true ? 'add yours' : 'none, apply in Freetown', null),
        ];
        final knownTotal = [if (permit?.fee?.currency == 'EUR') permit!.fee!.amount, if (permit?.fundsProof?.currency == 'EUR') permit!.fundsProof!.amount].fold<double>(0, (a, b) => a + b);

        return ViewScaffold(
          center: [
            PageHead(
              over: 'Go global',
              title: 'Visa & residence',
              caption: home ? 'Your goal is in Sierra Leone, so no visa is needed. Explore other countries here.' : 'See what you already meet and how to get the rest.',
            ),
            NjiaCard(
              gap: 16,
              children: [
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: [
                    SizedBox(
                      width: 240,
                      child: SelectField<String>(
                        label: 'Destination',
                        value: country,
                        items: [for (final x in countries.where((x) => x.id != 'SL')) (x.id, x.name.en), if (!countries.any((x) => x.id == country)) (country, countryName)],
                        onChanged: (v) => setState(() {
                          _country = v;
                          _permitId = null;
                        }),
                      ),
                    ),
                    const SizedBox(width: 200, child: SelectField<String>(label: 'Your passport', value: 'SL', items: [('SL', 'Sierra Leone')], onChanged: null)),
                  ],
                ),
                if (permits.isNotEmpty)
                  NjiaTabs<String>(
                    tabs: [for (final p in permits) (p.id, permitLabel(p.type))],
                    value: permit!.id,
                    onChanged: (v) => setState(() => _permitId = v),
                  ),
                if (permit == null) Text('No permit data for $countryName yet.', style: text.bodySmall),
                if (permit != null)
                  LayoutBuilder(
                    builder: (context, cc) {
                      final cols = cc.maxWidth >= 760 ? 4 : cc.maxWidth >= 420 ? 2 : 1;
                      final w = (cc.maxWidth - 16 * (cols - 1)) / cols;
                      final pw = permit.processingWeeks;
                      final tiles = <(IconData, String, String, String, Provenance?)>[
                        (Icons.flag_outlined, 'Apply at', visaApp == null ? 'check embassy' : visaApp.authority ?? visaApp.city, visaApp == null ? '' : (visaApp.decidedIn != null && visaApp.decidedIn != visaApp.city ? 'decided in ${visaApp.decidedIn}' : visaApp.travelRequired == true ? 'travel needed' : 'no travel'), corridor?.provenance),
                        (Icons.schedule_rounded, 'Processing', pw == null ? 'check embassy' : '${pw.min ?? '?'}–${pw.max ?? '?'} weeks', pw == null ? '' : 'from application', permit.provenance),
                        (Icons.euro_rounded, 'Visa fee', permit.fee == null ? 'check embassy' : formatMoney(permit.fee!.amount, permit.fee!.currency), permit.legalBasis ?? '', permit.provenance),
                        (Icons.account_balance_wallet_outlined, 'Proof of money', permit.fundsProof == null ? 'check embassy' : formatMoney(permit.fundsProof!.amount, permit.fundsProof!.currency), permit.fundsProof?.period == null ? '' : 'per ${permit.fundsProof!.period!.value}', permit.provenance),
                      ];
                      return Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          for (final (icon, label, value, cap, prov) in tiles)
                            SizedBox(
                              width: w,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconBox(icon),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(label, style: text.bodySmall),
                                        Text(value, style: const TextStyle(fontWeight: FontWeight.w700)),
                                        if (cap.isNotEmpty) Text(cap, style: text.bodySmall),
                                        if (prov != null) Padding(padding: const EdgeInsets.only(top: 4), child: ProvenanceChip(prov, sourceName: src(prov))),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      );
                    },
                  ),
              ],
            ),
            if (visaApp?.travelRequired == true)
              NoteBox(warn: false, title: 'Apply in ${visaApp!.city}, not Freetown', body: '${visaApp.authority ?? 'The embassy'} handles applications from Sierra Leone. Book the appointment early and plan the trip.'),
            if (corridor?.summary?.en != null)
              NoteBox(
                warn: corridor!.provenance.trust == ProvenanceTrust.estimate,
                title: corridor.provenance.trust == ProvenanceTrust.estimate ? 'Partly unverified' : 'About this route',
                body: corridor.summary!.en,
              ),
            if (permit != null)
              _RequirementsCard(permit: permit, reqs: reqs, met: met, prog: prog, miss: miss, corridor: corridor, sources: sources, onStatus: goalId == null ? null : (key, v) => saveProgress(ref, goalId: goalId, section: 'visa', key: key, value: v)),
            if (alerts.isNotEmpty)
              NjiaCard(
                children: [
                  Text('Watch out for scams', style: text.titleMedium),
                  for (final a in alerts)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Expanded(child: Text(a.title.en, style: const TextStyle(fontWeight: FontWeight.w700))),
                          NjiaBadge(a.severity.value, tone: a.severity == TrustAlertSeverity.critical ? BadgeTone.bad : a.severity == TrustAlertSeverity.warning ? BadgeTone.warn : BadgeTone.info),
                        ]),
                        Text(a.pattern.en, style: text.bodySmall),
                        if (a.advice?.en != null) Padding(padding: const EdgeInsets.only(top: 2), child: Text(a.advice!.en, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600))),
                      ],
                    ),
                ],
              ),
          ],
          right: [
            Row(
              children: [
                _Donut(met: met, prog: prog, miss: miss),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your readiness', style: text.titleMedium),
                      Text('${permit == null ? '' : '${permitLabel(permit.type)} · '}$countryName', style: text.bodySmall),
                    ],
                  ),
                ),
              ],
            ),
            Section(
              children: [
                Text('Cost to apply', style: text.titleMedium),
                for (final (label, value, prov) in costItems)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KeyValueRow(label, value),
                      if (prov != null) ProvenanceChip(prov, sourceName: src(prov)),
                    ],
                  ),
                KeyValueRow('Known items', knownTotal == 0 ? 'see items' : formatMoney(knownTotal, 'EUR'), total: true),
              ],
            ),
            OutlinedButton.icon(onPressed: () => context.go(Routes.milestone), icon: const Icon(Icons.flag_outlined, size: 14), label: const Text('Full move checklist')),
          ],
        );
      },
    );
  }
}

class _RequirementsCard extends StatelessWidget {
  const _RequirementsCard({required this.permit, required this.reqs, required this.met, required this.prog, required this.miss, required this.corridor, required this.sources, required this.onStatus});
  final ResidencePermit permit;
  final List<({Requirement req, int status, String key})> reqs;
  final int met, prog, miss;
  final Corridor? corridor;
  final Map<String, String> sources;
  final void Function(String key, int value)? onStatus;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final prov = corridor?.provenance;
    return NjiaCard(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 8),
      gap: 0,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 8,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Requirements', style: text.titleMedium),
                  Text('${permit.name.en}${permit.workRights?.limit == null ? '' : ' · work: ${permit.workRights!.limit}'} · tap a status to update it', style: text.bodySmall),
                ],
              ),
              Wrap(spacing: 8, children: [NjiaBadge('$met met', tone: BadgeTone.ok), NjiaBadge('$prog in progress', tone: BadgeTone.warn), NjiaBadge('$miss missing', tone: BadgeTone.bad)]),
            ],
          ),
        ),
        Container(
          color: t.bg,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(children: [
            const SizedBox(width: 40),
            Expanded(flex: 11, child: Text('Requirement', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: t.muted))),
            Expanded(flex: 13, child: Text('How to get it', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: t.muted))),
            SizedBox(width: 110, child: Text('Cost · time', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: t.muted))),
            SizedBox(width: 100, child: Text('Status', textAlign: TextAlign.right, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: t.muted))),
          ]),
        ),
        for (final r in reqs)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(border: Border(top: BorderSide(color: t.line))),
            child: LayoutBuilder(
              builder: (context, c) {
                final wide = c.maxWidth >= 640;
                final mark = KeyedSubtree(key: ValueKey('visa-${r.key}'), child: StatusMark(r.status, onTap: onStatus == null ? null : () => onStatus!(r.key, (r.status + 1) % 3)));
                final label = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(r.req.label.en, style: const TextStyle(fontWeight: FontWeight.w700)),
                    if (r.req.evidenceDocType != null) Text('Proof: ${r.req.evidenceDocType!.replaceAll('_', ' ')}', style: text.bodySmall),
                    Padding(padding: const EdgeInsets.only(top: 4), child: ProvenanceChip(r.req.provenance, sourceName: sources[r.req.provenance.sourceId])),
                  ],
                );
                final how = Text(r.req.howToMeet?.en ?? '—', style: const TextStyle(fontSize: 12));
                final cost = Text(
                  [
                    if (r.req.money != null) formatMoney(r.req.money!.amount, r.req.money!.currency),
                    if (r.req.validityMonths != null) 'valid ${r.req.validityMonths} mo',
                  ].join(' · ').ifEmpty('—'),
                  style: text.bodySmall,
                );
                final badge = NjiaBadge(switch (r.status) { 2 => 'Met', 1 => 'In progress', _ => 'Missing' }, tone: switch (r.status) { 2 => BadgeTone.ok, 1 => BadgeTone.warn, _ => BadgeTone.bad });
                if (wide) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 40, child: mark),
                      Expanded(flex: 11, child: label),
                      const SizedBox(width: 16),
                      Expanded(flex: 13, child: how),
                      const SizedBox(width: 16),
                      SizedBox(width: 110, child: cost),
                      SizedBox(width: 100, child: Align(alignment: Alignment.centerRight, child: badge)),
                    ],
                  );
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 32, child: mark),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [label, const SizedBox(height: 4), how, const SizedBox(height: 4), cost, const SizedBox(height: 6), badge])),
                  ],
                );
              },
            ),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.shield_outlined, size: 16, color: t.muted),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  prov == null
                      ? 'Always confirm with the embassy before you apply.'
                      : 'Where to apply: ${sources[prov.sourceId] ?? prov.sourceId} · fetched ${formatDate(prov.fetchedAt)}${prov.quote == null ? '' : ' · “${prov.quote!.length > 140 ? '${prov.quote!.substring(0, 140)}…' : prov.quote}”'}. ${prov.trust == ProvenanceTrust.estimate ? 'Amounts marked “estimate” are not yet verified. ' : ''}Always confirm with the embassy before you apply.',
                  style: text.bodySmall,
                ),
              ),
            ],
          ),
        ),
        if (permit.checklist.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsets.only(bottom: 6), child: Text('Application checklist', style: text.bodySmall)),
                for (final i in permit.checklist) Padding(padding: const EdgeInsets.only(left: 4, bottom: 4), child: Text('• ${i.label ?? i.id ?? ''}', style: const TextStyle(fontSize: 13))),
              ],
            ),
          ),
      ],
    );
  }
}

extension on String {
  String ifEmpty(String alt) => isEmpty ? alt : this;
}

/// Prototype `.donut`: met / in progress / missing.
class _Donut extends StatelessWidget {
  const _Donut({required this.met, required this.prog, required this.miss});
  final int met, prog, miss;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final n = met + prog + miss;
    return SizedBox(
      width: 96,
      height: 96,
      child: CustomPaint(
        painter: _DonutPainter(segments: [(met, t.ok), (prog, t.accent), (miss, t.badSoft)], track: t.subtle),
        child: Center(child: Text('$met/$n', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
      ),
    );
  }
}

class _DonutPainter extends CustomPainter {
  _DonutPainter({required this.segments, required this.track});
  final List<(int, Color)> segments;
  final Color track;
  @override
  void paint(Canvas canvas, Size size) {
    final r = size.width / 2 - 6;
    final c = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..color = track;
    canvas.drawCircle(c, r, paint);
    final n = segments.fold<int>(0, (s, x) => s + x.$1);
    if (n == 0) return;
    var start = -math.pi / 2;
    for (final (v, color) in segments) {
      if (v == 0) continue;
      final sweep = 2 * math.pi * v / n;
      canvas.drawArc(Rect.fromCircle(center: c, radius: r), start, math.max(0, sweep - 0.04), false, paint..color = color);
      start += sweep;
    }
  }

  @override
  bool shouldRepaint(_DonutPainter old) => old.segments != segments || old.track != track;
}
