import 'package:donut_app/configs/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScaffold extends StatelessWidget {
  const DashboardScaffold({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      backgroundColor: AppColors.dashboardScaffoldBg,
      bottomNavigationBar: DashboardBottomNav(
        currentIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}

class DashboardBottomNav extends StatelessWidget {
  const DashboardBottomNav({
    required this.currentIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  static const _items = [
    _NavItem(icon: Icons.home_outlined, label: 'Home'),
    _NavItem(icon: Icons.workspace_premium_outlined, label: 'Reward'),
    _NavItem(icon: Icons.settings_outlined, label: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 50,
            child: DecoratedBox(
              decoration: BoxDecoration(color: AppColors.progress),
            ),
          ),

          // Main navigation bar
          Positioned(
            left: 20,
            right: 20,
            bottom: 0,
            height: 88,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              decoration: BoxDecoration(
                color: AppColors.button,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                border: BoxBorder.fromLTRB(
                  left: BorderSide(color: AppColors.white, width: 1.5),
                  right: BorderSide(color: AppColors.white, width: 1.5),
                  top: BorderSide(color: AppColors.white, width: 1.5),
                ),
              ),
              child: Row(
                children: List.generate(_items.length, (index) {
                  final item = _items[index];
                  final isSelected = currentIndex == index;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () => onDestinationSelected(index),
                      behavior: HitTestBehavior.opaque,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.progress
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                          border: isSelected
                              ? Border.all(color: AppColors.white, width: 1.5)
                              : null,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(item.icon, color: AppColors.white, size: 26),
                              if (isSelected) ...[
                                const SizedBox(width: 6),
                                Flexible(
                                  child: Text(
                                    item.label,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem {
  const _NavItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}
