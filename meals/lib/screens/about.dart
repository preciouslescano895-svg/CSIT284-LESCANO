import 'package:flutter/material.dart';

import 'package:meals/theme/app_colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 48,
              backgroundColor: AppColors.rougeNoir,
              child: Icon(
                Icons.restaurant_menu,
                size: 48,
                color: AppColors.cream,
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              'Meal Explorer',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.rougeNoir,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Discover delicious meals, explore recipes, use dietary '
              'filters, and save your favorite dishes.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: AppColors.blueCoral,
              ),
            ),

            const SizedBox(height: 28),

            Card(
              color: AppColors.whiteSand,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.category,
                      color: AppColors.cognac,
                    ),
                    title: Text(
                      'Meal Categories',
                      style: TextStyle(
                        color: AppColors.blueCoral,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Browse different types of meals.',
                      style: TextStyle(
                        color: AppColors.blueCoral,
                      ),
                    ),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(
                      Icons.star,
                      color: AppColors.cognac,
                    ),
                    title: Text(
                      'Favorites',
                      style: TextStyle(
                        color: AppColors.blueCoral,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Save your favorite meals.',
                      style: TextStyle(
                        color: AppColors.blueCoral,
                      ),
                    ),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(
                      Icons.filter_alt,
                      color: AppColors.cognac,
                    ),
                    title: Text(
                      'Dietary Filters',
                      style: TextStyle(
                        color: AppColors.blueCoral,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Filter meals based on dietary preferences.',
                      style: TextStyle(
                        color: AppColors.blueCoral,
                      ),
                    ),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(
                      Icons.analytics,
                      color: AppColors.cognac,
                    ),
                    title: Text(
                      'Meal Statistics',
                      style: TextStyle(
                        color: AppColors.blueCoral,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'View useful information about the meals.',
                      style: TextStyle(
                        color: AppColors.blueCoral,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'CSIT284 Flutter Project',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.rougeNoir,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Topic 8 - Navigation',
              style: TextStyle(
                color: AppColors.blueCoral,
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.blueCoral,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.code,
                    color: AppColors.cream,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Made with Flutter',
                    style: TextStyle(
                      color: AppColors.cream,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}