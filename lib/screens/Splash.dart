
import 'package:af24client/main.dart';
import 'package:af24client/Api/globalVariables.dart';
import 'package:af24client/navBar.dart';
import 'package:af24client/screens/LoginCreateAccount/homePage.dart';
import 'package:af24client/screens/New_Screens/home_screen/home_page.dart';
import 'package:af24client/screens/New_Screens/auth_screens/login_or_signup.dart';
import 'package:af24client/screens/New_Screens/setting/setting.dart';
import 'package:af24client/screens/New_Screens/auth_screens/varified_screen.dart';
import 'package:af24client/screens/practice.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Provider/NotificationProvider.dart';
import '../api/auth_af24.dart';
import '../newBar.dart';
import 'New_Screens/auth_screens/start_screen.dart';
import 'Widgets/bottom_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getState() async {

    var isLogin = await getUserLoggedIn();

    if (isLogin) {
      String? token = await getUserDataToken();
      Customer_Token.value = token!;
      await DataApiService.instance.getSellerInfo();
      setState(() {
        Provider.of<MyNotification>(context, listen: false).setNotificationLength(sellerinfo!.notify_count_unseen!);
        notificationCount = sellerinfo!.notify_count_unseen!;
      });
      DataApiService.instance.updateFcmToken();
      Future.delayed(Duration(seconds: 2), () {
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => CommonNavigationBar(index: 0)));
        //
        Get.off(() => HomePage());
      });

    } else {
      Future.delayed(Duration(seconds: 2), () {
        Get.offAll(() => StartScreen());
      });
    }
  }

  @override
  void initState() {
    getState();
    super.initState();  
  }

  @override
  Widget build(BuildContext context) {


    final Screenspinkit = SpinKitSpinningLines(
      size: 4.h,
      color: Colors.black,
    );
    return Scaffold(

      body:
          Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,


            children: [

             Image.asset('assets/images/logo.png',
             height: 200,
               width: 200,
             ),
              SizedBox(height: 5.h,),
              Screenspinkit,

              // Padding(
              //   padding: const EdgeInsets.only(left: 20.0,right: 20.0),
              //   child: Text("Version 0.0.1",style: TextStyle(fontSize: 15.sp,color: Colors.white),),
              // ),
            ],
          ),
    );
  }
  incrementCounter(){

  }
}
