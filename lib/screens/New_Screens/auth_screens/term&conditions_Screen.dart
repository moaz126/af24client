import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../Widgets/colors.dart';
import '../../Widgets/common_app_bar_container.dart';
import '../../Widgets/common_elevated_button.dart';
import '../../Widgets/page_transition.dart';

class TermAndConditionScreen extends StatefulWidget {
  const TermAndConditionScreen({Key? key}) : super(key: key);
  @override
  State<TermAndConditionScreen> createState() => _TermAndConditionScreenState();
}


class _TermAndConditionScreenState extends State<TermAndConditionScreen> {
  bool term_and_conditoon =false;
  bool privacy_policy =false;
  bool marketing_profilling =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: (){
              showModalBottomSheet(isScrollControlled: true,
                  context: context,
                  shape: const RoundedRectangleBorder( // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Wrap(

                        children: [StatefulBuilder(
                            builder: (BuildContext context,
                                StateSetter setState) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CommonAppBarContainer(title: 'Consent', onClicked: (){
                                  }),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10),
                                    child: Column(
                                      children: [
                                        Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Terms and Condition',style: TextStyles.TitleTexStyle14(),),
                                            Switch.adaptive(activeColor: AppColors.termAndCondition,
                                                trackColor: MaterialStateProperty.all(Colors.black),
                                                value: term_and_conditoon, onChanged: (_){
                                                  setState(() {
                                                    term_and_conditoon =!term_and_conditoon;
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
                                                style: TextStyles.TitleTexStyle13().copyWith(
                                                    fontWeight: FontWeight.normal,


                                                    color:Colors.black
                                                ),
                                              ),
                                              TextSpan(
                                                  text: 'AF24 GmbH Terms & Conditions. ',
                                                  style: TextStyles.TitleTexStyle13().copyWith(
                                                      fontWeight: FontWeight.normal,
                                                      decoration: TextDecoration.underline,
                                                      color:Colors.black
                                                  ),
                                                  recognizer: TapGestureRecognizer()
                                                    ..onTap = () {
                                                      print(
                                                        'Terms of Service"',
                                                      );

                                                    }),

                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Privacy Policy',style: TextStyles.TitleTexStyle14(),),
                                            Switch.adaptive(activeColor: AppColors.termAndCondition,
                                                trackColor: MaterialStateProperty.all(Colors.black),
                                                value: privacy_policy, onChanged: (_){
                                                  setState(() {
                                                    privacy_policy =!privacy_policy;
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
                                                style: TextStyles.TitleTexStyle13().copyWith(
                                                    fontWeight: FontWeight.normal,


                                                    color:Colors.black
                                                ),
                                              ),
                                              TextSpan(
                                                  text: 'AF24 GmbH Terms & Conditions. ',
                                                  style: TextStyles.TitleTexStyle13().copyWith(
                                                      fontWeight: FontWeight.normal,
                                                      decoration: TextDecoration.underline,
                                                      color:Colors.black
                                                  ),
                                                  recognizer: TapGestureRecognizer()
                                                    ..onTap = () {
                                                      print(
                                                        'Terms of Service"',
                                                      );

                                                    }),

                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Marketing & Profiling',style: TextStyles.TitleTexStyle14(),),
                                            Switch.adaptive(activeColor: AppColors.termAndCondition,
                                                trackColor: MaterialStateProperty.all(Colors.black),
                                                value: marketing_profilling, onChanged: (_){
                                                  setState(() {
                                                    marketing_profilling =!marketing_profilling;
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
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Center(child: CommonElevatedButtonWhite(title: 'Continue', onClicked: (){}))

                                ],
                              );

                            }
                        ),]
                    );
                  });
            },
            child: Container(
              height: 300,
              color: Colors.red,
            ),
          ),
        ],
      ),

    );
  }
}
