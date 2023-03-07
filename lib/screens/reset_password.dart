// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:juha_app/screens/login_page.dart';
// import 'package:touch_ripple_effect/touch_ripple_effect.dart';
//
// import '../api/auth_api.dart';
// import '../constants/colors.dart';
// import '../constants/global_variables.dart';
// import '../localization/languages/languages.dart';
//
// class ResetPasswordScreen extends StatefulWidget {
//   const ResetPasswordScreen({Key? key}) : super(key: key);
//
//   @override
//   _ResetPasswordScreenstate createState() => _ResetPasswordScreenstate();
// }
//
// class _ResetPasswordScreenstate extends State<ResetPasswordScreen> {
//   String? code;
//   String pass="pppppppp";
//   String cPass="qqqqqqqq";
//   bool isLoading = false;
//   bool view = true;
//   bool view2 = true;
//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//       ),
//       child: Scaffold(
//         appBar:  AppBar(
//           backgroundColor: AppColors.primary1,
//           elevation: 0,
//           title: Text(Languages.of(context)!.RESET_PASSWORD),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Image.asset(
//                 'assets/images/juha_logo.png',
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 32),
//                 child: TextField(
//                   onChanged: (text) {
//                     setState(() {
//                       code = text;
//                     });
//                   },
//                   keyboardType: TextInputType.emailAddress,
//                   textInputAction: TextInputAction.next,
//                   decoration: InputDecoration(
//                     prefixIconConstraints: const BoxConstraints(
//                         minWidth: 35, maxHeight: 35),
//                     prefixIcon: const Padding(
//                       padding:  EdgeInsetsDirectional.only(
//                           start: 12.0, end: 5.0),
//                       child: Icon(Icons.code,color: AppColors.primary1),
//                     ),
//                     hintText: Languages.of(context)!.VERIFICATION_CODE_HINT,
//                     hintStyle: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: Colors.grey,
//                         width: 0.5,
//                       ),
//                       borderRadius: BorderRadius.circular(100),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(100),
//                     ),
//                     focusedBorder: (OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: Colors.grey,
//                         width: 0.5,
//                       ),
//                       borderRadius: BorderRadius.circular(100),
//                     )),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 32),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     TextFormField(
//                       onChanged: (text) {
//                         setState(() {
//                           pass = text;
//                         });
//                       },
//                       keyboardType: TextInputType.emailAddress,
//                       textInputAction: TextInputAction.next,
//                       obscureText: view,
//                       decoration: InputDecoration(
//                         prefixIconConstraints: const BoxConstraints(
//                             minWidth: 35, maxHeight: 35),
//                         prefixIcon: const Padding(
//                           padding: EdgeInsetsDirectional.only(
//                               start: 12.0, end: 5.0),
//                           child: Icon(Icons.lock, color: AppColors.primary1),
//                         ),
//                         suffixIcon: InkWell(
//                             splashColor: Colors.transparent,
//                             onTap: () {
//                               setState(() {
//                                 view = !view;
//                               });
//                             },
//                             child:
//                             Icon(view ? Icons.visibility : Icons.visibility_off)),
//                         hintText: Languages.of(context)!.NEW_PASS_HINT,
//                         hintStyle: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                             color: Colors.grey,
//                             width: 0.5,
//                           ),
//                           borderRadius: BorderRadius.circular(100),
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(100),
//                         ),
//                         focusedBorder: (OutlineInputBorder(
//                           borderSide: const BorderSide(
//                             color: Colors.grey,
//                             width: 0.5,
//                           ),
//                           borderRadius: BorderRadius.circular(100),
//                         )),
//                       ),
//                     ),
//                     pass.length<8 ? Padding(
//                       padding: const EdgeInsets.only(top: 8,left: 8),
//                       child: Text(Languages.of(context)!.PASSWORD_LENGTH, style: const TextStyle(color: Colors.red)),
//                     )
//                         : const SizedBox.shrink()
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 32),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     TextFormField(
//                       onChanged: (text) {
//                         setState(() {
//                           cPass = text;
//                         });
//                       },
//                       keyboardType: TextInputType.emailAddress,
//                       textInputAction: TextInputAction.next,
//                       obscureText: view2,
//                       decoration: InputDecoration(
//                         suffixIcon: InkWell(
//                             splashColor: Colors.transparent,
//                             onTap: () {
//                               setState(() {
//                                 view2 = !view2;
//                               });
//                             },
//                             child:
//                             Icon(view2 ? Icons.visibility : Icons.visibility_off)),
//                         prefixIconConstraints: const BoxConstraints(
//                             minWidth: 35, maxHeight: 35),
//                         prefixIcon: const Padding(
//                           padding: EdgeInsetsDirectional.only(
//                               start: 12.0, end: 5.0),
//                           child: Icon(Icons.lock, color: AppColors.primary1),
//                         ),
//                         hintText: Languages.of(context)!.CONFIRM_PASS_HINT,
//                         hintStyle: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                             color: Colors.grey,
//                             width: 0.5,
//                           ),
//                           borderRadius: BorderRadius.circular(100),
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(100),
//                         ),
//                         focusedBorder: (OutlineInputBorder(
//                           borderSide: const BorderSide(
//                             color: Colors.grey,
//                             width: 0.5,
//                           ),
//                           borderRadius: BorderRadius.circular(100),
//                         )),
//                       ),
//                     ),
//                     cPass.length<8 ? Padding(
//                       padding: const EdgeInsets.only(top: 8,left: 8),
//                       child: Text(Languages.of(context)!.PASSWORD_LENGTH, style: const TextStyle(color: Colors.red)),
//                     ) : const SizedBox.shrink()
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TouchRippleEffect(
//                 rippleColor: Colors.white60,
//                 onTap: () async {
//                   if(code == VERIFICATION_CODE.value)
//                   {
//                     if(cPass==pass && (cPass.isNotEmpty && pass.isNotEmpty)){
//                       setState(() {
//                         isLoading = true;
//                       });
//                       final result = await AuthApiService.instance.resetPassword(USER_EMAIL.value,VERIFICATION_CODE.value, pass);
//                       setState(() {
//                         isLoading = false;
//                       });
//                       customDialog(context,"", result['message'], ElevatedButton(
//                           onPressed: () {
//                             Get.offAll(() => const LoginPage());
//                           },
//                           child: Text(Languages.of(context)!.LOGIN)));
//                     }
//                     else{
//                       customDialog(context,"", Languages.of(context)!.PASSWORD_MISMATCH, const SizedBox.shrink());
//                     }
//                   }
//                   else{
//                     customDialog(context,"", Languages.of(context)!.CODE_MISMATCH, const SizedBox.shrink());
//                   }
//
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 32),
//                   child: Container(
//                     padding: const EdgeInsets.only(top: 15,bottom: 15),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         color: AppColors.primary1
//                     ),
//                     child: Center(
//                       child: isLoading ? const CircularProgressIndicator() : Text(
//                         Languages.of(context)!.SUBMIT,
//                         style: const TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//             ],
//           ),
//         )
//       ),
//     );
//   }
// }
