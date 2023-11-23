import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frist_app/data/categories.dart';
import 'package:frist_app/models/grocery_item.dart';
import 'package:frist_app/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  var _isLoading = true;
  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
        'flutter-prep-79c0d-default-rtdb.firebaseio.com', 'shopping-list.json');
    final response = await http.get(url);
    final Map<String, dynamic> listData = jsonDecode(response.body);
    List<GroceryItem> loadedItems = [];

    for (var item in listData.entries) {
      final category = categories.entries.firstWhere(
        (catItem) => catItem.value.title == item.value['category'],
      ); // loc theo dieu kien(lay element dau tien khop dieu kien)

      loadedItems.add(
        GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category.value,
        ),
      );
    }
    setState(
      () {
        _groceryItems = loadedItems;
        _isLoading = false;
      },
    );
  }

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

  void _removeItem(GroceryItem item) {
    setState(
      () {
        _groceryItems.remove(item);
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
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: IconButton(
              onPressed: _addItem,
              icon: const Icon(Icons.add),
            ),
          )
        ],
      ),
    );
    if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    } // animate loading
    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) => _removeItem,
          key: ValueKey(_groceryItems[index].id),
          child: ListTile(
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
