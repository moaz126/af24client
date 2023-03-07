import 'dart:developer';
import 'package:af24client/Api/Auth_af24.dart';
import 'package:af24client/screens/LoginCreateAccount/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../localization/languages/languages.dart';
import '../../Api/globalVariables.dart';
import '../../newBar.dart';
import 'login.dart';

// class mainpage extends StatefulWidget {
//   const mainpage({Key? key}) : super(key: key);
//
//   @override
//   _mainpageState createState() => _mainpageState();
// }
//
// class _mainpageState extends State<mainpage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 15.h,
//           ),
//           Container(
//             alignment: Alignment.center,
//             width: MediaQuery.of(context).size.width,
//             height: 22.h,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/icons/Seller app icon (11).png',
//                   height: 6.h,
//                   color: Colors.white,
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             height: 63.h,
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20))),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 Container(
//                   alignment: Alignment.center,
//                   width: MediaQuery.of(context).size.width,
//                   child: Text(
//                     "Sign up or Create Account",
//                     style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 3.h,
//                 ),
//                 Container(
//                   //color: Colors.red,
//                   width: 88.w,
//                   height: 6.h,
//
//                   child: FlatButton(
//                       onPressed: () {
//                         Navigator.of(context).push(
//                             MaterialPageRoute(builder: (context) => Login()));
//                         // print(DataApiService.instance.getlogintoken());
//                       },
//                       child: Text(
//                         "Sign In",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 15,
//                             fontWeight: FontWeight.normal),
//                       ),
//                       color: Colors.black,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(6))),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   //color: Colors.red,
//                   width: 88.w,
//                   height: 6.h,
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey.withOpacity(0.2)),
//                       borderRadius: BorderRadius.circular(6)),
//
//                   child: FlatButton(
//                     onPressed: () {
//                       Navigator.of(context).push(
//                           MaterialPageRoute(builder: (context) => signup()));
//                     },
//                     child: Text(
//                       "Create Account",
//                       style: TextStyle(
//                           color: Colors.black.withOpacity(0.5),
//                           fontSize: 15,
//                           fontWeight: FontWeight.normal),
//                     ),
//                     color: Colors.white,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  _mainpageState createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  bool loader = false;
  final spinkit = SpinKitDancingSquare(
    size: 3.h,
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration:
        BoxDecoration(color: index.isEven ? Colors.white: Colors.white,),
      );
    },
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: [
        Container(
          height: 100.h,
            child: Image.asset(
          'assets/images/BackgroundImage.jpg',
          fit: BoxFit.fill,
          color: Colors.white12.withOpacity(0.8),
          colorBlendMode: BlendMode.modulate,
        )),
        Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 22.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/Seller app icon (11).png',
                      height: 6.h,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 35.h,
                  ),
                  // Container(
                  //   //color: Colors.red,
                  //   width: 95.w,
                  //   height: 6.h,
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  //       borderRadius: BorderRadius.circular(6)),
                  //   child: FlatButton(
                  //       onPressed: () {
                  //         Navigator.of(context).push(
                  //             MaterialPageRoute(builder: (context) => Login()));
                  //         // print(DataApiService.instance.getlogintoken());
                  //       },
                  //       child:
                  //   Text(
                  //     Languages.of(context)!.SIGNIN,
                  //         style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 15,
                  //             fontWeight: FontWeight.normal),
                  //       ),
                  //       color: Colors.black,
                  //       // shape: RoundedRectangleBorder(
                  //       //     borderRadius: BorderRadius.circular(6))
                  //   ),
                  // ),
                  SizedBox(
                    height: 1.h,
                  ),
                  // Container(
                  //   //color: Colors.red,
                  //   width: 95.w,
                  //   height: 6.h,
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  //       borderRadius: BorderRadius.circular(6)),
                  //
                  //   child: FlatButton(
                  //     onPressed: () {
                  //       Navigator.of(context).push(
                  //           MaterialPageRoute(builder: (context) => signup()));
                  //     },
                  //     child: Text(
                  //       Languages.of(context)!.CREATE_ACCOUNT,
                  //       style: TextStyle(
                  //           color: Colors.black,
                  //           fontSize: 15,
                  //           fontWeight: FontWeight.normal),
                  //     ),
                  //     color: Colors.white,
                  //
                  //   ),
                  // ),
                  SizedBox(height: 3.h,),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        loader = true;
                        Guest = 1;
                      });
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => newBar(index: 0,)));
                      setState(() {
                        loader = false;
                      });
                    },

                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      child: loader == true ?  spinkit
                          :
                      Text(Languages.of(context)!.CONTINUE_AS_GUEST,style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15,color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
