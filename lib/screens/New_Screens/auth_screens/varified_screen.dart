import 'package:af24client/screens/New_Screens/auth_screens/shipping_country_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/common_elevated_button.dart';
import '../../Widgets/page_transition.dart';

class VarifiedScreen extends StatefulWidget {
  const VarifiedScreen({Key? key}) : super(key: key);

  @override
  State<VarifiedScreen> createState() => _VarifiedScreenState();
}

class _VarifiedScreenState extends State<VarifiedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
// backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Verified!',style: TextStyles.TitleTexStyle12(),),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35,right: 35),
                child: Text('setup your app first. it takes only 1 min.', textAlign: TextAlign.center,
                    style: TextStyles.TitleTexStyle13().copyWith(
                        height: 2,
                        fontWeight: FontWeight.normal
                    )
                ),
              ),

              // Align(alignment: Alignment.bottomCenter,
              //     child: CommonElevatedButtonWhite(title: 'App Setting', onClicked: (){
              //       Get.to(()=>ShippingCountryScreen());
              //     })),

            ],
          )
      ),
      bottomSheet: Container(
        margin: EdgeInsets.only(bottom: 10,left: 15,right: 15),
        child: CommonElevatedButtonWhite(title: 'App Setting', onClicked: (){

          PageTransition.fadeInNavigation(
              page: ShippingCountryScreen(
              ));
          // Get.to(()=>ShippingCountryScreen());
        }),
      ),
      // bottomNavigationBar: SizedBox(height: 10,),

    );
  }
}
