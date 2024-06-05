import 'package:flutter/material.dart';

import 'package:flutterapp/data/dummy_data.dart';

import 'package:flutterapp/models/category.dart';

class AddMeal extends StatefulWidget {
  const AddMeal({super.key});

  @override
  State<AddMeal> createState() {
    return _AddMeal();
  }
}

class _AddMeal extends State<AddMeal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new recipe"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text("name"),
                ),
                validator: (value) {
                  return "Error";
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration:
                          const InputDecoration(label: Text("quantity")),
                      initialValue: '1',
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      items: [
                        for (final Category category in availableCategories)
                          DropdownMenuItem(
                            value: category.id,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.color,
                                ),
                                const SizedBox(
                                width: 6,
                              ),
                              Text(category.title),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
