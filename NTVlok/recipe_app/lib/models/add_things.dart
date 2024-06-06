// Class representing an item to be added (e.g., a recipe)
class AddThings {
  // Constructor to initialize the properties of the item
  const AddThings({
    required this.Name,                  // Name of the item (e.g., recipe name)
    required this.ingredients,           // List of ingredients for the item
    required this.instructions,          // Instructions for preparing the item
    required this.availableCategories,   // Category ID to which the item belongs
  });

  final String Name;                     // Name of the item
  final List<String> ingredients;        // List of ingredients for the item
  final String instructions;             // Instructions for preparing the item
  final String availableCategories;      // Category ID to which the item belongs
}


