// import 'package:af24client/Api/Auth_af24.dart';
// import 'package:af24client/models/globalVariables.dart';
// import 'package:af24client/screens/Home/Home.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
//
// import '../api/auth_api.dart';
// import '../models/ConstFunctions.dart';
// import '../newBar.dart';
//
// class OtpScreen extends StatefulWidget {
//
//   @override
//   _OtpScreenState createState() => _OtpScreenState();
// }
//
// class _OtpScreenState extends State<OtpScreen> {
//   bool isLoading = false;
//   String code1 = "", code2 = "", code3 = "", code4 = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: const Color(0xfff7f6fb),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Icon(
//                       Icons.arrow_back,
//                       size: 3.h,
//                       color: Colors.black54,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 3.h,
//                 ),
//                 Container(
//                   width: 20.h,
//                   height: 20.h,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Image.asset(
//                     'assets/icons/My Page-1.png',
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5.h,
//                 ),
//                 Text(
//                   'Verifcation',
//                   style: TextStyle(
//                     fontSize: 3.h,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'Enter OTP',
//                   style: TextStyle(
//                     fontSize: 2.h,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black38,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 5.h,
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(28),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           _textFieldOtpScreen(
//                               first: true, last: false, index: 1),
//                           _textFieldOtpScreen(
//                               first: false, last: false, index: 2),
//                           _textFieldOtpScreen(
//                               first: false, last: false, index: 3),
//                           _textFieldOtpScreen(
//                               first: false, last: true, index: 4),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 22,
//                       ),
//                       SizedBox(
//                         width: double.infinity,
//                         child: isLoading
//                             ? const Center(child: CircularProgressIndicator())
//                             : ElevatedButton(
//                                 onPressed: () async {
//                                   if (1==1) {
//                                     setState(() {
//                                       isLoading = true;
//                                     });
//                                     final result = await DataApiService.instance
//                                         .EmailVerification();
//                                     setState(() {
//                                       isLoading = false;
//                                     });
//                                     if (result['success']) {
//                                       Get.offAll(() => const home());
//                                       AwesomeDialog(
//                                         context: context,
//                                         dialogType: DialogType.SUCCES,
//                                         animType: AnimType.BOTTOMSLIDE,
//                                         title: 'Success',
//                                         desc: EmailVerficationMessage,
//                                         btnOkOnPress: (){ },
//                                       ).show();
//                                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => newBar(index: 0,)));
//                                   }else {
//                                       AwesomeDialog(
//                                         context: context,
//                                         dialogType: DialogType.ERROR,
//                                         animType: AnimType.BOTTOMSLIDE,
//                                         title: 'Error',
//                                         desc: EmailVerficationMessage,
//                                         btnOkOnPress: (){ },
//                                       ).show();
//                                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => newBar(index: 0,)));
//                                     }
//                                   } else {
//                                     Get.defaultDialog(
//                                         title: "Error",
//                                         middleText: "OTP does not match");
//                                   }
//                                 },
//                                 style: ButtonStyle(
//                                   foregroundColor:
//                                       MaterialStateProperty.all<Color>(
//                                           Colors.white),
//                                   backgroundColor:
//                                       MaterialStateProperty.all<Color>(
//                                           Colors.grey),
//                                   shape: MaterialStateProperty.all<
//                                       RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(24.0),
//                                     ),
//                                   ),
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(14.0),
//                                   child: Text(
//                                     'Verify',
//                                     style: TextStyle(fontSize: 3.h),
//                                   ),
//                                 ),
//                               ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5.h,
//                 ),
//                 Text(
//                   'No OTP',
//                   style: TextStyle(
//                     fontSize: 2.h,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black38,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(
//                   height: 18,
//                 ),
//                 InkWell(
//                   onTap: ()
//                   async {
//                     await DataApiService.instance
//                         .EmailVerification();
//                     GlobalSnackBar.show(context, EmailVerficationMessage!);
//                   },
//
//                   child: Text(
//                     'Resend Code',
//                     style: TextStyle(
//                       fontSize: 2.5.h,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _textFieldOtpScreen({required bool first, last, required int index}) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//         height: 85,
//         child: AspectRatio(
//           aspectRatio: 0.5,
//           child: TextField(
//             autofocus: true,
//             onChanged: (value) {
//               if (value.length == 1 && last == false) {
//                 FocusScope.of(context).nextFocus();
//               }
//               if (value.isEmpty && first == false) {
//                 FocusScope.of(context).previousFocus();
//               }
//               if (index == 1) {
//                 setState(() {
//                   code1 = value;
//                 });
//               } else if (index == 2) {
//                 setState(() {
//                   code2 = value;
//                 });
//               } else if (index == 3) {
//                 setState(() {
//                   code3 = value;
//                 });
//               } else if (index == 4) {
//                 setState(() {
//                   code4 = value;
//                 });
//               }
//             },
//             showCursor: false,
//             readOnly: false,
//             textAlign: TextAlign.center,
//             style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             keyboardType: TextInputType.number,
//             maxLength: 1,
//             decoration: InputDecoration(
//               counter: const Offstage(),
//               enabledBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(width: 2, color: Colors.black12),
//                   borderRadius: BorderRadius.circular(12)),
//               focusedBorder: OutlineInputBorder(
//                   borderSide:
//                       const BorderSide(width: 2, color: Colors.black),
//                   borderRadius: BorderRadius.circular(12)),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
