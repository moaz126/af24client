import 'package:af24client/screens/Widgets/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';

class CommonElevatedButtonWhite50 extends StatelessWidget {
  final String title;
  final Function() onClicked;

  const CommonElevatedButtonWhite50({Key? key, required this.title, required this.onClicked}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      width: 50.w,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(maximumSize: Size(90.w, 8.h),
          primary: Colors.white,
          side: BorderSide(
              color: Colors.black
          ),

          // textStyle: TextStyles.TitleTexStyle13().copyWith(
          //   color: Colors.black
          // ),
        ),

        onPressed: onClicked, child: Text(title,style: TextStyles.TitleTexStyle13().copyWith(
          color: Colors.black
      ),),

      ),
    );
  }
}

class CommonElevatedButtonBlack50 extends StatelessWidget {
  final String title;
  final Function() onClicked;

  const CommonElevatedButtonBlack50({Key? key, required this.title, required this.onClicked}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      width: 50.w,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(maximumSize: Size(90.w, 8.h),
          primary: Colors.black,
          side: BorderSide(
              color: Colors.black
          ),

          // textStyle: TextStyles.TitleTexStyle13().copyWith(
          //   color: Colors.black
          // ),
        ),
        onPressed: onClicked, child: Text(title,style: TextStyles.TitleTexStyle13().copyWith(
          color: Colors.white
      ),),

      ),
    );
  }
}







