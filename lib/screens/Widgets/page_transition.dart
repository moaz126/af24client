import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PageTransition {
  static fadeInNavigation({required page}) {
    Get.to(page,
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 300));
  }

  static leftToRightNavigation({required page}) {
    Get.to(page,
        transition: Transition.leftToRight,
        duration: const Duration(milliseconds: 300));
  }

  static cupertinoNavigation({required page}) {
    Get.to(page,
        transition: Transition.cupertino,
        duration: const Duration(milliseconds: 300));
  }

  static leftToRightWithFadeNavigation({required page}) {
    Get.to(page,
        transition: Transition.leftToRightWithFade,
        duration: const Duration(milliseconds: 300));
  }
}

class TextStyles {
  static TextStyle buildAppBarTexStyle()  {
    return TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold);
  }
  static TextStyle TitleTexStyle12() {
    return TextStyle(fontSize: 12,fontWeight: FontWeight.bold );
  }
  static TextStyle TitleTexStyle11() {
    return TextStyle(fontSize: 11,fontWeight: FontWeight.bold );
  }
  static TextStyle TitleTexStyle10() {
    return TextStyle(fontSize: 10, fontWeight: FontWeight.bold );
  }
  static TextStyle TitleTexStyle13() {
    return TextStyle(fontSize: 13,fontWeight: FontWeight.bold  );
  }
  static TextStyle TitleTexStyle14() {
    return TextStyle(fontSize: 14,fontWeight: FontWeight.bold  );
  }
}
