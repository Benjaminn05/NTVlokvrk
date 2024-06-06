import 'package:flutter/material.dart';

import 'package:flutterapp/models/meal.dart';

import 'package:flutterapp/widgets/meal_item_trait.dart';

import 'package:transparent_image/transparent_image.dart';

// Constructor for the MealItem class
class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectMeal
  }); 

  // The meal object and a callback function to handle meal selection
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  // Getter to format the complexity text
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  // Getter to format the affordability text
  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        // When the meal item is tapped, the onSelectMeal callback is triggered
        onTap: () {
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
             // Displaying the meal image with a fade-in effect
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
            // Positioned widget to display the meal details at the bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    // Displaying the meal title
                    Text(
                    meal.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis, //Very long text ...
                    style: const TextStyle(
                      fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    ),
                    ),
                    const SizedBox(height: 12),
                    // Row to display meal traits (duration, complexity, affordability)
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    MealItemTrait(
                      icon: Icons.schedule, 
                      label: '${meal.duration} min',
                    ),
                    const SizedBox(width: 12),
                    MealItemTrait(
                      icon: Icons.work,
                      label: complexityText,
                    ),
                    const SizedBox(width: 12),
                    MealItemTrait(
                      icon: Icons.attach_money,
                    label: affordabilityText,
                    )
                  ],),
                  ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}