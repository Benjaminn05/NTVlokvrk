import 'package:flutter/material.dart';

import 'package:flutterapp/data/dummy_data.dart';

import 'package:flutterapp/models/category.dart';

import 'package:flutterapp/screens/meals.dart';

import 'package:flutterapp/widgets/category_grid_item.dart';


class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  String _searchText = "";
  List<Category> _filteredCategories = availableCategories; // List to store filtered categories

  // Method to handle category selection
  void _selectCategory(BuildContext context, Category category) {
    // Filter meals based on selected category
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();


    // Navigate to MealsScreen with the selected category's meals
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  // Method to filter categories based on search text
  void _filterCategories(String searchText) {
    setState(() {
      _searchText = searchText;
      _filteredCategories = availableCategories
          .where((category) =>
              category.title.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Choose Category',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search for an ingredient or recipe...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: _filterCategories, // Update filtered categories on text change
            ),
          ),
          Expanded(
            child: GridView(
              padding: const EdgeInsets.all(24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 17 / 7,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              children: [
                for (final category in _filteredCategories)
                  CategoryGridItem(
                    category: category,
                    onSelectCategory: () {
                      _selectCategory(context, category);
                    },
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}