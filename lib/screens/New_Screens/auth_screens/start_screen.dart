import 'dart:io';

import 'package:af24client/screens/New_Screens/auth_screens/login_or_signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/colors.dart';
import '../../Widgets/common_app_bar_container.dart';
import '../../Widgets/common_elevated_button.dart';
import '../../Widgets/loader.dart';
import '../../Widgets/page_transition.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool term_and_conditoon = false;
  bool privacy_policy = false;
  bool marketing_profilling = false;

  void termandcondition() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15.0),
          ),
        ),
        builder: (context) {
          return Wrap(children: [
            StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  CommonAppBarContainer(
                      title: 'Consent',
                      onClicked: () {
                        Get.back();
                      }),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Terms and Condition',
                              style: TextStyles.TitleTexStyle12(),
                            ),
                            Switch.adaptive(
                                activeColor: AppColors.termAndCondition,
                                trackColor:
                                    MaterialStateProperty.all(Colors.black),
                                value: term_and_conditoon,
                                onChanged: (_) {
                                  setState(() {
                                    term_and_conditoon = !term_and_conditoon;
                                  });
                                })
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam ',
                                style: TextStyles.TitleTexStyle12().copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                  text: 'AF24 GmbH Terms & Conditions. ',
                                  style: TextStyles.TitleTexStyle12().copyWith(
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.underline,
                                      color: Colors.black),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print(
                                        'Terms of Service"',
                                      );
                                    }),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Privacy Policy',
                              style: TextStyles.TitleTexStyle12(),
                            ),
                            Switch.adaptive(
                                activeColor: AppColors.termAndCondition,
                                trackColor:
                                    MaterialStateProperty.all(Colors.black),
                                value: privacy_policy,
                                onChanged: (_) {
                                  setState(() {
                                    privacy_policy = !privacy_policy;
                                  });
                                })
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    'tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ',
                                style: TextStyles.TitleTexStyle12().copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                  text: 'AF24 GmbH Terms & Conditions. ',
                                  style: TextStyles.TitleTexStyle12().copyWith(
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.underline,
                                      color: Colors.black),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print(
                                        'Terms of Service"',
                                      );
                                    }),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Marketing & Profiling',
                              style: TextStyles.TitleTexStyle12(),
                            ),
                            Switch.adaptive(
                                activeColor: AppColors.termAndCondition,
                                trackColor:
                                    MaterialStateProperty.all(Colors.black),
                                value: marketing_profilling,
                                onChanged: (_) {
                                  setState(() {
                                    marketing_profilling =
                                        !marketing_profilling;
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
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                      child: CommonElevatedButtonWhite(
                          title: 'Continue', onClicked: () async {})),
                  SizedBox(
                    height: 15,
                  ),
                ],
              );
            }),
          ]);
        });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      termandcondition();
    });
  }

/*   @override
  initState() {
    Future.delayed(Duration(seconds: 1), () {
      termandcondition();
    });
  } */

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 200,
            width: 200,
          ),
          SizedBox(
            height: 5.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 55,
                      width: 315,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(color: Colors.black, width: 1.2),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Image.asset(
                            'assets/images/google.png',
                            height: 46,
                            width: 46,
                          ),
                          SizedBox(
                            width: 33,
                          ),
                          Text(
                            'Continue with Google',
                            style: TextStyles.TitleTexStyle13(),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 55,
                width: 315,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: Colors.black, width: 1.2),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Image.asset(
                      'assets/images/iphone.png',
                      height: 43,
                      width: 43,
                    ),
                    SizedBox(
                      width: 36,
                    ),
                    Text(
                      'Continue with Apple ID',
                      style: TextStyles.TitleTexStyle13(),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  PageTransition.fadeInNavigation(page: Login_SignUp_Screen());
                },
                child: Container(
                  height: 55,
                  width: 315,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: Colors.black, width: 1.2),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      Image.asset(
                        'assets/images/email.png',
                        height: 43,
                        width: 43,
                      ),
                      SizedBox(
                        width: 36,
                      ),
                      Text(
                        'Continue with Email',
                        style: TextStyles.TitleTexStyle13(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )

          // Padding(
          //   padding: const EdgeInsets.only(left: 20.0,right: 20.0),
          //   child: Text("Version 0.0.1",style: TextStyle(fontSize: 15.sp,color: Colors.white),),
          // ),
        ],
      ),
    );
  }
}
