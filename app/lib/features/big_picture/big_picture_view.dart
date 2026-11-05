// Prototype `map()`: nine pools as connected bubbles. Ring = progress (from the real models),
// pulse = weakest pool ("start here"), lines = dependencies. Layouts: Web (ring around "You")
// and Order of work. Tap selects; drag a bubble next to another to read how they depend on each
// other; keyboard: Tab + Enter. Reduced-motion users get no float/pulse animation.
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../app/router.dart';
import '../../app/theme.dart';
import '../../core/engine/engine.dart';
import '../../core/models/models.dart';
import '../../shared/widgets/ui.dart';
import '../../shared/widgets/view_scaffold.dart';
import '../assistant/assistant.dart';
import '../profile/profile_view.dart';

class Pool {
  const Pool({
    required this.id,
    required this.name,
    required this.question,
    required this.colorIndex,
    required this.radius,
    required this.icon,
    required this.route,
    required this.what,
    required this.challenges,
    required this.needs,
    this.hub = false,
  });
  final String id, name, question;
  final int colorIndex; // 0–5 phase colours, 6 accent, 7 bad
  final double radius;
  final IconData icon;
  final String route;
  final String what;
  final List<String> challenges;
  final List<String> needs;
  final bool hub;
}

const pools = <Pool>[
  Pool(
    id: 'you',
    name: 'You',
    question: 'Where do I stand?',
    colorIndex: 5,
    radius: 46,
    icon: Icons.person_outline_rounded,
    route: Routes.profile,
    hub: true,
    what: 'Your profile, goals, documents and progress. Everything else is matched against this.',
    challenges: [
      'Incomplete profiles give wrong scores',
      'Documents expire (IELTS after 2 years)',
      'Your data must stay yours: consent, EU hosting',
    ],
    needs: [
      'Fill education, languages, savings',
      'Upload certificates as you get them',
      'Decide what you share for score calibration',
    ],
  ),
  Pool(
    id: 'paths',
    name: 'Pathways',
    question: 'Where can I go?',
    colorIndex: 2,
    radius: 42,
    icon: Icons.route_outlined,
    route: Routes.roadmap,
    what: 'Degrees, vocational training, courses, tests, trainee programmes and jobs that lead to your goal.',
    challenges: [
      'Programme pages change every semester',
      'Most German bachelors are taught in German',
      'Deadlines differ by country (Jan to Jul)',
    ],
    needs: ['Shortlist 3–5 programmes with dates', 'Check language of instruction early', 'Keep one alternative route'],
  ),
  Pool(
    id: 'reqs',
    name: 'Requirements',
    question: 'What do I need?',
    colorIndex: 1,
    radius: 48,
    icon: Icons.track_changes_rounded,
    route: Routes.readiness,
    what: 'Language tests, grades, documents, funds, experience. One requirement, reused by many pathways, visas and scholarships.',
    challenges: [
      'Thresholds are specific (IELTS 6.5, no band under 6.0)',
      'Tests cost money and book out weeks ahead',
      'Experience limits can disqualify (max 12 months for graduate programmes)',
    ],
    needs: ['Book IELTS 8 weeks ahead', 'Collect proof for each requirement', 'Re-check validity dates'],
  ),
  Pool(
    id: 'recog',
    name: 'Recognition',
    question: 'Does it count?',
    colorIndex: 4,
    radius: 44,
    icon: Icons.school_outlined,
    route: Routes.visa,
    what: 'Whether WASSCE and a Sierra Leonean degree are accepted: anabin (Germany), ENIC-NARIC offices, CIMEA (Italy), Nuffic (Netherlands).',
    challenges: [
      'anabin lists universities, not every degree',
      'A Statement of Comparability takes weeks and costs a fee',
      'Direct bachelor access often needs a foundation year',
    ],
    needs: [
      'Search anabin for your university now',
      'Order certified translations early',
      'Budget for the ZAB statement',
    ],
  ),
  Pool(
    id: 'visa',
    name: 'Visa',
    question: 'May I enter and stay?',
    colorIndex: 3,
    radius: 42,
    icon: Icons.badge_outlined,
    route: Routes.visa,
    what: 'Student visa, job-seeker permit, work permit or Blue Card: where to apply, fees, proof of funds, processing time, work rights.',
    challenges: [
      'Most embassies for Sierra Leone sit in Accra, Abidjan, Dakar or Abuja',
      'Rules change without notice',
      'Appointments book out months ahead',
    ],
    needs: [
      'Plan travel and an appointment',
      'Keep the proof of funds ready before applying',
      'Check the rule again the week you apply',
    ],
  ),
  Pool(
    id: 'money',
    name: 'Money',
    question: 'Can I pay for it?',
    colorIndex: 0,
    radius: 42,
    icon: Icons.account_balance_wallet_outlined,
    route: Routes.finances,
    what: 'Tuition, living costs, blocked account, insurance; scholarships, loans, working-student income.',
    challenges: [
      'Proof of funds is needed before the visa',
      'Scholarship rounds close once a year',
      'Fees change yearly; exchange rates move',
    ],
    needs: ['Calculate the full budget per phase', 'Apply to 3+ scholarships', 'Save monthly, keep a 10% buffer'],
  ),
  Pool(
    id: 'jobs',
    name: 'Jobs & pay',
    question: 'Is it worth it?',
    colorIndex: 5,
    radius: 42,
    icon: Icons.work_outline_rounded,
    route: Routes.jobs,
    what: 'Openings, salary bands and shortage lists per country, so your goal is realistic and well paid.',
    challenges: [
      'Salaries in ads are often estimates',
      'Visa sponsorship is rarely stated',
      'Local language decides many entry jobs',
    ],
    needs: [
      'Track 10 real openings for your goal',
      'Compare pay with living costs',
      'Build experience that ads actually ask for',
    ],
  ),
  Pool(
    id: 'help',
    name: 'Helpers',
    question: 'Who can help?',
    colorIndex: 6,
    radius: 38,
    icon: Icons.people_outline_rounded,
    route: Routes.milestone,
    what: 'Tutors, language schools, test centres, coaches and mentors, checked before they appear.',
    challenges: [
      'Quality varies; reviews can be faked',
      'Agents may charge students illegally',
      'Few providers in Sierra Leone for German',
    ],
    needs: ['Use only verified helpers', 'Never pay a job agent', 'Ask for a trial lesson'],
  ),
  Pool(
    id: 'trust',
    name: 'Trust',
    question: 'Is this real?',
    colorIndex: 7,
    radius: 38,
    icon: Icons.shield_outlined,
    route: Routes.visa,
    what: 'Scam patterns, licensed agencies, accredited institutions, and the sources behind every number in Njia.',
    challenges: [
      'Fake jobs and scholarships target students',
      "'Guaranteed visa' offers are always false",
      'Even official pages can be outdated',
    ],
    needs: ['Check the source line under every fact', 'Report anything suspicious', 'Apply only on official domains'],
  ),
];

const poolLinks = <(String, String, String)>[
  ('you', 'paths', 'Your goal picks the pathways'),
  ('you', 'reqs', 'Your profile is matched against each requirement'),
  ('you', 'money', 'Your savings and support set the funding gap'),
  ('you', 'visa', 'Your passport decides where you apply'),
  ('paths', 'reqs', 'Each pathway lists its requirements'),
  ('reqs', 'recog', 'A recognised degree is itself a requirement'),
  ('paths', 'money', 'Pathways carry tuition and living costs'),
  ('money', 'visa', 'The visa needs proof of money'),
  ('visa', 'reqs', 'Visa checklists are requirements too'),
  ('paths', 'jobs', 'Pathways lead to occupations and pay'),
  ('jobs', 'money', 'Expected pay decides if the plan pays off'),
  ('help', 'reqs', 'Helpers close requirement gaps'),
  ('trust', 'jobs', 'Trust checks protect you from fake jobs'),
  ('trust', 'money', '…and from fake scholarships and agents'),
  ('recog', 'visa', 'The Blue Card needs a recognised degree'),
];
const orderOfWork = ['reqs', 'paths', 'money', 'visa', 'jobs'];

Color poolColor(BuildContext context, int i) {
  final t = context.tokens;
  return i == 6
      ? t.accent
      : i == 7
      ? t.bad
      : t.phases[i];
}

/// (percent, caption) per pool from the real models.
Map<String, (int, String)> poolStatuses(WidgetRef ref) {
  final profile = ref.watch(profileProvider).value;
  final rm = ref.watch(roadmapProvider).value;
  final rd = ref.watch(readinessProvider).value;
  final fin = ref.watch(financeProvider).value;
  final goal = ref.watch(activeGoalProvider);
  final alerts = goal?.countryId == null
      ? const <TrustAlert>[]
      : (ref.watch(trustAlertsProvider(goal!.countryId!)).value ?? const <TrustAlert>[]);
  final progress = rm?.progress ?? const <String, dynamic>{};
  int pct(num a, num b) => b == 0 ? 0 : (100 * a / b).round();
  final out = <String, (int, String)>{};
  final filled = profile == null ? 0 : profileCompleteness(profile);
  out['you'] = (pct(filled, 14), '$filled of 14 profile areas filled');
  out['paths'] = rm == null
      ? (0, 'no roadmap yet')
      : (pct(rm.stepsDone, rm.stepsTotal), '${rm.stepsDone} of ${rm.stepsTotal} steps done');
  out['reqs'] = rd == null ? (0, 'no route yet') : (rd.overall, 'readiness ${rd.overall}%');
  final recog = rd?.items.where((i) => i.requirement.type == RequirementType.recognition).toList() ?? const [];
  out['recog'] = recog.isEmpty
      ? (25, 'check the recognition body')
      : (
          recog.every((i) => i.met) ? 100 : 10,
          recog.every((i) => i.met)
              ? 'degree recognised'
              : '${recog.first.requirement.label.en.split(' ').take(4).join(' ')}… not checked yet',
        );
  if (rm != null) {
    final permit = rm.content.residencePermits
        .where((p) => p.type == PermitType.student && p.countryId == goal?.countryId)
        .firstOrNull;
    if (permit == null) {
      out['visa'] = (100, 'no visa needed');
    } else {
      final visa = Map<String, dynamic>.from(progress['visa'] as Map? ?? const {});
      final facts = profile == null ? <String, Object?>{} : factsFromProfile(profile);
      var ok = 0;
      for (final id in permit.requirementIds) {
        final r = rm.content.requirements.where((x) => x.id == id).firstOrNull;
        if (r == null) continue;
        final st =
            (visa['${permit.id}|$id'] as num?)?.toInt() ??
            (evaluateRequirement(r, facts).status == RequirementStatus.met ? 2 : 0);
        if (st == 2) ok++;
      }
      out['visa'] = (
        pct(ok, permit.requirementIds.length),
        '$ok of ${permit.requirementIds.length} visa requirements met',
      );
    }
  } else {
    out['visa'] = (0, 'no route yet');
  }
  out['money'] = fin == null ? (0, 'no costs yet') : (fin.coverage, '${fin.coverage}% of costs covered');
  final saved = (progress['savedJobs'] as Map?)?.length ?? 0;
  out['jobs'] = (math.min(100, saved * 20), '$saved jobs saved');
  final h = profile?.helpPreferences;
  final hn = (h?.styles.length ?? 0) + (h?.subjects.isNotEmpty == true ? 1 : 0);
  out['help'] = (math.min(100, 33 * hn + (hn > 0 ? 1 : 0)), hn > 0 ? '$hn help channels on' : 'no helpers chosen yet');
  final read = (progress['trustRead'] as Map?)?.length ?? 0;
  out['trust'] = alerts.isEmpty
      ? (0, 'no warnings for this country yet')
      : (pct(read, alerts.length), '$read of ${alerts.length} warnings read');
  return out;
}

class BigPictureView extends ConsumerStatefulWidget {
  const BigPictureView({super.key});

  @override
  ConsumerState<BigPictureView> createState() => _BigPictureViewState();
}

class _BigPictureViewState extends ConsumerState<BigPictureView> with SingleTickerProviderStateMixin {
  static const w = 760.0, h = 560.0;
  bool _order = false;
  String? _sel;
  String? _near;
  String? _hover;
  final Map<String, Offset> _pos = {};
  late final AnimationController _float = AnimationController(vsync: this, duration: const Duration(seconds: 6))
    ..repeat();

  @override
  void initState() {
    super.initState();
    _layout();
  }

  @override
  void dispose() {
    _float.dispose();
    super.dispose();
  }

  void _layout() {
    _pos.clear();
    if (_order) {
      const xs = [90.0, 255.0, 420.0, 585.0, 670.0];
      for (final (i, id) in orderOfWork.indexed) {
        _pos[id] = Offset(xs[i], 220);
      }
      _pos['you'] = const Offset(380, 70);
      _pos['recog'] = const Offset(300, 420);
      _pos['help'] = const Offset(120, 420);
      _pos['trust'] = const Offset(600, 420);
    } else {
      const cx = w / 2, cy = h / 2;
      final r = math.min(w, h) * 0.39;
      _pos['you'] = const Offset(cx, cy);
      final ring = pools.where((p) => !p.hub).toList();
      for (final (i, p) in ring.indexed) {
        final a = -math.pi / 2 + i * 2 * math.pi / ring.length;
        _pos[p.id] = Offset(cx + r * math.cos(a), cy + r * math.sin(a));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final status = poolStatuses(ref);
    final reduce = MediaQuery.of(context).disableAnimations;
    final weakest = pools.where((p) => !p.hub).toList()
      ..sort((a, b) => (status[a.id]?.$1 ?? 0).compareTo(status[b.id]?.$1 ?? 0));
    final sel = pools.where((p) => p.id == _sel).firstOrNull;

    return ViewScaffold(
      center: [
        const PageHead(
          over: 'Your goal',
          title: 'Big picture',
          caption: 'Nine questions decide whether a plan works. Tap a circle for what matters; drag one next to another to see how they depend on each other.',
        ),
        NjiaCard(
          padding: const EdgeInsets.all(12),
          gap: 10,
          children: [
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 8,
              children: [
                Segmented<bool>(
                  options: const [(false, 'Web'), (true, 'Order of work')],
                  value: _order,
                  onChanged: (v) => setState(() {
                    _order = v;
                    _layout();
                  }),
                ),
                Wrap(
                  spacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      _order
                          ? 'Left to right: what usually has to be done first. Bottom row runs alongside.'
                          : 'Lines = what depends on what. The ring shows your progress.',
                      style: text.bodySmall,
                    ),
                    TextButton.icon(
                      onPressed: () => setState(() {
                        _sel = null;
                        _near = null;
                        _layout();
                      }),
                      icon: const Icon(Icons.close_rounded, size: 14),
                      label: const Text('Reset'),
                    ),
                  ],
                ),
              ],
            ),
            LayoutBuilder(
              builder: (context, c) {
                final scale = c.maxWidth / w;
                return SizedBox(
                  width: c.maxWidth,
                  height: h * scale,
                  child: FittedBox(
                    child: SizedBox(
                      width: w,
                      height: h,
                      child: AnimatedBuilder(
                        animation: _float,
                        builder: (context, _) => _Map(
                          positions: {for (final e in _pos.entries) e.key: reduce ? e.value : e.value + _drift(e.key)},
                          status: status,
                          selected: _sel,
                          near: _near,
                          hover: _hover,
                          weakest: weakest.first.id,
                          order: _order,
                          reduceMotion: reduce,
                          scale: scale,
                          onTap: (id) => setState(() {
                            _sel = _sel == id ? null : id;
                            _near = null;
                          }),
                          onHover: (id) => setState(() => _hover = id),
                          onDrag: (id, delta) => setState(() {
                            final p = _pos[id]! + delta / scale;
                            _pos[id] = Offset(p.dx.clamp(56, w - 56), p.dy.clamp(56, h - 56));
                            _sel = id;
                            final me = pools.firstWhere((x) => x.id == id);
                            String? best;
                            var bd = double.infinity;
                            for (final o in pools) {
                              if (o.id == id) continue;
                              final d = (_pos[o.id]! - _pos[id]!).distance - me.radius - o.radius;
                              if (d < bd) {
                                bd = d;
                                best = o.id;
                              }
                            }
                            _near = bd < 40 ? best : null;
                          }),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Wrap(
              spacing: 14,
              runSpacing: 6,
              children: [
                _legend(
                  context,
                  'ring = progress',
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: t.ok, width: 3),
                    ),
                  ),
                ),
                _legend(
                  context,
                  'pulse = needs attention first',
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: t.warnSoft,
                      border: Border.all(color: t.warn, width: 2),
                    ),
                  ),
                ),
                _legend(context, 'line = depends on', Container(width: 18, height: 2, color: t.brand)),
                Text('drag · tap · keyboard: Tab + Enter', style: text.bodySmall),
              ],
            ),
          ],
        ),
      ],
      right: [
        if (sel != null)
          _PoolDetail(
            pool: sel,
            status: status[sel.id] ?? (0, ''),
            near: _near,
            onLink: (id) => setState(() => _near = id),
            onAsk: () => ref.read(assistantProvider.notifier).openAbout(sel.name, {'pool': sel.id}),
          )
        else ...[
          NjiaCard(
            padding: const EdgeInsets.all(16),
            gap: 6,
            children: [
              const OverLabel('How to read this'),
              const Text(
                'Every circle is one question your plan has to answer.',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text(
                '“You” sits in the middle: everything is matched against your profile. Switch to Order of work to see what comes first.',
                style: text.bodySmall,
              ),
            ],
          ),
          Section(
            children: [
              Text('Start here', style: text.titleMedium),
              for (final (i, p) in weakest.take(3).indexed)
                InkWell(
                  onTap: () => setState(() => _sel = p.id),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: poolColor(context, p.colorIndex),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(p.icon, size: 16, color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${i + 1}. ${p.name}', style: const TextStyle(fontWeight: FontWeight.w600)),
                              Text('${status[p.id]?.$2 ?? ''} · ${p.needs.first}', style: text.bodySmall),
                            ],
                          ),
                        ),
                        Text('${status[p.id]?.$1 ?? 0}%', style: const TextStyle(fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ],
      ],
    );
  }

  Offset _drift(String id) {
    final i = pools.indexWhere((p) => p.id == id);
    final t = _float.value * 2 * math.pi;
    return Offset(math.sin(t * 0.7 + i * 1.3) * 5, math.cos(t * 0.5 + i * 0.9) * 4);
  }

  Widget _legend(BuildContext context, String label, Widget swatch) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      swatch,
      const SizedBox(width: 6),
      Text(label, style: Theme.of(context).textTheme.bodySmall),
    ],
  );
}

class _Map extends StatelessWidget {
  const _Map({
    required this.positions,
    required this.status,
    required this.selected,
    required this.near,
    required this.hover,
    required this.weakest,
    required this.order,
    required this.reduceMotion,
    required this.scale,
    required this.onTap,
    required this.onHover,
    required this.onDrag,
  });
  final Map<String, Offset> positions;
  final Map<String, (int, String)> status;
  final String? selected, near, hover, weakest;
  final bool order;
  final bool reduceMotion;
  final double scale;
  final ValueChanged<String> onTap;
  final ValueChanged<String?> onHover;
  final void Function(String id, Offset delta) onDrag;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: _LinksPainter(
              positions: positions,
              selected: selected,
              near: near,
              hover: hover,
              order: order,
              line: t.line,
              lineStrong: t.lineStrong,
              brand: t.brand,
            ),
          ),
        ),
        for (final p in pools)
          Positioned(
            left: positions[p.id]!.dx - p.radius - 24,
            top: positions[p.id]!.dy - p.radius - 24,
            child: _Bubble(
              pool: p,
              status: status[p.id] ?? (0, ''),
              selected: selected == p.id,
              dim:
                  selected != null &&
                  selected != p.id &&
                  !poolLinks.any((l) => (l.$1 == selected && l.$2 == p.id) || (l.$2 == selected && l.$1 == p.id)),
              weak: weakest == p.id && selected != p.id,
              hover: hover == p.id,
              orderIndex: order ? orderOfWork.indexOf(p.id) : -1,
              reduceMotion: reduceMotion,
              onTap: () => onTap(p.id),
              onHover: (v) => onHover(v ? p.id : null),
              onDrag: (d) => onDrag(p.id, d),
            ),
          ),
      ],
    );
  }
}

class _Bubble extends StatefulWidget {
  const _Bubble({
    required this.pool,
    required this.status,
    required this.selected,
    required this.dim,
    required this.weak,
    required this.hover,
    required this.orderIndex,
    required this.reduceMotion,
    required this.onTap,
    required this.onHover,
    required this.onDrag,
  });
  final Pool pool;
  final (int, String) status;
  final bool selected, dim, weak, hover, reduceMotion;
  final int orderIndex;
  final VoidCallback onTap;
  final ValueChanged<bool> onHover;
  final ValueChanged<Offset> onDrag;
  @override
  State<_Bubble> createState() => _BubbleState();
}

class _BubbleState extends State<_Bubble> {
  bool _focused = false;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final p = widget.pool;
    final color = poolColor(context, p.colorIndex);
    final r =
        p.radius *
        (widget.selected
            ? 1.28
            : widget.hover
            ? 1.06
            : 1);
    final onDark = widget.selected || p.hub;
    final size = (p.radius + 24) * 2;
    return Focus(
      onFocusChange: (f) => setState(() => _focused = f),
      onKeyEvent: (node, e) {
        if (e is KeyDownEvent && (e.logicalKey.keyLabel == 'Enter' || e.logicalKey.keyLabel == ' ')) {
          widget.onTap();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Semantics(
        button: true,
        label: '${p.name}: ${widget.status.$1} percent',
        child: MouseRegion(
          cursor: SystemMouseCursors.grab,
          onEnter: (_) => widget.onHover(true),
          onExit: (_) => widget.onHover(false),
          child: GestureDetector(
            onTap: widget.onTap,
            onPanUpdate: (d) => widget.onDrag(d.delta),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: widget.dim ? 0.4 : 1,
              child: SizedBox(
                width: size,
                height: size,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (widget.weak)
                      Container(
                        width: (p.radius + 16) * 2,
                        height: (p.radius + 16) * 2,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: t.warn.withValues(alpha: 0.18)),
                      ),
                    SizedBox(
                      width: (p.radius + 7) * 2 + 5,
                      height: (p.radius + 7) * 2 + 5,
                      child: CircularProgressIndicator(
                        value: widget.status.$1 / 100,
                        strokeWidth: 5,
                        backgroundColor: t.subtle,
                        color: color,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: r * 2,
                      height: r * 2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: onDark ? color : color.withValues(alpha: 0.14),
                        border: Border.all(
                          color: _focused ? t.accent : color,
                          width: _focused
                              ? 2
                              : widget.selected
                              ? 0
                              : 1.5,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            p.name,
                            style: TextStyle(
                              fontSize: widget.selected ? 14 : 12.5,
                              fontWeight: FontWeight.w700,
                              color: onDark ? Colors.white : t.ink,
                            ),
                          ),
                          Text(
                            widget.selected || widget.hover ? '${widget.status.$1}%' : p.question,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 9.5,
                              color: onDark ? Colors.white.withValues(alpha: 0.85) : t.muted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget.orderIndex >= 0)
                      Positioned(
                        top: 0,
                        child: Text(
                          '${widget.orderIndex + 1}',
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: t.muted),
                        ),
                      ),
                    if (widget.weak)
                      Positioned(
                        bottom: 0,
                        child: Text(
                          'start here',
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: t.warn),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LinksPainter extends CustomPainter {
  _LinksPainter({
    required this.positions,
    required this.selected,
    required this.near,
    required this.hover,
    required this.order,
    required this.line,
    required this.lineStrong,
    required this.brand,
  });
  final Map<String, Offset> positions;
  final String? selected, near, hover;
  final bool order;
  final Color line, lineStrong, brand;

  @override
  void paint(Canvas canvas, Size size) {
    final dots = Paint()..color = line;
    for (var x = 1.0; x < size.width; x += 22) {
      for (var y = 1.0; y < size.height; y += 22) {
        canvas.drawCircle(Offset(x, y), 1, dots);
      }
    }
    if (!order) {
      canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        math.min(size.width, size.height) * 0.39,
        Paint()
          ..color = line
          ..style = PaintingStyle.stroke,
      );
    }
    for (final (a, b, _) in poolLinks) {
      final pa = positions[a], pb = positions[b];
      if (pa == null || pb == null) continue;
      final isSel = selected != null && (a == selected || b == selected);
      final isNear = near != null && ((a == selected && b == near) || (b == selected && a == near));
      final isHov = hover != null && (a == hover || b == hover);
      final hot = isSel || isNear;
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = isNear
            ? 3
            : hot
            ? 2.2
            : isHov
            ? 1.8
            : 1.3
        ..color =
            (hot
                    ? brand
                    : isHov
                    ? lineStrong
                    : line)
                .withValues(alpha: selected != null && !hot ? 0.5 : 1);
      final mx = (pa.dx + pb.dx) / 2, my = (pa.dy + pb.dy) / 2;
      final dx = pb.dx - pa.dx, dy = pb.dy - pa.dy;
      final k = order ? 0.12 : 0.08;
      final path = Path()
        ..moveTo(pa.dx, pa.dy)
        ..quadraticBezierTo(mx - dy * k, my + dx * k, pb.dx, pb.dy);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_LinksPainter old) => true;
}

class _PoolDetail extends StatelessWidget {
  const _PoolDetail({
    required this.pool,
    required this.status,
    required this.near,
    required this.onLink,
    required this.onAsk,
  });
  final Pool pool;
  final (int, String) status;
  final String? near;
  final ValueChanged<String> onLink;
  final VoidCallback onAsk;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final p = pool;
    final color = poolColor(context, p.colorIndex);
    final link = near == null
        ? null
        : poolLinks.where((l) => (l.$1 == p.id && l.$2 == near) || (l.$2 == p.id && l.$1 == near)).firstOrNull;
    final deps = poolLinks
        .where((l) => l.$1 == p.id || l.$2 == p.id)
        .map((l) => pools.firstWhere((x) => x.id == (l.$1 == p.id ? l.$2 : l.$1)))
        .toList();
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: t.surface,
        border: Border.all(color: t.line),
        borderRadius: BorderRadius.circular(NjiaTokens.radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(height: 4, color: color),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
                      child: Icon(p.icon, size: 16, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OverLabel(p.question),
                          Text(p.name, style: text.titleMedium),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('${status.$1}%', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                          Text(status.$2, style: text.bodySmall, textAlign: TextAlign.right),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ProgressBar(status.$1 / 100, color: color),
                const SizedBox(height: 12),
                Text(p.what, style: const TextStyle(fontSize: 13)),
                const SizedBox(height: 12),
                const OverLabel('Challenges'),
                for (final c in p.challenges)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text('⚠ $c', style: const TextStyle(fontSize: 12)),
                  ),
                const SizedBox(height: 12),
                const OverLabel('What you need to do'),
                for (final n in p.needs)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text('✓ $n', style: const TextStyle(fontSize: 12)),
                  ),
                const SizedBox(height: 12),
                if (link != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(color: t.infoSoft, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${p.name} ↔ ${pools.firstWhere((x) => x.id == near).name}',
                          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                        ),
                        Text(link.$3, style: const TextStyle(fontSize: 13)),
                      ],
                    ),
                  )
                else ...[
                  const OverLabel('Depends on'),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      for (final d in deps) ToggleChip(label: d.name, selected: false, onTap: () => onLink(d.id)),
                    ],
                  ),
                ],
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    FilledButton(
                      onPressed: () => context.go(p.route),
                      child: Text('Next: ${p.needs.first}', overflow: TextOverflow.ellipsis),
                    ),
                    TextButton.icon(
                      onPressed: onAsk,
                      icon: const Icon(Icons.chat_bubble_outline_rounded, size: 14),
                      label: const Text('Ask the coach'),
                    ),
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
