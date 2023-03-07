import 'package:af24client/Api/globalVariables.dart';
import 'package:af24client/screens/New_Screens/auth_screens/login_or_signup.dart';
import 'package:af24client/screens/Widgets/colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:af24client/screens/Widgets/common_elevated_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/bottom_bar.dart';
import '../../Widgets/colors.dart';
import '../../Widgets/common_app_bar_container.dart';
import '../../Widgets/page_transition.dart';
import '../auth_screens/notification_setting.dart';
import '../../Widgets/common_widgets.dart';
import '../../Widgets/page_transition.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
        '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }
  bool billingSwitch =false;
  bool account =true;
  bool appsetting =false;
  bool term_and_conditoon =false;
  bool privacy_policy =false;
  bool marketing_profilling =false;
  bool apple_face_Id =false;
  bool notification =false;
  bool newsletters =false;
  bool currency = false;
  bool country = false;
  bool applanguage = false;

  Future<dynamic> _onBackPressed(context) async {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Exit',
      desc: 'Do you want to exit app',
      btnCancelOnPress: () {},
      btnCancelText: 'No',
      btnOkText: 'Yes',
      btnOkOnPress: () async {
        SystemNavigator.pop();
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          bool? result = await _onBackPressed(context);
          if (result == null) {
            result = false;
          }
          return result;
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 2,
                ),
                CommonUiWidget.DividerWidthOneNThree(),
                SizedBox(
                  height: 3,
                ),
                Row(children: [
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: (){
                        setState(() {
                          account= true;
                          appsetting= false;

                        });
                      },
                      child: account ==true?
                      Text('Account',
                        style:
                        TextStyles.TitleTexStyle13(),

                      ):
                      Text('Account',
                        style:
                        TextStyles.TitleTexStyle13().copyWith(
                            fontWeight: FontWeight.normal),

                      )
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: (){
                        setState(() {
                          appsetting= true;
                          account= false;


                        });
                      },
                      child: appsetting ==true?
                      Text('AppSetting',
                        style:
                        TextStyles.TitleTexStyle13(),

                      ):
                      Text('AppSetting',
                        style:
                        TextStyles.TitleTexStyle13().copyWith(
                            fontWeight: FontWeight.normal),

                      )
                  ),
                  SizedBox(
                    width: 10,
                  ),

                ],),
                SizedBox(
                  height: 3,
                ),
                SizedBox(
                    height: 8,
                    child: Stack(children : [

                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: CommonUiWidget.DividerWidthOneNThree(),
                      ),
                      account ==true?
                      Positioned(
                        left: 20,
                        child: Container(
                          height: 5,
                          width: 23,
                          color: Colors.black,
                        ),
                      ):
                      Positioned(
                        left: 105,
                        child: Container(
                          height: 5,
                          width: 17,
                          color: Colors.black,
                        ),
                      )

                    ])),

                account ==true?
                    Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: AppColors.termAndCondition.withOpacity(0.4)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 16,right: 18,bottom: 16,left: 18),
                                  child: Text('PB',style: TextStyles.TitleTexStyle13().copyWith(
                                    fontSize: 16
                                  ),),
                                ),
                              ),

                              InkWell(
                                onTap: (){
                                  setUserLoggedIn(false);
                                  Get.offAll(()=>Login_SignUp_Screen());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Colors.black)
                                  ),
                                  child:   Padding(
                                    padding: const EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 5),
                                    child: Row(children: [
                                      Text('Log Out',style: TextStyles.TitleTexStyle13(),),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset('assets/images/logout.png',height: 15,
                                        width: 15,)
                                    ],),
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CommonUiWidget.DividerWidthOneNThree(),
                        SizedBox(
                          height: 5,
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 10,),
                            Text('Personal info',style: TextStyles.TitleTexStyle13(),),
                          ],
                        ),
                        CommonUiWidget.DividerWidthOne(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width:300,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14,right: 10),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),

                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('First name',style: TextStyles.TitleTexStyle12(),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text('Last name',style: TextStyles.TitleTexStyle12(),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text('Phone number',style: TextStyles.TitleTexStyle12(),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text('Email',style: TextStyles.TitleTexStyle12(),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                        ],
                                      ),
                                      Column(mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Pina',style: TextStyles.TitleTexStyle11(),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text('Bau',style: TextStyles.TitleTexStyle11(),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text('+49 1234 234 1234',style: TextStyles.TitleTexStyle11(),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text('Sample@email.com',style: TextStyles.TitleTexStyle11(),),
                                          SizedBox(
                                            height: 4,
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ),
                        ),
                        CommonUiWidget.DividerWidthOneNThree(),
                        SizedBox(
                          height: 5,
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 10,),
                            Text('Password change',style: TextStyles.TitleTexStyle13(),),
                          ],
                        ),
                        CommonUiWidget.DividerWidthOne(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width:270,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14,right: 10),
                              child: Column(
                                children: [

                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Password',style: TextStyles.TitleTexStyle12(),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                        ],
                                      ),
                                      Column(mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('**********',style: TextStyles.TitleTexStyle11(),),
                                          SizedBox(
                                            height: 4,
                                          ),


                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ),
                        ),


                        CommonUiWidget.DividerWidthOneNThree(),
                        SizedBox(
                          height: 5,
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 10,),
                            Text('Shipping  information ',style: TextStyles.TitleTexStyle13(),),
                          ],
                        ),
                        CommonUiWidget.DividerWidthOne(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width:270,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14,right: 10),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),

                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Address',style: TextStyles.TitleTexStyle12(),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text('Postcode',style: TextStyles.TitleTexStyle12(),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text('City',style: TextStyles.TitleTexStyle12(),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text('Country',style: TextStyles.TitleTexStyle12(),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                        ],
                                      ),
                                      Column(mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Sample street',style: TextStyles.TitleTexStyle11(),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text('A123456',style: TextStyles.TitleTexStyle11(),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text('Sample city',style: TextStyles.TitleTexStyle11(),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text('Germany',style: TextStyles.TitleTexStyle11(),),
                                          SizedBox(
                                            height: 4,
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ),
                        ),


                        CommonUiWidget.DividerWidthOneNThree(),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text('Billing address is same as shipping',style: TextStyles.TitleTexStyle13(),),
                              Switch.adaptive(activeColor: AppColors.termAndCondition,
                                  trackColor: MaterialStateProperty.all(Colors.black),
                                  value: billingSwitch, onChanged: (_){
                                    setState(() {
                                      billingSwitch =!billingSwitch;
                                    });
                                  })
                            ],
                          ),
                        ),
                        CommonUiWidget.DividerWidthOne(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width:270,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14,right: 10),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),

                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Address',style: TextStyles.TitleTexStyle12().copyWith(color: Colors.grey.withOpacity(0.7)),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text('Postcode',style: TextStyles.TitleTexStyle12().copyWith(color: Colors.grey.withOpacity(0.7)),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text('City',style: TextStyles.TitleTexStyle12().copyWith(color: Colors.grey.withOpacity(0.7)),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text('Country',style: TextStyles.TitleTexStyle12().copyWith(color: Colors.grey.withOpacity(0.7)),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                        ],
                                      ),
                                      Column(mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Sample street',style: TextStyles.TitleTexStyle11().copyWith(color: Colors.grey.withOpacity(0.7)),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text('A123456',style: TextStyles.TitleTexStyle11().copyWith(color: Colors.grey.withOpacity(0.7)),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text('Sample city',style: TextStyles.TitleTexStyle11().copyWith(color: Colors.grey.withOpacity(0.7)),),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text('Germany',style: TextStyles.TitleTexStyle11().copyWith(color: Colors.grey.withOpacity(0.7)),),
                                          SizedBox(
                                            height: 4,
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ),
                        ),
                      ],
                    ):


                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text('Apple Face ID / Touch ID',style: TextStyles.TitleTexStyle13(),),
                              Switch.adaptive(activeColor: AppColors.termAndCondition,
                                  trackColor: MaterialStateProperty.all(Colors.black),
                                  value: apple_face_Id, onChanged: (_){
                                    setState(() {
                                      apple_face_Id  =!apple_face_Id;
                                    });
                                  })
                            ],
                          ),
                        ),
                        CommonUiWidget.DividerWidthOneNThree(),
                        ExpansionTile(
                          textColor: Colors.black,collapsedTextColor: Colors.black,
                          title:  Text('Currency',style: TextStyles.TitleTexStyle13(),),
                          onExpansionChanged: (bool expanded) {
                            setState(() => currency = expanded);
                          },
                          trailing:

                             Container(
                               width: 200,
                               child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                 children: [
                                   Text('Euro',style: TextStyles.TitleTexStyle13(),),
                                   SizedBox(width: 8,),
                                   currency ?
                                   Image.asset(
                                     ('assets/images/closeexpansion.png'),height: 15,width: 15,):
                                   Image.asset(
                                     ('assets/images/openexpansion.png'),height: 15,width: 15,),

                                 ],
                               ),
                             ),

                          children: [
                            Container(
                              color: Colors.white,
                              child: SizedBox(
                                height: 30,
                              ),
                            ),
                          ],
                        ),

                        CommonUiWidget.DividerWidthOneNThree(),

                        ExpansionTile(
                          textColor: Colors.black,collapsedTextColor: Colors.black,
                          title:  Text('Country',style: TextStyles.TitleTexStyle13(),),
                          onExpansionChanged: (bool expanded) {
                            setState(() => country = expanded);
                          },
                          trailing:

                          Container(
                            width: 200,
                            child: Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Germany',style: TextStyles.TitleTexStyle13(),),
                                SizedBox(width: 8,),
                                country ?
                                Image.asset(
                                  ('assets/images/closeexpansion.png'),height: 15,width: 15,):
                                Image.asset(
                                  ('assets/images/openexpansion.png'),height: 15,width: 15,),

                              ],
                            ),
                          ),

                          children: [
                            Container(
                              color: Colors.white,
                              child: SizedBox(
                                height: 30,
                              ),
                            ),
                          ],
                        ),

                        CommonUiWidget.DividerWidthOneNThree(),

                        ExpansionTile(
                          textColor: Colors.black,collapsedTextColor: Colors.black,
                          title:  Text('App Language',style: TextStyles.TitleTexStyle13(),),
                          onExpansionChanged: (bool expanded) {
                            setState(() => applanguage = expanded);
                          },
                          trailing:

                          Container(
                            width: 200,
                            child: Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('English',style: TextStyles.TitleTexStyle13(),),
                                SizedBox(width: 8,),
                                applanguage ?
                                Image.asset(
                                  ('assets/images/closeexpansion.png'),height: 15,width: 15,):
                                Image.asset(
                                  ('assets/images/openexpansion.png'),height: 15,width: 15,),

                              ],
                            ),
                          ),

                          children: [
                            Container(
                              color: Colors.white,
                              child: SizedBox(
                                height: 30,
                              ),
                            ),
                          ],
                        ),

                        CommonUiWidget.DividerWidthOneNThree(),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text('Notification',style: TextStyles.TitleTexStyle13(),),
                              Switch.adaptive(activeColor: AppColors.termAndCondition,
                                  trackColor: MaterialStateProperty.all(Colors.black),
                                  value: notification, onChanged: (_){
                                    setState(() {
                                      notification  =!notification;
                                    });
                                  })
                            ],
                          ),
                        ),
                        CommonUiWidget.DividerWidthOneNThree(),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text('Newsletter',style: TextStyles.TitleTexStyle13(),),
                              Switch.adaptive(activeColor: AppColors.termAndCondition,
                                  trackColor: MaterialStateProperty.all(Colors.black),
                                  value: newsletters, onChanged: (_){
                                    setState(() {
                                      newsletters  =!newsletters;
                                    });
                                  })
                            ],
                          ),
                        ),
                        CommonUiWidget.DividerWidthOneNThree(),


                        Column(
                          children: [
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

                                ],
                              ),
                            ),

                            SizedBox(
                              height: 7,
                            ),
                            CommonUiWidget.DividerWidthOneNThree(),
                            SizedBox(
                              height: 10,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: Column(
                                children: [
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
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            CommonUiWidget.DividerWidthOneNThree(),


                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),

                              child: Column(
                                children: [
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
                              height: 7,
                            ),
                            CommonUiWidget.DividerWidthOneNThree(),

                          ],
                        ),

                      ],
                    )

              ],
            ),
          ),

          bottomNavigationBar: CommonNavigationBar(index: 4),
        ),
      ),
    );
  }
}
