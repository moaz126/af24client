import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyNotification extends ChangeNotifier {
  static int notificationCounter = 0;

  increment() {
    notificationCounter++;
    notifyListeners();
  }

  decrement() {
    if(notificationCounter == 0)
    {
      notifyListeners();
    }
    else
    {
      notificationCounter--;
      notifyListeners();
    }
  }

  setToZero() {
    notificationCounter = 0;
    notifyListeners();
  }

  setNotificationLength(int number) {
    notificationCounter = number;
    notifyListeners();
  }

  int getNotificationLength() {
    return notificationCounter;
  }
}
