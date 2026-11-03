import '../../core/models/models.dart';

/// Prototype `gTitle`: "Head of Department · Deutsche Bank".
String goalTitle(Goal g) {
  final role = (g.title ?? '').isEmpty ? 'Untitled goal' : g.title!;
  final emp = g.employer ?? '';
  return emp.isEmpty ? role : '$role · $emp';
}

/// Prototype `gLoc`: "Frankfurt, Germany" (country name resolved by the caller).
String goalLocation(Goal g, String countryName) => [g.city, countryName].where((x) => x != null && x.isNotEmpty).join(', ');
