import 'package:flutter/material.dart';
// import 'package:frist_app/data/dummy_items.dart';
import 'package:frist_app/models/grocery_item.dart';
import 'package:frist_app/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
    if (newItem == null) {
      return;
    }
    setState(
      () {
        _groceryItems.add(newItem);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('No items added yet.'),
          Container(
            margin: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.all(Radius.circular(40))),
            child: IconButton(
              onPressed: _addItem,
              icon: const Icon(Icons.add),
            ),
          )
        ],
      ),
    );

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => ListTile(
          leading: Container(
            width: 30,
            height: 30,
            color: _groceryItems[index].category.color,
          ),
          title: Text(
            _groceryItems[index].name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: Text(
            _groceryItems[index].quantity.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: content,
    );
  }
}
