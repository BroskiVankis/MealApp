import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    wasAdded
                        ? 'Meal added to favorites!'
                        : 'Meal removed from favorites!',
                  ),
                ),
              );
            },
            icon: Icon(isFavorite ? Icons.star : Icons.star_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.hardEdge,
              height: 300,
              width: double.infinity,
              child: Image.network(meal.imageUrl, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 10),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
            const SizedBox(height: 10),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 10),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 5,
                ),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            ...buildDietaryRestrictions(context),
          ],
        ),
      ),
    );
  }

  List<Widget> buildDietaryRestrictions(BuildContext context) {
    List<Widget> restrictions = [];

    if (meal.isGlutenFree) {
      restrictions.add(
        Text(
          "Gluten Free",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            decoration: TextDecoration.none,
          ),
        ),
      );
    }

    if (meal.isLactoseFree) {
      restrictions.add(
        Text(
          "Lactose Free",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            decoration: TextDecoration.none,
          ),
        ),
      );
    }

    if (meal.isVegan) {
      restrictions.add(
        Text(
          "Vegan",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            decoration: TextDecoration.none,
          ),
        ),
      );
    }

    if (meal.isVegetarian) {
      restrictions.add(
        Text(
          "Vegetarian",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            decoration: TextDecoration.none,
          ),
        ),
      );
    }

    return restrictions;
  }
}
