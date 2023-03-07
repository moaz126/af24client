import 'package:af24client/screens/Widgets/common_elevated_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/bottom_bar.dart';
import '../../Widgets/colors.dart';
import '../../Widgets/common_app_bar_container.dart';
import '../../Widgets/page_transition.dart';
import 'notification_setting.dart';

class ShippingCountryScreen extends StatefulWidget {
  const ShippingCountryScreen({Key? key}) : super(key: key);

  @override
  State<ShippingCountryScreen> createState() => _ShippingCountryScreenState();
}

class _ShippingCountryScreenState extends State<ShippingCountryScreen> {
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

  void cookiesfunction()  {
    showModalBottomSheet(isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder( // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15.0),
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
                        SizedBox(
                          height: 5,
                        ),
                        CommonAppBarContainer(title: 'Cookies', onClicked: (){
                          Get.back();
                        }),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 10),
                          child: Column(
                            children: [
                              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('We use cookies improve your experience on Af24',style: TextStyles.TitleTexStyle12(),),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:
                                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam ',
                                      style: TextStyles.TitleTexStyle12().copyWith(
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
                                height: 50,
                              ),

                            ],
                          ),
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Customize',style: TextStyles.TitleTexStyle13(),)
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(child: CommonElevatedButtonBlack(title: 'Accept', onClicked: (){})),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    );

                  }
              ),]
          );
        });


  }

  @override
  initState() {
    Future.delayed(Duration(seconds: 1), () {
      cookiesfunction();
    });
  }

  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/images/shippingbackground.png',fit: BoxFit.fill,
                height: 98.h,
                width: 99.w,
              ),
              Column(
                children: [

                  CommonAppBarContainerWithoutLeading(title: 'App Setting', ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 22,
                      ),
                      Text('Choose your shipping country*',style: TextStyles.TitleTexStyle13(),),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Text('LAT: ${_currentPosition?.latitude ?? ""}'),
                  // Text('LNG: ${_currentPosition?.longitude ?? ""}'),
                  // Text('ADDRESS: ${_currentAddress ?? ""}'),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/location.png',height: 20,width: 20,),
                      SizedBox(width: 7,),
                      InkWell(
                          onTap: (){
                            _getCurrentPosition();
                          },
                          child: Text('Turn on my Location',style: TextStyles.TitleTexStyle12().copyWith(
                            fontWeight: FontWeight.normal
                          ),)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: GridView.builder(
                      itemCount: 8,
                      itemBuilder:
                          (BuildContext context,
                          int i) {
                        return InkWell(
                          onTap: (){
                          cookiesfunction();
                          },
                          child: Container(
                            height: 20,

                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .start,
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                              children: [
                                Image.asset('assets/images/germany.png',

                                  height: 18,
                                  width: 18,),
                                SizedBox(width: 10,),
                                Text('Germany',style: TextStyles.TitleTexStyle13().copyWith(
                                  fontWeight: FontWeight.normal
                                ),),

                              ],
                            ),
                          ),
                        );
                      },
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 0,
                        mainAxisExtent:50,
                      ),
                      padding:
                      const EdgeInsets.all(10),
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                    ),
                  ),
                ],
              ),

                Positioned(
                    bottom: 40,
                    left: 13,
                    child: CommonElevatedButtonWhite(title: 'Next', onClicked: (){
                      PageTransition.fadeInNavigation(
                          page: NotificationSetting(
                          ));
                              // Get.to(()=>NotificationSetting());

                    }))

              ]
            ),


          ],
      ),
        ),
      ),
    );
  }
}


