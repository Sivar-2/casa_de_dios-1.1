import 'package:flutter/material.dart';

/// ============================================================================
/// NavBarStyle — Premium configuration class for the Celestial Bottom Nav Bar.
///
/// Controls every visual detail: colors, sizes, durations, glow parameters,
/// and the divine light-beam cone effect.
/// ============================================================================
class NavBarStyle {
  // ── Colors ──
  final Color activeColor;
  final Color inactiveColor;
  final Color lightBeamColor;
  final Color backgroundColor;
  final Color fabColor;
  final Color fabIconColor;

  // ── Bar dimensions ──
  final double barElevation;
  final double fabElevation;
  final double notchMargin;
  final double barHeight;

  // ── Light beam cone parameters ──
  /// The width of the beam at its widest point (the top / sky origin).
  final double beamTopWidth;

  /// The width of the beam at its narrowest point (bottom, near the icon).
  final double beamBottomWidth;

  /// How tall the light cone extends above the bar.
  final double beamHeight;

  /// Peak opacity at the very top of the beam.
  final double beamPeakOpacity;

  /// Vertical offset (negative = above bar edge).
  final double effectTopOffset;

  // ── Glow dot parameters ──
  /// Whether to show a soft glow "source" dot at the beam origin.
  final bool showGlowDot;

  /// Radius of the glow source dot.
  final double glowDotRadius;

  /// Blur radius of the glow halo.
  final double glowBlur;

  /// Spread of the glow halo.
  final double glowSpread;

  // ── Animation ──
  final Duration beamAnimationDuration;
  final Duration iconAnimationDuration;
  final Curve animationCurve;

  // ── Icon / Label ──
  final double activeIconScale;
  final double iconSize;
  final double labelFontSize;
  final bool showLabels;
  final bool showLightBeam;

  const NavBarStyle({
    this.activeColor = const Color(0xFF00B4D8),
    this.inactiveColor = const Color(0xFFBCC3CD),
    this.lightBeamColor = const Color(0xFFFFD54F),
    this.backgroundColor = Colors.white,
    this.fabColor = const Color(0xFF00B4D8),
    this.fabIconColor = Colors.white,
    this.barElevation = 0.0,
    this.fabElevation = 8.0,
    this.notchMargin = 8.0,
    this.barHeight = 62.0,
    // THE LIGHT EFFECT: Tight at the top, wide at the bottom!
    this.beamTopWidth = 6.0,
    this.beamBottomWidth = 45.0,
    this.beamHeight = 72.0,
    this.beamPeakOpacity = 0.45,
    this.effectTopOffset = -16.0,
    this.showGlowDot = true,
    this.glowDotRadius = 3.0,
    this.glowBlur = 12.0,
    this.glowSpread = 3.0,
    this.beamAnimationDuration = const Duration(milliseconds: 450),
    this.iconAnimationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeOutCubic,
    this.activeIconScale = 1.1,
    this.iconSize = 24.0,
    this.labelFontSize = 10.0,
    this.showLabels = true,
    this.showLightBeam = true,
  });

  // ─────────────────────────────────────────────────────────────────────────
  //  PRESETS
  // ─────────────────────────────────────────────────────────────────────────

  /// Clean light mode — white bar, amber skylight.
  static const NavBarStyle light = NavBarStyle();

  /// Elegant dark mode.
  static const NavBarStyle dark = NavBarStyle(
    activeColor: Color(0xFF4FC3F7),
    inactiveColor: Color(0xFF5A6270),
    lightBeamColor: Color(0xFFFFD54F),
    backgroundColor: Color(0xFF14141F),
    fabColor: Color(0xFF4FC3F7),
    fabIconColor: Color(0xFF14141F),
    barElevation: 0.0,
    beamPeakOpacity: 0.55,
    glowBlur: 14.0,
    glowSpread: 4.0,
  );

  /// Warm gold — traditional church elegance.
  static const NavBarStyle warmGold = NavBarStyle(
    activeColor: Color(0xFFD4A54A),
    inactiveColor: Color(0xFFC0B8A8),
    lightBeamColor: Color(0xFFFFD700),
    backgroundColor: Color(0xFFFFFBF0),
    fabColor: Color(0xFFD4A54A),
    fabIconColor: Colors.white,
    beamPeakOpacity: 0.40,
  );

  /// Royal spirit — deep purple.
  static const NavBarStyle royalSpirit = NavBarStyle(
    activeColor: Color(0xFF7C4DFF),
    inactiveColor: Color(0xFF6E6E80),
    lightBeamColor: Color(0xFFB388FF),
    backgroundColor: Color(0xFF0D0D1A),
    fabColor: Color(0xFF7C4DFF),
    fabIconColor: Colors.white,
    beamPeakOpacity: 0.50,
    glowBlur: 16.0,
    glowSpread: 4.0,
  );

  /// Creates a copy with the given fields replaced.
  NavBarStyle copyWith({
    Color? activeColor,
    Color? inactiveColor,
    Color? lightBeamColor,
    Color? backgroundColor,
    Color? fabColor,
    Color? fabIconColor,
    double? barElevation,
    double? fabElevation,
    double? notchMargin,
    double? barHeight,
    double? beamTopWidth,
    double? beamBottomWidth,
    double? beamHeight,
    double? beamPeakOpacity,
    double? effectTopOffset,
    bool? showGlowDot,
    double? glowDotRadius,
    double? glowBlur,
    double? glowSpread,
    Duration? beamAnimationDuration,
    Duration? iconAnimationDuration,
    Curve? animationCurve,
    double? activeIconScale,
    double? iconSize,
    double? labelFontSize,
    bool? showLabels,
    bool? showLightBeam,
  }) {
    return NavBarStyle(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      lightBeamColor: lightBeamColor ?? this.lightBeamColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      fabColor: fabColor ?? this.fabColor,
      fabIconColor: fabIconColor ?? this.fabIconColor,
      barElevation: barElevation ?? this.barElevation,
      fabElevation: fabElevation ?? this.fabElevation,
      notchMargin: notchMargin ?? this.notchMargin,
      barHeight: barHeight ?? this.barHeight,
      beamTopWidth: beamTopWidth ?? this.beamTopWidth,
      beamBottomWidth: beamBottomWidth ?? this.beamBottomWidth,
      beamHeight: beamHeight ?? this.beamHeight,
      beamPeakOpacity: beamPeakOpacity ?? this.beamPeakOpacity,
      effectTopOffset: effectTopOffset ?? this.effectTopOffset,
      showGlowDot: showGlowDot ?? this.showGlowDot,
      glowDotRadius: glowDotRadius ?? this.glowDotRadius,
      glowBlur: glowBlur ?? this.glowBlur,
      glowSpread: glowSpread ?? this.glowSpread,
      beamAnimationDuration: beamAnimationDuration ?? this.beamAnimationDuration,
      iconAnimationDuration: iconAnimationDuration ?? this.iconAnimationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      activeIconScale: activeIconScale ?? this.activeIconScale,
      iconSize: iconSize ?? this.iconSize,
      labelFontSize: labelFontSize ?? this.labelFontSize,
      showLabels: showLabels ?? this.showLabels,
      showLightBeam: showLightBeam ?? this.showLightBeam,
    );
  }

  /// Linearly interpolates between two [NavBarStyle] instances.
  static NavBarStyle lerp(NavBarStyle a, NavBarStyle b, double t) {
    return NavBarStyle(
      activeColor: Color.lerp(a.activeColor, b.activeColor, t)!,
      inactiveColor: Color.lerp(a.inactiveColor, b.inactiveColor, t)!,
      lightBeamColor: Color.lerp(a.lightBeamColor, b.lightBeamColor, t)!,
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t)!,
      fabColor: Color.lerp(a.fabColor, b.fabColor, t)!,
      fabIconColor: Color.lerp(a.fabIconColor, b.fabIconColor, t)!,
      barElevation: _lerp(a.barElevation, b.barElevation, t),
      fabElevation: _lerp(a.fabElevation, b.fabElevation, t),
      notchMargin: _lerp(a.notchMargin, b.notchMargin, t),
      barHeight: _lerp(a.barHeight, b.barHeight, t),
      beamTopWidth: _lerp(a.beamTopWidth, b.beamTopWidth, t),
      beamBottomWidth: _lerp(a.beamBottomWidth, b.beamBottomWidth, t),
      beamHeight: _lerp(a.beamHeight, b.beamHeight, t),
      beamPeakOpacity: _lerp(a.beamPeakOpacity, b.beamPeakOpacity, t),
      effectTopOffset: _lerp(a.effectTopOffset, b.effectTopOffset, t),
      showGlowDot: t < 0.5 ? a.showGlowDot : b.showGlowDot,
      glowDotRadius: _lerp(a.glowDotRadius, b.glowDotRadius, t),
      glowBlur: _lerp(a.glowBlur, b.glowBlur, t),
      glowSpread: _lerp(a.glowSpread, b.glowSpread, t),
      beamAnimationDuration: t < 0.5 ? a.beamAnimationDuration : b.beamAnimationDuration,
      iconAnimationDuration: t < 0.5 ? a.iconAnimationDuration : b.iconAnimationDuration,
      animationCurve: t < 0.5 ? a.animationCurve : b.animationCurve,
      activeIconScale: _lerp(a.activeIconScale, b.activeIconScale, t),
      iconSize: _lerp(a.iconSize, b.iconSize, t),
      labelFontSize: _lerp(a.labelFontSize, b.labelFontSize, t),
      showLabels: t < 0.5 ? a.showLabels : b.showLabels,
      showLightBeam: t < 0.5 ? a.showLightBeam : b.showLightBeam,
    );
  }

  static double _lerp(double a, double b, double t) => a + (b - a) * t;
}
