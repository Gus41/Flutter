import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _grocetyItems = [];

  void _addItem() async {
    final categorie = await Navigator.of(context)
        .push<GroceryItem>(MaterialPageRoute(builder: (ctx) {
      return NewItem();
    }));
    if (categorie != null) {
      setState(() {
        _grocetyItems.add(categorie);
      });
    }
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
