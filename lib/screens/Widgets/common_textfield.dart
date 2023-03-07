import 'package:af24client/screens/Widgets/page_transition.dart';
import 'package:flutter/material.dart';



class InputDecorations {
  static InputDecoration inputDecorationNoBorder(

      {labelText = "",}) {
    return InputDecoration(

        enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1.5
      )
    ),


        labelText: labelText,labelStyle: TextStyles.TitleTexStyle13().copyWith(
      color: Colors.black,fontWeight: FontWeight.normal
    ),

      hintStyle: TextStyles.TitleTexStyle13().copyWith(

      )
    );
  }


}
