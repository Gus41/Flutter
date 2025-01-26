import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:http/http.dart' as http;

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() {
    return _NewItem();
  }
}

class _NewItem extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();

  var _enteredName = '';
  var _enteredQuantity = 1;
  var _enteredCategory = categories[Categories.fruit]!;

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final item = GroceryItem(
          id: DateTime.now().toString(),
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _enteredCategory);

      final url =
          Uri.https('list-cd3c0-default-rtdb.firebaseio.com', 'list.json');
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'name': item.name,
            'quantity': item.quantity,
            'category': item.category.title
          }));
          
      if (!context.mounted) {
        return;
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: InputDecoration(
                    label: const Text("Name"),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return 'Name is invalid';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    setState(() {
                      _enteredName = newValue!;
                    });
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration:
                            InputDecoration(label: const Text("Quantity")),
                        initialValue: _enteredQuantity.toString(),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.tryParse(value) == null ||
                              int.tryParse(value)! <= 0) {
                            return 'Quantity is invalid';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _enteredQuantity = int.parse(newValue!);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: DropdownButtonFormField(
                          value: _enteredCategory,
                          items: [
                            for (final categorie in categories.entries)
                              DropdownMenuItem(
                                value: categorie.value,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 16,
                                      height: 16,
                                      color: categorie.value.color,
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(categorie.value.title)
                                  ],
                                ),
                              )
                          ],
                          onChanged: (value) {
                            _enteredCategory = value!;
                          }),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          _formKey.currentState!.reset();
                        },
                        child: const Text("Reset")),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                        onPressed: _saveItem, child: const Text("Submit"))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
