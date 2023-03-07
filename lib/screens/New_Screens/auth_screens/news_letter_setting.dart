import 'package:af24client/screens/New_Screens/auth_screens/login_or_signup.dart';
import 'package:af24client/screens/New_Screens/home_screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/colors.dart';
import '../../Widgets/common_app_bar_container.dart';
import '../../Widgets/common_elevated_button.dart';
import '../../Widgets/common_widgets.dart';
import '../../Widgets/page_transition.dart';
class NewsLetterSetting extends StatefulWidget {
  const NewsLetterSetting({Key? key}) : super(key: key);

  @override
  State<NewsLetterSetting> createState() => _NewsLetterSettingState();
}

class _NewsLetterSettingState extends State<NewsLetterSetting> {
  bool newsletter =false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 95.h,
                  width: 99.w,
                ),
                Positioned(
                  right: 2,
                  top: 200,
                  child: Image.asset('assets/images/news.png',fit: BoxFit.fill,
                    height: 50.h,
                    width: 70.w,

                  ),
                ),
                Column(
                  children: [
                    CommonAppBarContainerWithoutLeading(title: 'App Setting',),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Column(
                        children: [
                          Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Newsletter',style: TextStyles.TitleTexStyle14(),),
                              Switch.adaptive(activeColor: AppColors.termAndCondition,
                                  trackColor: MaterialStateProperty.all(Colors.black),
                                  value: newsletter, onChanged: (_){
                                    setState(() {
                                      newsletter =!newsletter;
                                    });
                                  }),
                            ],
                          ),
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                  'tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren. ',
                                  style: TextStyles.TitleTexStyle13().copyWith(
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
                    CommonUiWidget.DividerWidthOne(),
                    SizedBox(
                      height: 370,
                    ),


                  ],
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                    right: 20,
                  child: Column(
                    children: [
                      Text('Skip, I will setup later',style: TextStyles.TitleTexStyle13(),),
                      SizedBox(
                        height: 10,
                      ),
                      CommonElevatedButtonWhite(title: 'Done', onClicked: (){


                        PageTransition.fadeInNavigation(
                            page: Login_SignUp_Screen(
                            ));

                      }),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
