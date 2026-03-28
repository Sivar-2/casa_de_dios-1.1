import 'package:flutter/material.dart';
import '../widgets/celestial_bottom_nav_bar.dart';
import '../widgets/celestial_nav_bar_style.dart';

/// ============================================================================
/// MainChurchScreen — The root screen of the application after login.
///
/// Manages the 4 primary navigation tabs via a PageView for smooth swiping,
/// integrates the CelestialBottomNavBar with the configurable NavBarStyle,
/// and provides a floating action button for the primary donation action.
/// ============================================================================
class MainChurchScreen extends StatefulWidget {
  /// The initial style for the navigation bar. Defaults to [NavBarStyle.light].
  final NavBarStyle initialStyle;

  const MainChurchScreen({
    super.key,
    this.initialStyle = const NavBarStyle(),
  });

  @override
  State<MainChurchScreen> createState() => _MainChurchScreenState();
}

class _MainChurchScreenState extends State<MainChurchScreen> {
  late int _selectedIndex;
  late NavBarStyle _currentStyle;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    _currentStyle = widget.initialStyle;
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Switches the navigation bar style with an optional smooth rebuild.
  void _setNavBarStyle(NavBarStyle newStyle) {
    setState(() {
      _currentStyle = newStyle;
    });
  }

  void _onTabSelected(int index) {
    if (index == _selectedIndex) return;
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOutCubic,
    );
  }

  void _onPageChanged(int index) {
    if (index == _selectedIndex) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine scaffold background based on current style brightness
    final bool isDark = _currentStyle.backgroundColor.computeLuminance() < 0.5;
    final Color scaffoldBg = isDark ? const Color(0xFF121220) : const Color(0xFFF6F7F8);

    return Scaffold(
      backgroundColor: scaffoldBg,
      body: SafeArea(
        bottom: false, // Let the nav bar handle bottom safe area
        child: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          physics: const BouncingScrollPhysics(),
          children: [
            _PlaceholderTab(
              title: 'Inicio',
              subtitle: 'Bienvenido a Casa de Dios',
              icon: Icons.home_filled,
              color: _currentStyle.activeColor,
              isDark: isDark,
              onChangeStyle: _setNavBarStyle,
              currentStyle: _currentStyle,
            ),
            _PlaceholderTab(
              title: 'Media',
              subtitle: 'Contenido multimedia',
              icon: Icons.play_circle_fill,
              color: _currentStyle.activeColor,
              isDark: isDark,
            ),
            _PlaceholderTab(
              title: 'Eventos',
              subtitle: 'Próximos eventos',
              icon: Icons.event,
              color: _currentStyle.activeColor,
              isDark: isDark,
            ),
            _PlaceholderTab(
              title: 'Perfil',
              subtitle: 'Tu cuenta',
              icon: Icons.person,
              color: _currentStyle.activeColor,
              isDark: isDark,
            ),
          ],
        ),
      ),

      // ── Floating Action Button ──
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Donation / primary action
        },
        backgroundColor: _currentStyle.fabColor,
        elevation: _currentStyle.fabElevation,
        shape: const CircleBorder(),
        child: Icon(
          Icons.favorite,
          color: _currentStyle.fabIconColor,
          size: 28,
        ),
      ),

      // ── Celestial Navigation Bar ──
      bottomNavigationBar: SafeArea(
        top: false,
        child: CelestialBottomNavBar(
          selectedIndex: _selectedIndex,
          onTabSelected: _onTabSelected,
          style: _currentStyle,
          onFabPressed: () {},
          items: const [
            CelestialNavItem(icon: Icons.home_filled, label: 'Inicio'),
            CelestialNavItem(icon: Icons.play_circle_fill, label: 'Media'),
            CelestialNavItem(icon: Icons.event, label: 'Eventos'),
            CelestialNavItem(icon: Icons.person, label: 'Perfil'),
          ],
        ),
      ),
    );
  }
}

/// ============================================================================
/// _PlaceholderTab — Temporary page content for each tab.
///
/// The first tab (Inicio) includes interactive buttons to demonstrate
/// the dynamic style switching feature. Replace these with your real
/// screen widgets (InicioScreen, etc.) when ready.
/// ============================================================================
class _PlaceholderTab extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final bool isDark;
  final ValueChanged<NavBarStyle>? onChangeStyle;
  final NavBarStyle? currentStyle;

  const _PlaceholderTab({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.isDark,
    this.onChangeStyle,
    this.currentStyle,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isDark ? Colors.white : Colors.black87;
    final subtitleColor = isDark ? Colors.white54 : Colors.grey;
    final cardColor = isDark ? const Color(0xFF1E1E32) : Colors.white;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ── Icon ──
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 40),
            ),
            const SizedBox(height: 20),

            // ── Title ──
            Text(
              title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: textColor,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 8),

            // ── Subtitle ──
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 15,
                color: subtitleColor,
              ),
            ),

            // ── Style Switcher (only on the Inicio tab as a demo) ──
            if (onChangeStyle != null) ...[
              const SizedBox(height: 40),
              Text(
                'Estilos del Menú',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Toca para cambiar el estilo dinámicamente',
                style: TextStyle(fontSize: 12, color: subtitleColor),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  _StyleChip(
                    label: '☀️ Light',
                    style: NavBarStyle.light,
                    isActive: currentStyle?.backgroundColor == NavBarStyle.light.backgroundColor,
                    cardColor: cardColor,
                    textColor: textColor,
                    activeColor: NavBarStyle.light.activeColor,
                    onTap: () => onChangeStyle!(NavBarStyle.light),
                  ),
                  _StyleChip(
                    label: '🌙 Dark',
                    style: NavBarStyle.dark,
                    isActive: currentStyle?.backgroundColor == NavBarStyle.dark.backgroundColor,
                    cardColor: cardColor,
                    textColor: textColor,
                    activeColor: NavBarStyle.dark.activeColor,
                    onTap: () => onChangeStyle!(NavBarStyle.dark),
                  ),
                  _StyleChip(
                    label: '✨ Gold',
                    style: NavBarStyle.warmGold,
                    isActive: currentStyle?.backgroundColor == NavBarStyle.warmGold.backgroundColor,
                    cardColor: cardColor,
                    textColor: textColor,
                    activeColor: NavBarStyle.warmGold.activeColor,
                    onTap: () => onChangeStyle!(NavBarStyle.warmGold),
                  ),
                  _StyleChip(
                    label: '👑 Royal',
                    style: NavBarStyle.royalSpirit,
                    isActive: currentStyle?.backgroundColor == NavBarStyle.royalSpirit.backgroundColor,
                    cardColor: cardColor,
                    textColor: textColor,
                    activeColor: NavBarStyle.royalSpirit.activeColor,
                    onTap: () => onChangeStyle!(NavBarStyle.royalSpirit),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _StyleChip extends StatelessWidget {
  final String label;
  final NavBarStyle style;
  final bool isActive;
  final Color cardColor;
  final Color textColor;
  final Color activeColor;
  final VoidCallback onTap;

  const _StyleChip({
    required this.label,
    required this.style,
    required this.isActive,
    required this.cardColor,
    required this.textColor,
    required this.activeColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            color: isActive
                ? activeColor.withValues(alpha: 0.15)
                : cardColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isActive ? activeColor : Colors.grey.withValues(alpha: 0.2),
              width: isActive ? 2.0 : 1.0,
            ),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: activeColor.withValues(alpha: 0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? activeColor : textColor,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
