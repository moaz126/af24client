import 'package:af24client/screens/Widgets/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';

class CommonElevatedButtonWhite extends StatelessWidget {
  final String title;
  final Function() onClicked;

  const CommonElevatedButtonWhite({Key? key, required this.title, required this.onClicked}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      width: 93.w,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(maximumSize: Size(93.w, 8.h),
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

class CommonElevatedButtonBlack extends StatelessWidget {
  final String title;
  final Function() onClicked;

  const CommonElevatedButtonBlack({Key? key, required this.title, required this.onClicked}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      width: 93.w,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(maximumSize: Size(93.w, 8.h),
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







