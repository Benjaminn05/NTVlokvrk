import 'package:flutter/material.dart';

// Defining the MealItemTrait class which extends StatelessWidget
class MealItemTrait extends StatelessWidget {
  // Constructor for MealItemTrait, requiring an icon and a label
const MealItemTrait({super.key, required this.icon, required this.label,});


// Final properties to store the icon data and label text
final IconData icon;
final String label;


@override 
Widget build(BuildContext context) {
  // Building the widget tree
  return Row(children: [
    // Displaying the icon
    Icon(
      icon, size:17,
      color: Colors.white,),
    const SizedBox(width: 6),// Adding some space between the icon and the label
    // Displaying the label text
    Text(
      label,
      style: const TextStyle(
        color: Colors.white,
    ),
    ),
  ]);
}
}