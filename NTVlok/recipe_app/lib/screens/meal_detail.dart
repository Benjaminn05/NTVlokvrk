import 'package:flutter/material.dart';

import 'package:flutterapp/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
  });

  final Meal meal; // Meal object to display details for
  final void Function(Meal meal) onToggleFavorite; // Function to toggle favorite status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title), // Display the title of the meal
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(meal); // Toggle favorite status when button is pressed
            },
            icon: const Icon(Icons.star), // Star icon to mark as favorite
          )
        ],
      ),
      body: SingleChildScrollView( // Allows for scrolling if content overflows
        child: Column(
          children: [
            Image.network(
              meal.imageUrl, // Display the meal image
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover, // Cover the entire width
            ),
            const SizedBox(height: 14), // Add space between elements
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            // Display ingredients
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface),
              ),
            const SizedBox(height: 24),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            // Display steps
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
