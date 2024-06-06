import 'package:flutter/material.dart';
import 'package:flutterapp/models/add_things.dart';

import 'package:flutterapp/models/meal.dart';

import 'package:flutterapp/screens/meal_detail.dart';

import 'package:flutterapp/widgets/add_meal.dart';

import 'package:flutterapp/widgets/meal_item.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.meals,
  });

  final String title; // Title of the screen
  final List<Meal> meals; // List of meals to display

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  final List<AddThings> _mealItems = []; // List to store added meals

  // Method to add a meal
  void _AddMeal(BuildContext) async {
    final addMeal = await Navigator.of(context).push<AddThings>(
      MaterialPageRoute(
        builder: (ctx) => const AddMeal(),
      ),
    );

    if (addMeal == null) {
      return; // If no meal is added, return
    }

    setState(() {
      _mealItems.add(addMeal); // Add the meal to the list
    });
  }

  // Method to select a meal
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
          onToggleFavorite: (Meal meal) {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Default content if there are no meals
    Widget content = Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          'Uh oh ... nothing here!',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        const SizedBox(height: 16),
        Text(
          'Try selecting a different category',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        IconButton(
            onPressed: () {
              _AddMeal(context);
            },
            icon: const Icon(Icons.add)),
      ]),
    );

    // If there are meals, display them in a ListView
    if (widget.meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: widget.meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: widget.meals[index],
          onSelectMeal: (meal) {
            selectMeal(context, meal);
            IconButton(
                onPressed: () {
                  _AddMeal(context);
                },
                icon: const Icon(Icons.add));
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // Display the screen title
      ),
      body: content, // Display the content
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _AddMeal(context); // Display the content
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
