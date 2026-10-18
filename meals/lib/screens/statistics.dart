import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/theme/app_colors.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({
    super.key,
    required this.meals,
    required this.favoriteMeals,
  });

  final List<Meal> meals;
  final List<Meal> favoriteMeals;

  double get averageDuration {
    if (meals.isEmpty) {
      return 0;
    }

    int totalDuration = 0;

    for (final meal in meals) {
      totalDuration += meal.duration;
    }

    return totalDuration / meals.length;
  }

  int get veganMeals {
    return meals.where((meal) => meal.isVegan).length;
  }

  int get vegetarianMeals {
    return meals.where((meal) => meal.isVegetarian).length;
  }

  int get glutenFreeMeals {
    return meals.where((meal) => meal.isGlutenFree).length;
  }

  int get lactoseFreeMeals {
    return meals.where((meal) => meal.isLactoseFree).length;
  }

  int get simpleMeals {
    return meals
        .where(
          (meal) => meal.complexity == Complexity.simple,
        )
        .length;
  }

  int get challengingMeals {
    return meals
        .where(
          (meal) => meal.complexity == Complexity.challenging,
        )
        .length;
  }

  int get hardMeals {
    return meals
        .where(
          (meal) => meal.complexity == Complexity.hard,
        )
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Statistics'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Meal Overview',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.rougeNoir,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Here is a quick summary of the meals in the app.',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.blueCoral,
              ),
            ),
            const SizedBox(height: 24),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                StatCard(
                  icon: Icons.restaurant_menu,
                  title: 'Total Meals',
                  value: '${meals.length}',
                ),
                StatCard(
                  icon: Icons.star,
                  title: 'Favorites',
                  value: '${favoriteMeals.length}',
                ),
                StatCard(
                  icon: Icons.schedule,
                  title: 'Average Time',
                  value: '${averageDuration.toStringAsFixed(0)} min',
                ),
                StatCard(
                  icon: Icons.eco,
                  title: 'Vegan Meals',
                  value: '$veganMeals',
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              'Dietary Options',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: AppColors.rougeNoir,
              ),
            ),

            const SizedBox(height: 12),

            InfoRow(
              label: 'Vegetarian',
              value: vegetarianMeals,
              icon: Icons.grass,
            ),
            InfoRow(
              label: 'Vegan',
              value: veganMeals,
              icon: Icons.eco,
            ),
            InfoRow(
              label: 'Gluten-free',
              value: glutenFreeMeals,
              icon: Icons.no_food,
            ),
            InfoRow(
              label: 'Lactose-free',
              value: lactoseFreeMeals,
              icon: Icons.local_drink,
            ),

            const SizedBox(height: 30),

            const Text(
              'Meal Difficulty',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: AppColors.rougeNoir,
              ),
            ),

            const SizedBox(height: 12),

            InfoRow(
              label: 'Simple',
              value: simpleMeals,
              icon: Icons.sentiment_satisfied_alt,
            ),
            InfoRow(
              label: 'Challenging',
              value: challengingMeals,
              icon: Icons.trending_up,
            ),
            InfoRow(
              label: 'Hard',
              value: hardMeals,
              icon: Icons.local_fire_department,
            ),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 165,
      height: 135,
      child: Card(
        color: AppColors.whiteSand,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
                color: AppColors.rougeNoir,
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blueCoral,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.blueCoral,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final int value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteSand,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColors.cognac,
        ),
        title: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.blueCoral,
          ),
        ),
        trailing: Text(
          '$value',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.rougeNoir,
          ),
        ),
      ),
    );
  }
}