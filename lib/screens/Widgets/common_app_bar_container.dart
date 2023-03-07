import 'package:af24client/Api/globalVariables.dart';
import 'package:af24client/screens/Widgets/common_widgets.dart';
import 'package:af24client/screens/Widgets/page_transition.dart';
import 'package:flutter/material.dart';

class CommonAppBarContainer extends StatelessWidget {
  final String title;
  final Function() onClicked;
  const CommonAppBarContainer({Key? key, required this.title, required this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13,right: 13,),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(title,style: TextStyles.TitleTexStyle12(),),
                  InkWell(
                    onTap: onClicked,
                    child: Row(
                      children: [
                        Text("Close",style: TextStyles.TitleTexStyle12()),
                        SizedBox(
                          width: 8,
                        ),
                        Image.asset('assets/images/arrowDown.png',
                        height: 13,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            CommonUiWidget.Container1Nhalf(),
          ],
        )
    );
  }
}


class CommonAppBarContainerWithoutLeading extends StatelessWidget {
  final String title;
  const CommonAppBarContainerWithoutLeading({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13,right: 13,),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(title,style: TextStyles.TitleTexStyle13(),),
                ],
              ),
            ),
            CommonUiWidget.DividerWidthOneNHalf(),
          ],
        )
    );
  }
}

