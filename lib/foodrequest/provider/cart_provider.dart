import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;
  final String resDeviceid;
  CartItem(
      {@required this.name,
      @required this.id,
      @required this.price,
      @required this.quantity,
      this.resDeviceid,
      this.imageUrl});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  double get totalPrice {
    var totalPrice = 0.0;
    _items.forEach((key, value) {
      totalPrice += value.price * value.quantity;
    });
    return totalPrice;
  }

  int get itemCount => _items.length;

  void addItem(String mealId, double price, String name, int quntity,
      String image, String resId) {
    if (!_items.containsKey(mealId)) {
      _items.putIfAbsent(
          mealId,
          () => CartItem(
                name: name,
                id: DateTime.now().toString(),
                price: price,
                quantity: quntity,
                imageUrl: image,
                resDeviceid: resId,
              ));
      //notificationIdes.add(resId);
    }
    notifyListeners();
  }

  void addSingleItem(String mealId) {
    if (_items.containsKey(mealId)) {
      _items.update(
        mealId,
        (existMeal) => CartItem(
            imageUrl: existMeal.imageUrl,
            name: existMeal.name,
            id: existMeal.id,
            price: existMeal.price,
            resDeviceid: existMeal.resDeviceid,
            quantity: existMeal.quantity + 1),
      );
    }
    notifyListeners();
  }

  void removeItem(String mealId) {
    _items.remove(mealId);

    notifyListeners();
  }

  void removeSingleItem(mealId) {
    if (_items[mealId].quantity < 2) {
      return;
    }
    _items.update(
        mealId,
        (cartItem) => CartItem(
            imageUrl: cartItem.imageUrl,
            name: cartItem.name,
            id: cartItem.id,
            price: cartItem.price,
            resDeviceid: cartItem.resDeviceid,
            quantity: cartItem.quantity - 1));
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
