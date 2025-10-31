import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(context) {
    return Column(
      children: [
        AppBar.new(title: Text(meal.title)),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
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
            fontSize: 25,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            meal.ingredients.join(', '),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Steps",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            fontSize: 25,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            meal.steps.join('\n'),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ...buildDietaryRestrictions(context),
      ],
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
