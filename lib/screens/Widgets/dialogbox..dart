import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogController extends GetxController {
  String title = '';
  String message = '';
  String buttonText = '';

  void showDefaultDialog({
    required String title,
    required String message,
    required String buttonText,
    required Function() onClick,
  }) {
    this.title = title;
    this.message = message;
    this.buttonText = buttonText;
    Get.defaultDialog(
      title: title,
      content: Text(message),
      confirm: ElevatedButton(child: Text(buttonText), onPressed: onClick),
    );
  }
}

final dialogController = DialogController();
