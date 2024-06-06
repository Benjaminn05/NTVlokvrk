import 'package:flutter/material.dart';

import 'package:flutterapp/models/category.dart';

// Defining the CategoryGridItem class which extends StatelessWidget
class CategoryGridItem extends StatelessWidget {
  // Constructor for CategoryGridItem, requiring a category and an onSelectCategory function
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });

  // Final properties to store the category data and the onSelectCategory function
  final Category category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    // Building the widget tree
    return InkWell(
      // onTap callback for the InkWell, which calls the onSelectCategory function
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.8),
              category.color.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        // Center widget to center the text inside the container
        child: Center(
          // Text widget to display the category title
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
