import 'package:flutter/material.dart';

import 'package:flutterapp/data/dummy_data.dart';

import 'package:flutterapp/models/category.dart';

import 'package:flutterapp/screens/meals.dart';

import 'package:flutterapp/widgets/category_grid_item.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child:Text('Choose Category',style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),))
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 19 / 9,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          
          // availableCategories.map((category) => CategoryGridItem(category)).toList()
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}