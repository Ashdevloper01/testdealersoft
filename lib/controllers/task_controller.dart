import 'package:flutter/material.dart';
import 'package:system_task_dealersoft/modal/items.dart';

// ChangeNotifier class to manage state
class TaskController extends ChangeNotifier {
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  final List<Item> _items = [
    Item("Create Customer Noval", "501 Indusual", "1.10.32 and 1.10.33",
        "10min", 5),
    Item(" Delivery Letin", "2000 years", "#203949  ABC forns", "20min", 205),
    Item("Create A/R Invoice", "Latin words, ", "#20 combined", "08min", 165),
    Item("Receive Incoming Payment", "500 HR farms", "#203949  ABC forns",
        "19min", 16),
    Item("Your Turn: Selling ", "500 non-", "3949  Acharc forns", "17min", 45),

    // Add more items as needed
  ];

  List<Item> get items => _items;

  // Filter items based on the search query
  List<Item> search(String query) {
    return _items
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  void togglePlay() {
    notifyListeners();
  }

  Item _userData =
      Item("Create Customer", "500 HR farms", "#203949  ABC forns", "1min", 45);

  Item get userData => _userData;

  void setUserData(Item data) {
    _userData = data;
    notifyListeners();
  }

  int _currentSelection = 0;
  int get currentSelection => _currentSelection;

  void setSelectedIndex(int index) {
    _currentSelection = index;
    notifyListeners();
  }
}
