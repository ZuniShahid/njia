// Design tokens ported 1:1 from app/prototype/njia.html (:root and the dark-mode block).
// Do not restyle here – the prototype is the reference (docs/prototype-notes.md).
import 'package:flutter/material.dart';

/// All colour/shape tokens of the prototype, available via `Theme.of(context).extension<NjiaTokens>()`
/// or the shorter `context.tokens`.
@immutable
class NjiaTokens extends ThemeExtension<NjiaTokens> {
  const NjiaTokens({
    required this.bg,
    required this.surface,
    required this.subtle,
    required this.line,
    required this.lineStrong,
    required this.ink,
    required this.muted,
    required this.nav,
    required this.nav2,
    required this.navInk,
    required this.navMuted,
    required this.brand,
    required this.brandSoft,
    required this.onBrand,
    required this.accent,
    required this.accentSoft,
    required this.ok,
    required this.okSoft,
    required this.warn,
    required this.warnSoft,
    required this.bad,
    required this.badSoft,
    required this.info,
    required this.infoSoft,
    required this.phases,
    required this.phasesSoft,
    required this.scrim,
    required this.shadow,
  });

  final Color bg, surface, subtle, line, lineStrong;
  final Color ink, muted;
  final Color nav, nav2, navInk, navMuted;
  final Color brand, brandSoft, onBrand, accent, accentSoft;
  final Color ok, okSoft, warn, warnSoft, bad, badSoft, info, infoSoft;

  /// Phase colours p1…p6 (index 0 = p1) and their soft variants.
  final List<Color> phases, phasesSoft;
  final Color scrim;
  final BoxShadow shadow;

  /// `--r` in the prototype: card radius.
  static const double radius = 14;
  static const double radiusSmall = 10;
  static const double radiusChip = 99;

  /// `--font` in the prototype.
  static const String fontFamily = 'Plus Jakarta Sans';

  /// Breakpoints from the prototype media queries.
  static const double wide = 1181; // ≥ 1181 px: nav · center · right panel
  static const double narrow = 860; // ≤ 860 px: bottom nav, no left nav

  static const light = NjiaTokens(
    bg: Color(0xFFF2F4F3),
    surface: Color(0xFFFFFFFF),
    subtle: Color(0xFFE9EEEC),
    line: Color(0xFFDFE5E2),
    lineStrong: Color(0xFFC3CDC9),
    ink: Color(0xFF13211F),
    muted: Color(0xFF5A6A67),
    nav: Color(0xFF10201E),
    nav2: Color(0xFF1C312E),
    navInk: Color(0xFFEEF2F0),
    navMuted: Color(0xFF93A7A3),
    brand: Color(0xFF0E5E57),
    brandSoft: Color(0xFFDDEDEA),
    onBrand: Color(0xFFFFFFFF),
    accent: Color(0xFFE08A22),
    accentSoft: Color(0xFFFCEFD9),
    ok: Color(0xFF2F8F5B),
    okSoft: Color(0xFFE0F1E7),
    warn: Color(0xFFB86A12),
    warnSoft: Color(0xFFFBEEDB),
    bad: Color(0xFFC2483B),
    badSoft: Color(0xFFF8E4E1),
    info: Color(0xFF3B6FD8),
    infoSoft: Color(0xFFE6EDFB),
    phases: [Color(0xFF2F8F5B), Color(0xFF3B6FD8), Color(0xFF7A5AF8), Color(0xFFD97E12), Color(0xFFD9467A), Color(0xFF0E5E57)],
    phasesSoft: [Color(0xFFE0F1E7), Color(0xFFE6EDFB), Color(0xFFEEEAFE), Color(0xFFFCEFD9), Color(0xFFFBE7EF), Color(0xFFDDEDEA)],
    scrim: Color(0x7308110F),
    shadow: BoxShadow(color: Color(0x2910201E), blurRadius: 40, offset: Offset(0, 16)),
  );

  static const dark = NjiaTokens(
    bg: Color(0xFF0D1716),
    surface: Color(0xFF15211F),
    subtle: Color(0xFF1E2D2A),
    line: Color(0xFF263734),
    lineStrong: Color(0xFF36504B),
    ink: Color(0xFFE8EFEC),
    muted: Color(0xFF9AAFAA),
    nav: Color(0xFF08110F),
    nav2: Color(0xFF15231F),
    navInk: Color(0xFFEEF2F0),
    navMuted: Color(0xFF7F948F),
    brand: Color(0xFF4DB3A6),
    brandSoft: Color(0xFF173A35),
    onBrand: Color(0xFF06201C),
    accent: Color(0xFFF0A548),
    accentSoft: Color(0xFF3A2A14),
    ok: Color(0xFF5CC28A),
    okSoft: Color(0xFF163626),
    warn: Color(0xFFE9A24F),
    warnSoft: Color(0xFF3A2A14),
    bad: Color(0xFFEE7A6C),
    badSoft: Color(0xFF3B1E1A),
    info: Color(0xFF7EA4F2),
    infoSoft: Color(0xFF1B2843),
    phases: [Color(0xFF5CC28A), Color(0xFF7EA4F2), Color(0xFFA893FF), Color(0xFFF0A548), Color(0xFFF07AA3), Color(0xFF4DB3A6)],
    phasesSoft: [Color(0xFF163626), Color(0xFF1B2843), Color(0xFF2A2350), Color(0xFF3A2A14), Color(0xFF3D1C29), Color(0xFF173A35)],
    scrim: Color(0x99000000),
    shadow: BoxShadow(color: Color(0x80000000), blurRadius: 40, offset: Offset(0, 16)),
  );

  @override
  NjiaTokens copyWith() => this;

  @override
  NjiaTokens lerp(ThemeExtension<NjiaTokens>? other, double t) {
    if (other is! NjiaTokens) return this;
    Color c(Color a, Color b) => Color.lerp(a, b, t)!;
    return NjiaTokens(
      bg: c(bg, other.bg),
      surface: c(surface, other.surface),
      subtle: c(subtle, other.subtle),
      line: c(line, other.line),
      lineStrong: c(lineStrong, other.lineStrong),
      ink: c(ink, other.ink),
      muted: c(muted, other.muted),
      nav: c(nav, other.nav),
      nav2: c(nav2, other.nav2),
      navInk: c(navInk, other.navInk),
      navMuted: c(navMuted, other.navMuted),
      brand: c(brand, other.brand),
      brandSoft: c(brandSoft, other.brandSoft),
      onBrand: c(onBrand, other.onBrand),
      accent: c(accent, other.accent),
      accentSoft: c(accentSoft, other.accentSoft),
      ok: c(ok, other.ok),
      okSoft: c(okSoft, other.okSoft),
      warn: c(warn, other.warn),
      warnSoft: c(warnSoft, other.warnSoft),
      bad: c(bad, other.bad),
      badSoft: c(badSoft, other.badSoft),
      info: c(info, other.info),
      infoSoft: c(infoSoft, other.infoSoft),
      phases: [for (var i = 0; i < 6; i++) c(phases[i], other.phases[i])],
      phasesSoft: [for (var i = 0; i < 6; i++) c(phasesSoft[i], other.phasesSoft[i])],
      scrim: c(scrim, other.scrim),
      shadow: BoxShadow.lerp(shadow, other.shadow, t)!,
    );
  }
}

extension NjiaTokensContext on BuildContext {
  NjiaTokens get tokens => Theme.of(this).extension<NjiaTokens>() ?? NjiaTokens.light;
}

/// Builds the Material theme from the tokens: body 14 px / 1.5, h1 24·700, h2 18·700, h3 16·600,
/// cards 14 px radius with a 1 px line, buttons 10 px radius.
ThemeData njiaTheme(Brightness brightness) {
  final t = brightness == Brightness.dark ? NjiaTokens.dark : NjiaTokens.light;
  final scheme = ColorScheme(
    brightness: brightness,
    primary: t.brand,
    onPrimary: t.onBrand,
    primaryContainer: t.brandSoft,
    onPrimaryContainer: t.brand,
    secondary: t.accent,
    onSecondary: const Color(0xFF13211F),
    secondaryContainer: t.accentSoft,
    onSecondaryContainer: t.warn,
    tertiary: t.info,
    onTertiary: t.surface,
    tertiaryContainer: t.infoSoft,
    onTertiaryContainer: t.info,
    error: t.bad,
    onError: t.surface,
    errorContainer: t.badSoft,
    onErrorContainer: t.bad,
    surface: t.surface,
    onSurface: t.ink,
    surfaceContainerHighest: t.subtle,
    onSurfaceVariant: t.muted,
    outline: t.lineStrong,
    outlineVariant: t.line,
    shadow: t.shadow.color,
    scrim: t.scrim,
    inverseSurface: t.nav,
    onInverseSurface: t.navInk,
    inversePrimary: t.brandSoft,
  );
  final text = TextTheme(
    headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: -0.24, color: t.ink, height: 1.25), // h1
    titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: t.ink, height: 1.3), // h2
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: t.ink, height: 1.35), // h3
    bodyMedium: TextStyle(fontSize: 14, color: t.ink, height: 1.5),
    bodySmall: TextStyle(fontSize: 12, color: t.muted, height: 1.5), // .cap
    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: t.ink), // .lab
    labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 0.77, color: t.muted), // .over
  ).apply(fontFamily: NjiaTokens.fontFamily);
  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: scheme,
    scaffoldBackgroundColor: t.bg,
    fontFamily: NjiaTokens.fontFamily,
    textTheme: text,
    extensions: [t],
    dividerColor: t.line,
    cardTheme: CardThemeData(
      color: t.surface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(NjiaTokens.radius),
        side: BorderSide(color: t.line),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: t.brand,
        foregroundColor: t.onBrand,
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontFamily: NjiaTokens.fontFamily),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(NjiaTokens.radiusSmall)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: t.ink,
        backgroundColor: t.surface,
        side: BorderSide(color: t.lineStrong),
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontFamily: NjiaTokens.fontFamily),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(NjiaTokens.radiusSmall)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: t.brand, textStyle: const TextStyle(fontWeight: FontWeight.w600, fontFamily: NjiaTokens.fontFamily)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: t.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(NjiaTokens.radiusSmall), borderSide: BorderSide(color: t.lineStrong)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(NjiaTokens.radiusSmall), borderSide: BorderSide(color: t.lineStrong)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(NjiaTokens.radiusSmall), borderSide: BorderSide(color: t.accent, width: 2)),
      labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: t.muted),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: t.surface,
      selectedColor: t.brandSoft,
      side: BorderSide(color: t.line),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(NjiaTokens.radiusChip)),
      labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: t.ink, fontFamily: NjiaTokens.fontFamily),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: t.surface,
      indicatorColor: t.brandSoft,
      labelTextStyle: WidgetStatePropertyAll(TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: t.muted, fontFamily: NjiaTokens.fontFamily)),
    ),
    tabBarTheme: TabBarThemeData(labelColor: t.brand, unselectedLabelColor: t.muted, indicatorColor: t.brand, dividerColor: t.line),
    focusColor: t.accent,
  );
}
