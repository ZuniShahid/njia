// Next-milestone checklist: the current (or chosen) phase of the roadmap broken into groups and
// tick-able items – steps, requirement proofs and permit checklist entries. Pure Dart.
import '../models/models.dart';
import 'readiness_model.dart';
import 'roadmap_model.dart';

class MilestoneItem {
  const MilestoneItem({required this.key, required this.section, required this.title, required this.due, required this.status, this.how, this.help = const [], this.stepKey, this.requirement});
  final String key;

  /// progress section the status lives in: 'steps' or 'checks'
  final String section;
  final String title;
  final double due; // fractional year
  final int status; // 0 · 1 · 2
  final String? how;

  /// 'coach' · 'tutor' · 'guide'
  final List<String> help;
  final String? stepKey;
  final Requirement? requirement;
  bool get done => status == 2;
  bool isOverdue(double today) => status < 2 && due < today;
}

class MilestoneGroup {
  const MilestoneGroup({required this.key, required this.name, required this.items});
  final String key;
  final String name;
  final List<MilestoneItem> items;
  int get done => items.where((i) => i.done).length;
}

class MilestoneModel {
  const MilestoneModel({required this.phase, required this.groups, required this.today});
  final RoadmapPhase phase;
  final List<MilestoneGroup> groups;
  final double today;

  List<MilestoneItem> get items => [for (final g in groups) ...g.items];
  int get done => items.where((i) => i.done).length;
  int get total => items.length;
  int get overdue => items.where((i) => i.isOverdue(today)).length;
  String get title => phase.isMove ? phase.name.split(' · ').first : phase.shortName;
  double get due => phase.end;
  int get monthsLeft => ((phase.end - today) * 12).round().clamp(0, 1 << 20);

  static const _groupNames = {'education': 'Education', 'languages': 'Language', 'experience': 'Experience', 'finances': 'Money', 'visa': 'Documents'};

  factory MilestoneModel.build(RoadmapModel roadmap, {RoadmapPhase? phase}) {
    final ph = phase ?? roadmap.currentPhase;
    final checks = Map<String, dynamic>.from(roadmap.progress['checks'] as Map? ?? const {});
    final groups = <String, List<MilestoneItem>>{};
    final names = <String, String>{};
    void add(String key, String name, MilestoneItem item) {
      names[key] = name;
      groups.putIfAbsent(key, () => []).add(item);
    }

    for (final s in ph.steps) {
      final ps = s.step;
      final status = roadmap.statusOf(s);
      if (ps == null) {
        add('goal', 'Goal', MilestoneItem(key: s.key, section: 'steps', title: s.title, due: s.end, status: status, stepKey: s.key, help: const ['coach']));
        continue;
      }
      switch (ps.kind) {
        case PlanStepKind.prepare:
          final req = roadmap.content.requirements.where((r) => r.id == ps.requirementId).firstOrNull;
          final dim = req == null ? 'visa' : ReadinessModel.dimensionOf(req.type);
          final tutor = req != null && req.providerTypes.any((p) => p == ProviderType.tutor || p == ProviderType.languageSchool || p == ProviderType.testCentre);
          add(dim, _groupNames[dim] ?? 'Other', MilestoneItem(key: s.key, section: 'steps', title: s.title, due: s.end, status: status, how: ps.howToMeet, help: ['coach', if (tutor) 'tutor', 'guide'], stepKey: s.key, requirement: req));
        case PlanStepKind.apply:
          add('admission', 'Admission', MilestoneItem(key: s.key, section: 'steps', title: s.title, due: s.end, status: status, how: ps.deadline == null ? 'Apply before the programme deadline; conditional offers are usually accepted for visa purposes.' : 'Deadline ${ps.deadline}.', help: const ['coach', 'guide'], stepKey: s.key));
          for (final f in ps.funding) {
            add('admission', 'Admission', MilestoneItem(key: '${s.key}|fund:${f.id}', section: 'checks', title: 'Apply: ${f.name}', due: s.end, status: ((checks['${s.key}|fund:${f.id}'] as num?)?.toInt() ?? 0), how: f.closes == null ? 'Check the funding window on the programme page.' : 'Closes ${f.closes}.', help: const ['coach'], stepKey: s.key));
          }
        case PlanStepKind.visa:
          add('visa', 'Visa', MilestoneItem(key: s.key, section: 'steps', title: s.title, due: s.end, status: status, how: ps.applyAt == null ? ps.note : 'Apply in ${ps.applyAt!.city} (${ps.applyAt!.country}). Only complete files are processed.', help: const ['coach', 'guide'], stepKey: s.key));
          for (final (i, c) in ps.checklist.indexed) {
            add('visa', 'Visa', MilestoneItem(key: '${s.key}|$i', section: 'checks', title: c.label ?? c.id ?? '', due: s.start, status: ((checks['${s.key}|$i'] as num?)?.toInt() ?? 0), help: const ['guide'], stepKey: s.key));
          }
        case PlanStepKind.study:
          add('study', 'Study', MilestoneItem(key: s.key, section: 'steps', title: s.title, due: s.end, status: status, how: [ps.institution, ps.city].where((x) => x != null && x.isNotEmpty).join(' · '), help: const ['coach'], stepKey: s.key));
        case PlanStepKind.work:
          add('work', 'Work', MilestoneItem(key: s.key, section: 'steps', title: s.title, due: s.end, status: status, how: [ps.institution, ps.city].where((x) => x != null && x.isNotEmpty).join(' · '), help: const ['coach'], stepKey: s.key));
      }
    }
    const order = ['visa', 'education', 'languages', 'experience', 'finances', 'admission', 'study', 'work', 'goal'];
    final keys = groups.keys.toList()..sort((a, b) => order.indexOf(a).compareTo(order.indexOf(b)));
    return MilestoneModel(phase: ph, groups: [for (final k in keys) MilestoneGroup(key: k, name: names[k]!, items: groups[k]!)], today: roadmap.todayYear);
  }
}
