import 'package:af24client/screens/New_Screens/auth_screens/shipping_country_screen.dart';
import 'package:af24client/screens/Widgets/common_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/page_transition.dart';

class AlmostDoneScreen extends StatefulWidget {
  const AlmostDoneScreen({Key? key}) : super(key: key);

  @override
  State<AlmostDoneScreen> createState() => _AlmostDoneScreenState();
}

class _AlmostDoneScreenState extends State<AlmostDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 53.h,
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Almost done!',style: TextStyles.TitleTexStyle14(),),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35,right: 35),
                  child: Text('We have sent an email with a confirmation link to your email address. Please allow 5-10 minutes for this message to arrive.', textAlign: TextAlign.center,
                      style: TextStyles.TitleTexStyle13().copyWith(
                          height: 1.7,
                          fontWeight: FontWeight.normal
                      )
                  ),
                ),
              ],
            ),
          ),


          SizedBox(
            height: 36.h,
          ),

          CommonElevatedButtonBlack(title: 'App Setting', onClicked: () {
            PageTransition.fadeInNavigation(
                page: ShippingCountryScreen(
                ));
          },),


        ],
      ),

    );
  }
}
