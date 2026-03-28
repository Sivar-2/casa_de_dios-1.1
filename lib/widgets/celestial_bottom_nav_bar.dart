import 'package:flutter/material.dart';
import 'celestial_nav_bar_style.dart';

/// ============================================================================
/// CelestialBottomNavBar — A premium, animated bottom navigation bar with
/// celestial light-beam effects, smooth transitions, and configurable styling.
///
/// Usage:
///   CelestialBottomNavBar(
///     selectedIndex: _selectedIndex,
///     onTabSelected: (index) => setState(() => _selectedIndex = index),
///     style: NavBarStyle.light,  // or .dark, .warmGold, .royalSpirit
///   )
/// ============================================================================
class CelestialBottomNavBar extends StatelessWidget {
  /// The currently selected tab index (0–3).
  final int selectedIndex;

  /// Callback invoked when a tab is tapped.
  final ValueChanged<int> onTabSelected;

  /// Callback invoked when the center FAB is tapped.
  final VoidCallback? onFabPressed;

  /// The icon displayed inside the center FAB.
  final IconData fabIcon;

  /// The visual style configuration. Defaults to [NavBarStyle.light].
  final NavBarStyle style;

  /// The navigation items configuration.
  final List<CelestialNavItem> items;

  const CelestialBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
    this.onFabPressed,
    this.fabIcon = Icons.favorite,
    this.style = const NavBarStyle(),
    this.items = const [
      CelestialNavItem(icon: Icons.home_filled, label: 'Inicio'),
      CelestialNavItem(icon: Icons.play_circle_fill, label: 'Media'),
      CelestialNavItem(icon: Icons.event, label: 'Eventos'),
      CelestialNavItem(icon: Icons.person, label: 'Perfil'),
    ],
  }) : assert(items.length == 4, 'CelestialBottomNavBar requires exactly 4 items.');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // We need enough height for the bar plus the effects that overflow above it
      height: style.barHeight + style.effectTopOffset.abs() + 8,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // ── The BottomAppBar with notch ──
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: style.notchMargin,
              color: style.backgroundColor,
              elevation: style.barElevation,
              child: SizedBox(
                height: style.barHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Left side items
                    _AnimatedNavItem(
                      item: items[0],
                      index: 0,
                      isSelected: selectedIndex == 0,
                      onTap: () => onTabSelected(0),
                      style: style,
                    ),
                    _AnimatedNavItem(
                      item: items[1],
                      index: 1,
                      isSelected: selectedIndex == 1,
                      onTap: () => onTabSelected(1),
                      style: style,
                    ),

                    // Center spacer for FAB
                    SizedBox(width: MediaQuery.of(context).size.width * 0.12),

                    // Right side items
                    _AnimatedNavItem(
                      item: items[2],
                      index: 2,
                      isSelected: selectedIndex == 2,
                      onTap: () => onTabSelected(2),
                      style: style,
                    ),
                    _AnimatedNavItem(
                      item: items[3],
                      index: 3,
                      isSelected: selectedIndex == 3,
                      onTap: () => onTabSelected(3),
                      style: style,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Data class for a single navigation item.
class CelestialNavItem {
  final IconData icon;
  final String label;

  const CelestialNavItem({
    required this.icon,
    required this.label,
  });
}

/// ============================================================================
/// _AnimatedNavItem — A single nav item with explicit animation controllers
/// for the celestial light beam, glow line, icon color, and icon scale.
/// ============================================================================
class _AnimatedNavItem extends StatefulWidget {
  final CelestialNavItem item;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;
  final NavBarStyle style;

  const _AnimatedNavItem({
    required this.item,
    required this.index,
    required this.isSelected,
    required this.onTap,
    required this.style,
  });

  @override
  State<_AnimatedNavItem> createState() => _AnimatedNavItemState();
}

class _AnimatedNavItemState extends State<_AnimatedNavItem>
    with TickerProviderStateMixin {
  late AnimationController _beamController;
  late AnimationController _iconController;

  late Animation<double> _beamFadeAnimation;
  late Animation<Offset> _beamSlideAnimation;
  late Animation<double> _glowFadeAnimation;
  late Animation<double> _iconScaleAnimation;
  late Animation<double> _iconColorAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();

    // If already selected on first build, snap to the final state
    if (widget.isSelected) {
      _beamController.value = 1.0;
      _iconController.value = 1.0;
    }
  }

  void _initAnimations() {
    // ── Beam / Glow animation controller ──
    _beamController = AnimationController(
      vsync: this,
      duration: widget.style.beamAnimationDuration,
    );

    _beamFadeAnimation = CurvedAnimation(
      parent: _beamController,
      curve: widget.style.animationCurve,
    );

    _beamSlideAnimation = Tween<Offset>(
      begin: const Offset(0.0, -0.3), // slides in from slightly above
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _beamController,
      curve: widget.style.animationCurve,
    ));

    _glowFadeAnimation = CurvedAnimation(
      parent: _beamController,
      curve: Interval(0.15, 1.0, curve: widget.style.animationCurve),
    );

    // ── Icon animation controller ──
    _iconController = AnimationController(
      vsync: this,
      duration: widget.style.iconAnimationDuration,
    );

    _iconScaleAnimation = Tween<double>(
      begin: 1.0,
      end: widget.style.activeIconScale,
    ).animate(CurvedAnimation(
      parent: _iconController,
      curve: widget.style.animationCurve,
    ));

    _iconColorAnimation = CurvedAnimation(
      parent: _iconController,
      curve: widget.style.animationCurve,
    );
  }

  @override
  void didUpdateWidget(covariant _AnimatedNavItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isSelected != oldWidget.isSelected) {
      if (widget.isSelected) {
        _beamController.forward();
        _iconController.forward();
      } else {
        _beamController.reverse();
        _iconController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _beamController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.style;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: SizedBox(
        width: 64,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // ── CELESTIAL LIGHT BEAM ──
            if (style.showLightBeam)
              Positioned(
                top: style.effectTopOffset,
                child: SlideTransition(
                  position: _beamSlideAnimation,
                  child: FadeTransition(
                    opacity: _beamFadeAnimation,
                    child: Container(
                      width: style.lightBeamWidth,
                      height: style.lightBeamHeight,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            style.lightBeamColor
                                .withValues(alpha: style.lightBeamOpacity),
                            style.lightBeamColor.withValues(alpha: 0.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // ── TOP GLOWING ACCENT LINE ──
            if (style.showGlowLine)
              Positioned(
                top: style.effectTopOffset,
                child: FadeTransition(
                  opacity: _glowFadeAnimation,
                  child: Container(
                    width: style.glowLineWidth,
                    height: style.glowLineHeight,
                    decoration: BoxDecoration(
                      color: style.lightBeamColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: style.lightBeamColor.withValues(alpha: 0.8),
                          blurRadius: style.glowIntensity,
                          spreadRadius: style.glowSpread,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            // ── ICON + LABEL ──
            AnimatedBuilder(
              animation: _iconController,
              builder: (context, child) {
                final Color currentColor = Color.lerp(
                  style.inactiveColor,
                  style.activeColor,
                  _iconColorAnimation.value,
                )!;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Transform.scale(
                      scale: _iconScaleAnimation.value,
                      child: Icon(
                        widget.item.icon,
                        color: currentColor,
                        size: style.iconSize,
                      ),
                    ),
                    if (style.showLabels) ...[
                      const SizedBox(height: 4),
                      Text(
                        widget.item.label,
                        style: TextStyle(
                          fontSize: style.labelFontSize,
                          fontWeight: widget.isSelected
                              ? FontWeight.w700
                              : FontWeight.w400,
                          color: currentColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
