import 'package:riverpod/legacy.dart';
import 'package:simple_todo_app_example/item.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
  return ItemNotifier();
});

class ItemNotifier extends StateNotifier<List<Item>> {
  ItemNotifier() : super([]);

  void addItem(String name) {
    final newItem = Item(id: DateTime.now().toString(), name: name);
    state.add(newItem);
    state = state.toList();
  }

  void updateItem(String id, String name) {
    state = state
        .map((item) => item.id == id ? Item(id: item.id, name: name) : item)
        .toList();
  }

  void deleteItem(String id) {
    state.removeWhere((item) => item.id == id);
    state = state.toList();
  }
}
