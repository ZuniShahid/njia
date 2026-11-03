import '../models/models.dart';

/// The content a plan is computed from: one corridor's worth of approved documents.
/// Mirrors the `content` argument of `buildPlan` in functions/src/engine.mjs.
class ContentBundle {
  const ContentBundle({
    this.countries = const [],
    this.corridors = const [],
    this.pathways = const [],
    this.requirements = const [],
    this.residencePermits = const [],
    this.funding = const [],
    this.occupations = const [],
  });

  final List<Country> countries;
  final List<Corridor> corridors;
  final List<Pathway> pathways;
  final List<Requirement> requirements;
  final List<ResidencePermit> residencePermits;
  final List<Funding> funding;
  final List<Occupation> occupations;

  /// Builds a bundle from decoded JSON lists keyed by collection name, e.g. the seed files
  /// or a cached corridor bundle. Missing collections are empty.
  factory ContentBundle.fromJsonLists(Map<String, List<dynamic>> lists) {
    List<T> parse<T>(String key, T Function(Map<String, dynamic>) from) =>
        (lists[key] ?? const []).map((e) => from(Map<String, dynamic>.from(e as Map))).toList();
    return ContentBundle(
      countries: parse('countries', Country.fromJson),
      corridors: parse('corridors', Corridor.fromJson),
      pathways: parse('pathways', Pathway.fromJson),
      requirements: parse('requirements', Requirement.fromJson),
      residencePermits: parse('residencePermits', ResidencePermit.fromJson),
      funding: parse('funding', Funding.fromJson),
      occupations: parse('occupations', Occupation.fromJson),
    );
  }
}
