import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'celestial_nav_bar_style.dart';

/// ============================================================================
/// CelestialBottomNavBar — A premium, animated bottom navigation bar with
/// a divine "light from the sky" effect (tight at top, wide at bottom).
/// ============================================================================
class CelestialBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final VoidCallback? onFabPressed;
  final IconData fabIcon;
  final NavBarStyle style;
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: style.backgroundColor,
        boxShadow: [
          if (style.barElevation > 0)
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: style.barElevation,
              offset: const Offset(0, -2),
            ),
        ],
        border: Border(
          top: BorderSide(
            color: style.inactiveColor.withValues(alpha: 0.15),
            width: 0.5,
          ),
        ),
      ),
      child: SizedBox(
        height: style.barHeight + style.effectTopOffset.abs() + 12,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: style.notchMargin,
                color: Colors.transparent, 
                elevation: 0,
                child: SizedBox(
                  height: style.barHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _AnimatedNavItem(item: items[0], index: 0, isSelected: selectedIndex == 0, onTap: () => onTabSelected(0), style: style),
                      _AnimatedNavItem(item: items[1], index: 1, isSelected: selectedIndex == 1, onTap: () => onTabSelected(1), style: style),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.12),
                      _AnimatedNavItem(item: items[2], index: 2, isSelected: selectedIndex == 2, onTap: () => onTabSelected(2), style: style),
                      _AnimatedNavItem(item: items[3], index: 3, isSelected: selectedIndex == 3, onTap: () => onTabSelected(3), style: style),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CelestialNavItem {
  final IconData icon;
  final String label;

  const CelestialNavItem({required this.icon, required this.label});
}

class _AnimatedNavItem extends StatefulWidget {
  final CelestialNavItem item;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;
  final NavBarStyle style;

  const _AnimatedNavItem({required this.item, required this.index, required this.isSelected, required this.onTap, required this.style});

  @override
  State<_AnimatedNavItem> createState() => _AnimatedNavItemState();
}

class _AnimatedNavItemState extends State<_AnimatedNavItem> with TickerProviderStateMixin {
  late AnimationController _beamController;
  late AnimationController _iconController;

  late Animation<double> _beamOpacity;
  late Animation<double> _beamScale;
  late Animation<double> _glowOpacity;
  late Animation<double> _iconScale;
  late Animation<double> _iconColorT;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    if (widget.isSelected) {
      _beamController.value = 1.0;
      _iconController.value = 1.0;
    }
  }

  void _initAnimations() {
    _beamController = AnimationController(vsync: this, duration: widget.style.beamAnimationDuration);
    _beamOpacity = CurvedAnimation(parent: _beamController, curve: Curves.easeOut);
    _beamScale = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _beamController, curve: widget.style.animationCurve));
    _glowOpacity = CurvedAnimation(parent: _beamController, curve: const Interval(0.2, 1.0, curve: Curves.easeOut));

    _iconController = AnimationController(vsync: this, duration: widget.style.iconAnimationDuration);
    _iconScale = Tween<double>(begin: 1.0, end: widget.style.activeIconScale).animate(CurvedAnimation(parent: _iconController, curve: widget.style.animationCurve));
    _iconColorT = CurvedAnimation(parent: _iconController, curve: widget.style.animationCurve);
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
    final maxW = math.max(style.beamTopWidth, style.beamBottomWidth);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: SizedBox(
        width: 64, // Touch target
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // ── DIVINE LIGHT SPOTLIGHT BEAM ──
            if (style.showLightBeam)
              Positioned(
                top: style.effectTopOffset,
                child: AnimatedBuilder(
                  animation: _beamController,
                  builder: (context, child) {
                    if (_beamScale.value == 0) return const SizedBox.shrink();
                    
                    return Opacity(
                      opacity: _beamOpacity.value,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: CustomPaint(
                          size: Size(maxW, style.beamHeight * _beamScale.value),
                          painter: _DivineLightPainter(
                            color: style.lightBeamColor,
                            topWidth: style.beamTopWidth,
                            bottomWidth: style.beamBottomWidth,
                            peakOpacity: style.beamPeakOpacity,
                            heightProgress: _beamScale.value,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

            // ── GLOWING SOURCE DOT ──
            if (style.showGlowDot)
              Positioned(
                top: style.effectTopOffset - (style.glowDotRadius / 2),
                child: FadeTransition(
                  opacity: _glowOpacity,
                  child: Container(
                    width: style.glowDotRadius * 2,
                    height: style.glowDotRadius * 2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: style.lightBeamColor,
                      boxShadow: [
                        BoxShadow(
                          color: style.lightBeamColor.withValues(alpha: 0.8),
                          blurRadius: style.glowBlur,
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
                  _iconColorT.value,
                )!;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Transform.scale(
                      scale: _iconScale.value,
                      child: Icon(widget.item.icon, color: currentColor, size: style.iconSize),
                    ),
                    if (style.showLabels) ...[
                      const SizedBox(height: 3),
                      Text(
                        widget.item.label,
                        style: TextStyle(
                          fontSize: style.labelFontSize,
                          fontWeight: widget.isSelected ? FontWeight.w600 : FontWeight.w400,
                          color: currentColor,
                          letterSpacing: 0.3,
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

class _DivineLightPainter extends CustomPainter {
  final Color color;
  final double topWidth;
  final double bottomWidth;
  final double peakOpacity;
  final double heightProgress;

  _DivineLightPainter({
    required this.color,
    required this.topWidth,
    required this.bottomWidth,
    required this.peakOpacity,
    required this.heightProgress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (size.height <= 0) return;

    final double w = size.width;
    final double h = size.height;
    
    // Width at current height (for animation)
    final currentBottomWidth = topWidth + (bottomWidth - topWidth) * heightProgress;

    Path path = Path();
    
    // Centered trapezoid points
    path.moveTo((w / 2) - (topWidth / 2), 0); // Top Left
    path.lineTo((w / 2) + (topWidth / 2), 0); // Top Right
    path.lineTo((w / 2) + (currentBottomWidth / 2), h); // Bottom Right
    path.lineTo((w / 2) - (currentBottomWidth / 2), h); // Bottom Left
    path.close();

    // 3-stop vertical gradient for light dissipation
    final Paint paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0.0, 0.4, 1.0],
        colors: [
          color.withValues(alpha: peakOpacity),
          color.withValues(alpha: peakOpacity * 0.4),
          color.withValues(alpha: 0.0), 
        ],
      ).createShader(Rect.fromLTWH(0, 0, w, h));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _DivineLightPainter oldDelegate) {
    return color != oldDelegate.color ||
        topWidth != oldDelegate.topWidth ||
        bottomWidth != oldDelegate.bottomWidth ||
        peakOpacity != oldDelegate.peakOpacity ||
        heightProgress != oldDelegate.heightProgress;
  }
}
