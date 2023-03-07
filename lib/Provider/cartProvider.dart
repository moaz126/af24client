import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCart extends ChangeNotifier {
  static int counter = 0;

  increment() {
    counter++;
    notifyListeners();
  }

  decrement() {
    if(counter == 0)
      {
        notifyListeners();
      }
    else
    {
      counter--;
      notifyListeners();
    }
  }

  setToZero() {
    counter = 0;
    notifyListeners();
  }

  setCartLength(int number) {
    counter = number;
    notifyListeners();
  }

  int getCartLength() {
    return counter;
  }
}
