import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _grocetyItems = [];

  @override
  void initState() {
    super.initState();

    _loadItems();
  }

  void _loadItems() async {
    final url =
        Uri.https('list-cd3c0-default-rtdb.firebaseio.com', 'list.json');
    final response = await http.get(url);

    final Map<String, dynamic> data = json.decode(response.body);
    final List<GroceryItem> loaddedItemsList = [];

    for (final item in data.entries) {
      final Category category = categories.entries
          .firstWhere((e) => e.value.title == item.value['category'])
          .value;

      loaddedItemsList.add(GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category));
    }

    setState(() {
      _grocetyItems = loaddedItemsList;
    });
  }

  void _addItem() async {
    await Navigator.of(context)
        .push<GroceryItem>(MaterialPageRoute(builder: (ctx) {
      return NewItem();
    }));
    _loadItems();
  }

  removeItem(GroceryItem item) {
    setState(() {
      _grocetyItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: _grocetyItems.length,
        itemBuilder: (ctx, index) {
          return Dismissible(
            key: ValueKey(_grocetyItems[index].id),
            onDismissed: (direction) {
              removeItem(_grocetyItems[index]);
            },
            child: ListTile(
              title: Text(_grocetyItems[index].name),
              leading: Container(
                width: 24,
                height: 24,
                color: _grocetyItems[index].category.color,
              ),
              trailing: Text(_grocetyItems[index].quantity.toString()),
            ),
          );
        });
    if (_grocetyItems.isEmpty) {
      content = const Center(
        child: Text("No items available"),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Groceries"),
          actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
        ),
        body: content);
  }
}
