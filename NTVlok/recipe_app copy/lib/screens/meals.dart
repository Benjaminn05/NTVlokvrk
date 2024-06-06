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

  final String title;
  final List<Meal> meals;

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  final List<AddThings> _mealItems = [];

  void _AddMeal(BuildContext) async {
    final addMeal = await
     Navigator.of(context).push<AddThings>(
      MaterialPageRoute(
        builder: (ctx) => const AddMeal(),
      ),
    );

    if (addMeal == null) {
      return;
    }

    setState(() {
      _mealItems.add(addMeal);
    });
    
  }

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal, onToggleFavorite: (Meal meal) {  },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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

    // ListView.builder(
    //itemCount: meals.length,
    //itemBuilder: (ctx, index) => Text(
    //meals[index].title,

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
        title: Text(widget.title,),
      ),
      body: content,
      floatingActionButton: FloatingActionButton(onPressed: () {
              _AddMeal(context);
            },
            child: const Icon(Icons.add),
            ),
    );
  }
}
