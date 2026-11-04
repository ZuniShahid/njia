// Readiness screen model: the route's requirements grouped into the prototype's dimensions,
// each evaluated against the profile facts. Pure Dart.
import '../models/models.dart';
import 'engine.dart';

class ReadinessItem {
  const ReadinessItem({required this.requirement, required this.status, required this.weight});
  final Requirement requirement;
  final RequirementStatus status;

  /// Points this item adds to the overall score (requirements count equally in the engine).
  final int weight;
  bool get met => status == RequirementStatus.met;
}

class ReadinessDimension {
  const ReadinessDimension({required this.key, required this.label, required this.items});
  final String key;
  final String label;
  final List<ReadinessItem> items;
  int get score => items.isEmpty ? 100 : (100 * items.fold<double>(0, (s, i) => s + (i.met ? 1 : i.status == RequirementStatus.unknown ? 0.5 : 0)) / items.length).round();
}

class ReadinessModel {
  const ReadinessModel({required this.dimensions, required this.overall, required this.items, required this.facts});
  final List<ReadinessDimension> dimensions;
  final int overall;
  final List<ReadinessItem> items;
  final Map<String, Object?> facts;

  /// Dimension of a requirement type (prototype: Education · Languages · Experience · Finances · Visa & legal).
  static String dimensionOf(RequirementType t) => switch (t) {
        RequirementType.degree || RequirementType.grade || RequirementType.recognition || RequirementType.exam => 'education',
        RequirementType.languageTest => 'languages',
        RequirementType.experience => 'experience',
        RequirementType.funds => 'finances',
        _ => 'visa',
      };

  static const dimensionLabels = {'education': 'Education', 'languages': 'Languages', 'experience': 'Experience', 'finances': 'Finances', 'visa': 'Visa & legal'};

  factory ReadinessModel.build({required Goal goal, required UserProfile profile, required ContentBundle content}) {
    final permitById = {for (final p in content.residencePermits) p.id: p};
    final reqById = {for (final r in content.requirements) r.id: r};
    final pathways = selectPathways(goal, content);
    final ids = neededRequirementIds(pathways, permitById);
    final facts = factsFromProfile(profile);
    final reqs = ids.map((id) => reqById[id]).whereType<Requirement>().toList();
    final weight = reqs.isEmpty ? 0 : (100 / reqs.length).round();
    final items = [for (final r in reqs) ReadinessItem(requirement: r, status: evaluateRequirement(r, facts).status, weight: weight)];
    final dims = <ReadinessDimension>[
      for (final e in dimensionLabels.entries)
        if (items.any((i) => dimensionOf(i.requirement.type) == e.key))
          ReadinessDimension(key: e.key, label: e.value, items: items.where((i) => dimensionOf(i.requirement.type) == e.key).toList()),
    ];
    return ReadinessModel(dimensions: dims, overall: readinessScore(ids, reqById, facts).score, items: items, facts: facts);
  }

  /// Open items that raise the score most (all weights are equal, so: gaps first, then unknown).
  List<ReadinessItem> get levers {
    final open = items.where((i) => !i.met).toList()
      ..sort((a, b) => (a.status == RequirementStatus.gap ? 0 : 1).compareTo(b.status == RequirementStatus.gap ? 0 : 1));
    return open.take(4).toList();
  }

  /// The fact value that satisfies a requirement when the student ticks it (null = cannot be derived).
  static Object? satisfyingValue(Requirement r) => switch (r.operator) {
        RequirementOperator.exists => true,
        RequirementOperator.eq => r.value,
        RequirementOperator.gte || RequirementOperator.lte => r.value,
        RequirementOperator.inList => (r.value is List && (r.value as List).isNotEmpty) ? (r.value as List).first : null,
        null => null,
      };
}
