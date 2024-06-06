// Enum representing the complexity level of a meal
enum Complexity {
  simple,
  challenging,
  hard,
}

// Enum representing the affordability level of a meal
enum Affordability {
  affordable,
  pricey,
  luxurious,
} 

// Class representing a meal
class Meal {
  const Meal({
    required this.id,               // Unique identifier for the meal
    required this.categories,       // List of category IDs the meal belongs to
    required this.title,            // Title of the meal
    required this.imageUrl,         // URL of the meal's image
    required this.ingredients,      // List of ingredients for the meal
    required this.steps,            // Steps to prepare the meal
    required this.duration,         // Duration to prepare the meal (in minutes)
    required this.complexity,       // Complexity level of the meal
    required this.affordability,    // Affordability level of the meal
    required this.isGlutenFree,     // Whether the meal is gluten-free
    required this.isLactoseFree,    // Whether the meal is lactose-free
    required this.isVegan,          // Whether the meal is vegan
    required this.isVegetarian,     // Whether the meal is vegetarian
  });

   final String id;                    // Unique identifier for the meal
  final List<String> categories;      // List of category IDs the meal belongs to
  final String title;                 // Title of the meal
  final String imageUrl;              // URL of the meal's image
  final List<String> ingredients;     // List of ingredients for the meal
  final List<String> steps;           // Steps to prepare the meal
  final int duration;                 // Duration to prepare the meal (in minutes)
  final Complexity complexity;        // Complexity level of the meal
  final Affordability affordability;  // Affordability level of the meal
  final bool isGlutenFree;            // Whether the meal is gluten-free
  final bool isLactoseFree;           // Whether the meal is lactose-free
  final bool isVegan;                 // Whether the meal is vegan
  final bool isVegetarian;            // Whether the meal is vegetarian
}