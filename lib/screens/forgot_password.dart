//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
// class ForgotPasswordScreen extends StatefulWidget {
//   const ForgotPasswordScreen({Key? key}) : super(key: key);
//
//   @override
//   _ForgotPasswordScreenstate createState() => _ForgotPasswordScreenstate();
// }
//
// class _ForgotPasswordScreenstate extends State<ForgotPasswordScreen> {
//   String? _email;
//   bool isLoading = false;
//   bool _isValid = true;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//       ),
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           elevation: 0,
//           title: Text('Forgot Password'),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Image.asset(
//                 'assets/images/juha_logo.png',
//                 // color: Colors.white,
//               ),
//               Padding(
//                   padding:
//                   const EdgeInsets.symmetric(horizontal: 32),
//                   child: Text(
//                     Languages.of(context)!.FORGOT_PASSWORD+"?",
//                     style: const TextStyle(
//                         fontSize: 19.0,
//                         fontWeight: FontWeight.w700),
//                     textAlign: TextAlign.center,
//                   )),
//               const SizedBox(height: 15),
//               Padding(
//                   padding:
//                   const EdgeInsets.symmetric(horizontal: 32),
//                   child: Text(
//                     Languages.of(context)!.EMAIL_VERIFICATION_TEXT,
//                     style: const TextStyle(
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.w400),
//                     textAlign: TextAlign.center,
//                   )),
//               const SizedBox(height: 30),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 32),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     TextFormField(
//                       onChanged: (text) {
//                         setState(() {
//                           _isValid = EmailValidator.validate(text);
//                           _email = text;
//                         });
//                       },
//                       decoration: InputDecoration(
//                         labelText: Languages.of(context)!.EMAIL_HINT,
//                         labelStyle: const TextStyle(color: Colors.grey)
//                       ),
//                     ),
//                     !_isValid ? Padding(
//                       padding: const EdgeInsets.only(top: 8, bottom: 8),
//                       child: Text(Languages.of(context)!.INVALID_EMAIL, style: const TextStyle(color: Colors.red)),
//                     )
//                         : const SizedBox.shrink()
//                   ],
//                 ),
//
//               ),
//               const SizedBox(height: 20),
//               TouchRippleEffect(
//                 rippleColor: Colors.white60,
//                 onTap: () async {
//                   setState(() {
//                     isLoading = true;
//                     USER_EMAIL.value=_email!;
//                   });
//                   final result = await AuthApiService.instance.forgotPassword(USER_EMAIL.value,false);
//                   setState(() {
//                     isLoading = false;
//                   });
//                   if(result['success'])
//                   {
//                     VERIFICATION_CODE.value=result['code'];
//                     Get.to(()=>const ResetPasswordScreen());
//                     customDialog(context,Languages.of(context)!.VERIFICATION_CODE_SENT, result,ElevatedButton(
//                         onPressed: (){
//                           Navigator.pop(context);
//                         },
//                         child: Text(Languages.of(context)!.OK))
//                     );
//                   }
//                   else{
//                     customDialog(context,"",result['message'], const SizedBox.shrink());
//                   }
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
//                       child: isLoading ? const  CircularProgressIndicator(
//                           valueColor: AlwaysStoppedAnimation<Color>(
//                               AppColors.primary2)) : Text(
//                         Languages.of(context)!.SEND,
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
//             ],
//           ),
//         )
//       ),
//     );
//   }
// }
