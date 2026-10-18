import 'package:flutter/material.dart';

import 'package:meals/theme/app_colors.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.onSelectScreen,
  });

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.cream,
      child: Column(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.rougeNoir,
                  AppColors.cognac,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: AppColors.cream,
                ),
                SizedBox(width: 18),
                Text(
                  'Cooking Up!',
                  style: TextStyle(
                    color: AppColors.cream,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.restaurant,
              size: 26,
              color: AppColors.rougeNoir,
            ),
            title: const Text(
              'Meals',
              style: TextStyle(
                color: AppColors.blueCoral,
                fontSize: 22,
              ),
            ),
            onTap: () {
              onSelectScreen('meals');
            },
          ),

          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 26,
              color: AppColors.rougeNoir,
            ),
            title: const Text(
              'Filters',
              style: TextStyle(
                color: AppColors.blueCoral,
                fontSize: 22,
              ),
            ),
            onTap: () {
              onSelectScreen('filters');
            },
          ),

          const Divider(
            color: AppColors.whiteSand,
          ),

          ListTile(
            leading: const Icon(
              Icons.analytics,
              size: 26,
              color: AppColors.cognac,
            ),
            title: const Text(
              'Statistics',
              style: TextStyle(
                color: AppColors.blueCoral,
                fontSize: 22,
              ),
            ),
            onTap: () {
              onSelectScreen('statistics');
            },
          ),

          ListTile(
            leading: const Icon(
              Icons.info_outline,
              size: 26,
              color: AppColors.cognac,
            ),
            title: const Text(
              'About',
              style: TextStyle(
                color: AppColors.blueCoral,
                fontSize: 22,
              ),
            ),
            onTap: () {
              onSelectScreen('about');
            },
          ),
        ],
      ),
    );
  }
}