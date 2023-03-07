import 'package:af24client/screens/New_Screens/auth_screens/news_letter_setting.dart';
import 'package:af24client/screens/Widgets/common_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../Widgets/colors.dart';
import '../../Widgets/common_app_bar_container.dart';
import '../../Widgets/common_widgets.dart';
import '../../Widgets/page_transition.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({Key? key}) : super(key: key);

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  bool notificationCategoryA =false;
  bool notificationCategoryB =false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Stack(
              children: [
            Container(
              height: 95.h,
              width: 100.w,
              child: Image.asset('assets/images/notificationsetting.png'),
            ),
            Column(
              children: [
                CommonAppBarContainerWithoutLeading(title: 'App Setting', ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Text('Notification',style: TextStyles.TitleTexStyle12(),)
                  ],
                ),
                // CommonUiWidget.DividerWidthOneNHalf(),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14,right: 10),
                  child: Column(
                    children: [
                      Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Notification Category A',style: TextStyles.TitleTexStyle12(),),
                          Switch.adaptive(activeColor: AppColors.termAndCondition,
                              trackColor: MaterialStateProperty.all(Colors.black),
                              value: notificationCategoryA, onChanged: (_){
                                setState(() {
                                  notificationCategoryA =!notificationCategoryA;
                                });
                              })
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text:
                              'tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren. ',
                              style: TextStyles.TitleTexStyle12().copyWith(
                                  fontWeight: FontWeight.normal,


                                  color:Colors.black
                              ),
                            ),


                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Notification Categorie B',style: TextStyles.TitleTexStyle12(),),
                          Switch.adaptive(activeColor: AppColors.termAndCondition,
                              trackColor: MaterialStateProperty.all(Colors.black),
                              value: notificationCategoryB, onChanged: (_){
                                setState(() {
                                  notificationCategoryB =!notificationCategoryB;
                                });
                              })
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text:
                              'tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren.',
                              style: TextStyles.TitleTexStyle12().copyWith(
                                  fontWeight: FontWeight.normal,
                                  color:Colors.black
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                 // CommonUiWidget.DividerWidthOne(),




              ],
            ),
                Positioned(
                  bottom: 10,
                  left: 15,
                      right: 15,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Text('Skip, I will setup later',style: TextStyles.TitleTexStyle12(),),
                        SizedBox(
                          height: 13,
                        ),
                        CommonElevatedButtonWhite(title: 'Next', onClicked: (){
                          PageTransition.fadeInNavigation(
                              page: NewsLetterSetting(
                              ));
                          // Get.to(()=>NewsLetterSetting());
                        }),
                      ],
                    ),
                  ),
                ),

          ])
          
        ],
      ),
//          bottomSheet: Column(
//   children: [
//     CommonAppBarContainerWithoutLeading(title: 'App Setting', ),
//     Row(
//       children: [
//         SizedBox(
//           width: 13,
//         ),
//         Text('Notification',style: TextStyles.TitleTexStyle13(),)
//       ],
//     ),
//     CommonUiWidget.DividerWidthOneNHalf(),
//     SizedBox(
//       height: 10,
//     ),
//     Padding(
//       padding: const EdgeInsets.only(left: 10,right: 10),
//       child: Column(
//         children: [
//           Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Notification Category A',style: TextStyles.TitleTexStyle14(),),
//               Switch.adaptive(activeColor: AppColors.termAndCondition,
//                   trackColor: MaterialStateProperty.all(Colors.black),
//                   value: notificationCategoryA, onChanged: (_){
//                     setState(() {
//                       notificationCategoryA =!notificationCategoryA;
//                     });
//                   })
//             ],
//           ),
//           RichText(
//             text: TextSpan(
//               children: <TextSpan>[
//                 TextSpan(
//                   text:
//                   'tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren. ',
//                   style: TextStyles.TitleTexStyle13().copyWith(
//                       fontWeight: FontWeight.normal,
//
//
//                       color:Colors.black
//                   ),
//                 ),
//
//
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Notification Categorie B',style: TextStyles.TitleTexStyle14(),),
//               Switch.adaptive(activeColor: AppColors.termAndCondition,
//                   trackColor: MaterialStateProperty.all(Colors.black),
//                   value: notificationCategoryB, onChanged: (_){
//                     setState(() {
//                       notificationCategoryB =!notificationCategoryB;
//                     });
//                   })
//             ],
//           ),
//           RichText(
//             text: TextSpan(
//               children: <TextSpan>[
//                 TextSpan(
//                   text:
//                   'tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren.',
//                   style: TextStyles.TitleTexStyle13().copyWith(
//                       fontWeight: FontWeight.normal,
//
//
//                       color:Colors.black
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//         ],
//       ),
//     ),
//     CommonUiWidget.DividerWidthOne(),
//     SizedBox(
//       height: 250,
//     ),
//     Column(
//       children: [
//         Text('Skip, I will setup later',style: TextStyles.TitleTexStyle13(),),
//         SizedBox(
//           height: 10,
//         ),
//         CommonElevatedButtonWhite(title: 'Next', onClicked: (){
//           Get.to(()=>NewsLetterSetting());
//         })
//       ],
//     ),
//
//
//   ],
// ),
    )
    );
  }
}
