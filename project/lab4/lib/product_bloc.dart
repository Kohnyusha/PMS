import 'package:flutter/foundation.dart';

class ProductBloc with ChangeNotifier {
  int _quantity = 0;
  int get quantity => _quantity;

  bool _isBasketCleared = false;
  bool get isBasketCleared => _isBasketCleared;

  void addToCart(int quantityToAdd) {
    _quantity += quantityToAdd;
    notifyListeners();//для оповещения слушателей об изменении состояния, которые подписались на ProductBloc
  }
  void clearBasket() {
    _quantity = 0;
    _isBasketCleared = true;
    notifyListeners();
  }

  void decrementQuantity() {
    if (_quantity > 0) {
      _quantity--;
      notifyListeners();
    }
  }

  void setBasketCleared(bool value) {
    _isBasketCleared = value;
    notifyListeners();
  }
}