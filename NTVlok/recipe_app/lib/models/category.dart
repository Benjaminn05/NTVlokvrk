import 'package:flutter/material.dart';

// Class representing a category
class Category {

  // Constructor to initialize the properties of the category
  const Category({
    required this.id,      // Unique identifier for the category
    required this.title,   // Title of the category
    this.color = Colors.orange, // Color associated with the category, default is orange
  });

  final String id;        // Unique identifier for the category
  final String title;     // Title of the category
  final Color color;      // Color associated with the category, default is orange
}