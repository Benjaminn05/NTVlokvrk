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
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredIngrediants = <String>[];
  var _enteredInstructions = '';
  var _selectCategory = availableCategories.first.id;
  

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop();
    }
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new recipe"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text("Name"),
                ),
                onSaved: (value) {
                  _enteredName = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Ingredients (comma separated)"),
                ),
                onSaved: (value) {
                  _enteredIngrediants = value!.split(',').map((e) => e.trim()).toList();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter at least one ingredient';
                  }
                  return null;
                },
              ),
              TextFormField(
                maxLines: 3,
                decoration: const InputDecoration(
                  label: Text("Instructions"),
                ),
                onSaved: (value) {
                  _enteredInstructions = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the instructions';
                  }
                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectCategory,
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
                      onChanged: (value) {
                        setState(() {
                          _selectCategory = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                    },
                    child: const Text("Reset"),
                  ),
                  ElevatedButton(
                    onPressed: _saveItem,
                    child: const Text("Add Item"),
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

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new recipe"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text("name"),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text("quantity"),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue: _enteredIngrediants.toString(),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return "Must be a valid postitive number";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredIngrediants = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectCategory,
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
                      onChanged: (value) {
                        setState(
                          () {
                            _selectCategory = value!;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                    },
                    child: const Text("Reset"),
                  ),
                  ElevatedButton(
                    onPressed: _saveItem,
                    child: const Text("Add Item"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}*/