import 'package:flutter/material.dart';

/// ============================================================================
/// NavBarStyle — Configuration class for the Celestial Bottom Navigation Bar.
///
/// This class provides a single point of control for the entire look and feel
/// of the custom navigation bar. Change colors, opacities, durations, and
/// toggle between light/dark modes without touching any widget code.
/// ============================================================================
class NavBarStyle {
  /// The primary highlight color used for the active icon and label.
  final Color activeColor;

  /// The color used for inactive icons and labels.
  final Color inactiveColor;

  /// The color of the celestial light beam effect.
  final Color lightBeamColor;

  /// The background color of the navigation bar itself.
  final Color backgroundColor;

  /// The background color of the floating action button.
  final Color fabColor;

  /// The icon color inside the floating action button.
  final Color fabIconColor;

  /// The elevation (shadow depth) of the navigation bar.
  final double barElevation;

  /// The elevation of the floating action button.
  final double fabElevation;

  /// The notch margin between the FAB and the bar cutout.
  final double notchMargin;

  /// The height of the navigation bar content area.
  final double barHeight;

  /// The opacity of the light beam gradient at its strongest point (top).
  final double lightBeamOpacity;

  /// The glow intensity (blur radius) of the top accent line.
  final double glowIntensity;

  /// The spread radius of the glow effect on the top line.
  final double glowSpread;

  /// The width of the top glowing accent line.
  final double glowLineWidth;

  /// The height of the top glowing accent line.
  final double glowLineHeight;

  /// The width of the light beam column.
  final double lightBeamWidth;

  /// The height of the light beam column.
  final double lightBeamHeight;

  /// The vertical offset for the light beam and glow (negative = above bar edge).
  final double effectTopOffset;

  /// Duration for the light beam fade/slide animation.
  final Duration beamAnimationDuration;

  /// Duration for the icon color and scale transition.
  final Duration iconAnimationDuration;

  /// The curve used for all entrance animations.
  final Curve animationCurve;

  /// The scale factor applied to the active icon.
  final double activeIconScale;

  /// The size of navigation icons.
  final double iconSize;

  /// The font size of navigation labels.
  final double labelFontSize;

  /// Whether to show labels beneath icons.
  final bool showLabels;

  /// Whether to show the celestial light beam effect.
  final bool showLightBeam;

  /// Whether to show the glowing top accent line.
  final bool showGlowLine;

  const NavBarStyle({
    this.activeColor = const Color(0xFF00B4D8),
    this.inactiveColor = const Color(0xFF9E9E9E),
    this.lightBeamColor = const Color(0xFFFFE082),
    this.backgroundColor = Colors.white,
    this.fabColor = const Color(0xFF00B4D8),
    this.fabIconColor = Colors.white,
    this.barElevation = 12.0,
    this.fabElevation = 6.0,
    this.notchMargin = 8.0,
    this.barHeight = 70.0,
    this.lightBeamOpacity = 0.5,
    this.glowIntensity = 10.0,
    this.glowSpread = 2.0,
    this.glowLineWidth = 30.0,
    this.glowLineHeight = 3.0,
    this.lightBeamWidth = 40.0,
    this.lightBeamHeight = 55.0,
    this.effectTopOffset = -10.0,
    this.beamAnimationDuration = const Duration(milliseconds: 350),
    this.iconAnimationDuration = const Duration(milliseconds: 250),
    this.animationCurve = Curves.easeOutCubic,
    this.activeIconScale = 1.15,
    this.iconSize = 26.0,
    this.labelFontSize = 10.0,
    this.showLabels = true,
    this.showLightBeam = true,
    this.showGlowLine = true,
  });

  // ─────────────────────────────────────────────────────────────────────────
  //  PRESETS — Ready-to-use style configurations
  // ─────────────────────────────────────────────────────────────────────────

  /// Default light mode with celestial sky-blue and amber light.
  static const NavBarStyle light = NavBarStyle();

  /// Elegant dark mode with deep backgrounds and cool-toned highlights.
  static const NavBarStyle dark = NavBarStyle(
    activeColor: Color(0xFF4FC3F7),
    inactiveColor: Color(0xFF757575),
    lightBeamColor: Color(0xFFFFD54F),
    backgroundColor: Color(0xFF1A1A2E),
    fabColor: Color(0xFF4FC3F7),
    fabIconColor: Color(0xFF1A1A2E),
    barElevation: 16.0,
    lightBeamOpacity: 0.6,
    glowIntensity: 14.0,
    glowSpread: 3.0,
  );

  /// A warm, golden-toned style for a more traditional church feel.
  static const NavBarStyle warmGold = NavBarStyle(
    activeColor: Color(0xFFD4A54A),
    inactiveColor: Color(0xFFBDBDBD),
    lightBeamColor: Color(0xFFFFD700),
    backgroundColor: Color(0xFFFFF8E1),
    fabColor: Color(0xFFD4A54A),
    fabIconColor: Colors.white,
    lightBeamOpacity: 0.45,
    glowIntensity: 12.0,
  );

  /// A deep purple/indigo spiritual theme.
  static const NavBarStyle royalSpirit = NavBarStyle(
    activeColor: Color(0xFF7C4DFF),
    inactiveColor: Color(0xFF9E9E9E),
    lightBeamColor: Color(0xFFB388FF),
    backgroundColor: Color(0xFF0D0D1A),
    fabColor: Color(0xFF7C4DFF),
    fabIconColor: Colors.white,
    barElevation: 20.0,
    lightBeamOpacity: 0.55,
    glowIntensity: 16.0,
    glowSpread: 4.0,
  );

  /// Creates a copy of this style with the given fields replaced.
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
    double? lightBeamOpacity,
    double? glowIntensity,
    double? glowSpread,
    double? glowLineWidth,
    double? glowLineHeight,
    double? lightBeamWidth,
    double? lightBeamHeight,
    double? effectTopOffset,
    Duration? beamAnimationDuration,
    Duration? iconAnimationDuration,
    Curve? animationCurve,
    double? activeIconScale,
    double? iconSize,
    double? labelFontSize,
    bool? showLabels,
    bool? showLightBeam,
    bool? showGlowLine,
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
      lightBeamOpacity: lightBeamOpacity ?? this.lightBeamOpacity,
      glowIntensity: glowIntensity ?? this.glowIntensity,
      glowSpread: glowSpread ?? this.glowSpread,
      glowLineWidth: glowLineWidth ?? this.glowLineWidth,
      glowLineHeight: glowLineHeight ?? this.glowLineHeight,
      lightBeamWidth: lightBeamWidth ?? this.lightBeamWidth,
      lightBeamHeight: lightBeamHeight ?? this.lightBeamHeight,
      effectTopOffset: effectTopOffset ?? this.effectTopOffset,
      beamAnimationDuration: beamAnimationDuration ?? this.beamAnimationDuration,
      iconAnimationDuration: iconAnimationDuration ?? this.iconAnimationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      activeIconScale: activeIconScale ?? this.activeIconScale,
      iconSize: iconSize ?? this.iconSize,
      labelFontSize: labelFontSize ?? this.labelFontSize,
      showLabels: showLabels ?? this.showLabels,
      showLightBeam: showLightBeam ?? this.showLightBeam,
      showGlowLine: showGlowLine ?? this.showGlowLine,
    );
  }

  /// Linearly interpolates between two [NavBarStyle] instances.
  /// Useful for animated theme transitions.
  static NavBarStyle lerp(NavBarStyle a, NavBarStyle b, double t) {
    return NavBarStyle(
      activeColor: Color.lerp(a.activeColor, b.activeColor, t)!,
      inactiveColor: Color.lerp(a.inactiveColor, b.inactiveColor, t)!,
      lightBeamColor: Color.lerp(a.lightBeamColor, b.lightBeamColor, t)!,
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t)!,
      fabColor: Color.lerp(a.fabColor, b.fabColor, t)!,
      fabIconColor: Color.lerp(a.fabIconColor, b.fabIconColor, t)!,
      barElevation: _lerpDouble(a.barElevation, b.barElevation, t),
      fabElevation: _lerpDouble(a.fabElevation, b.fabElevation, t),
      notchMargin: _lerpDouble(a.notchMargin, b.notchMargin, t),
      barHeight: _lerpDouble(a.barHeight, b.barHeight, t),
      lightBeamOpacity: _lerpDouble(a.lightBeamOpacity, b.lightBeamOpacity, t),
      glowIntensity: _lerpDouble(a.glowIntensity, b.glowIntensity, t),
      glowSpread: _lerpDouble(a.glowSpread, b.glowSpread, t),
      glowLineWidth: _lerpDouble(a.glowLineWidth, b.glowLineWidth, t),
      glowLineHeight: _lerpDouble(a.glowLineHeight, b.glowLineHeight, t),
      lightBeamWidth: _lerpDouble(a.lightBeamWidth, b.lightBeamWidth, t),
      lightBeamHeight: _lerpDouble(a.lightBeamHeight, b.lightBeamHeight, t),
      effectTopOffset: _lerpDouble(a.effectTopOffset, b.effectTopOffset, t),
      beamAnimationDuration: t < 0.5 ? a.beamAnimationDuration : b.beamAnimationDuration,
      iconAnimationDuration: t < 0.5 ? a.iconAnimationDuration : b.iconAnimationDuration,
      animationCurve: t < 0.5 ? a.animationCurve : b.animationCurve,
      activeIconScale: _lerpDouble(a.activeIconScale, b.activeIconScale, t),
      iconSize: _lerpDouble(a.iconSize, b.iconSize, t),
      labelFontSize: _lerpDouble(a.labelFontSize, b.labelFontSize, t),
      showLabels: t < 0.5 ? a.showLabels : b.showLabels,
      showLightBeam: t < 0.5 ? a.showLightBeam : b.showLightBeam,
      showGlowLine: t < 0.5 ? a.showGlowLine : b.showGlowLine,
    );
  }

  static double _lerpDouble(double a, double b, double t) => a + (b - a) * t;
}
