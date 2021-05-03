import 'package:flutter/foundation.dart';

class QuantityProvider with ChangeNotifier {

  int _quantity = 0;

  get quantity => _quantity;
  set quantity(int value){
    _quantity = value;
    notifyListeners();
  }

}