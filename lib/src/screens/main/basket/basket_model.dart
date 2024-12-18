import 'package:flutter/cupertino.dart';

class BasketModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];
  List<Map<String, dynamic>> get items => _items;

  void addItem(Map<String, dynamic> product) {
    _items.add(product);
    notifyListeners();
  }

  void removeItem(Map<String, dynamic> product) {
    _items.remove(product);
    notifyListeners();
  }
}
