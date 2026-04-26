import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo_app_example/item_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Todo App')),
      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          final currentItem = item[index];
          return ListTile(title: Text(currentItem.name));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem("bibek");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
