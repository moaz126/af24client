import 'package:af24client/models/ConstFunctions.dart';
import 'package:af24client/screens/LoginCreateAccount/login.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Api/Auth_af24.dart';
import '../../localization/languages/languages.dart';
import '../../Api/globalVariables.dart';
import '../../newBar.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final emailcontroller= TextEditingController();
  bool loader = false;
  final spinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.white,
  );

  @override
  void initState() {
    // TODO: implement initState
    StatusCode = '403';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_rounded,color: Colors.black,)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
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
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(3.h, 0, 0, 0),
                alignment: Alignment.topLeft,
                child: Text(Languages.of(context)!.EMAIL),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                width: 88.w,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(6)),
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return Languages.of(context)!.REQUIRED;
                    }
                  },
                  controller: emailcontroller,
                  decoration: InputDecoration(
                      hintText: Languages.of(context)!.EMAIL_ADDRESS,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 15)),
                ),
              ),
              SizedBox(height: 3.h,),
              // Container(
              //   width: 30.w,
              //   height: 6.h,
              //   child: FlatButton(
              //       onPressed: () async {
              //         if (_formKey.currentState!.validate()) {
              //           StatusCode = '403';
              //           setState(() {
              //             loader = true;
              //           });
              //           Map<String, dynamic> ForgotEmailToMap = {
              //             "email": emailcontroller.text,
              //           };
              //           await DataApiService.instance.ForgotPassword(emailcontroller.text);
              //           setState(()  {
              //                 // GlobalSnackBar.show(context, ForgotPasswordMessage!);
              //             loader = false;
              //           });
              //           // GlobalSnackBar.show(context, LoginSnackMessage);
              //           StatusCode != '200' ?
              //           AwesomeDialog(
              //             context: context,
              //             dialogType: DialogType.ERROR,
              //             animType: AnimType.BOTTOMSLIDE,
              //             title: Languages.of(context)!.ERROR,
              //             desc: ForgotPasswordMessage,
              //             btnOkOnPress: (){ },
              //           ).show()
              //               :
              //           AwesomeDialog(
              //             context: context,
              //             dialogType: DialogType.SUCCES,
              //             animType: AnimType.BOTTOMSLIDE,
              //             title: Languages.of(context)!.CHECK_EMAIL,
              //             desc: ForgotPasswordMessage,
              //             btnOkOnPress: (){
              //               Get.to(Login());
              //             },
              //           ).show();
              //         }
              //         else{
              //           StatusCode = '403';
              //         }
              //
              //
              //         // setState(() async {
              //         //   Emaillogin = emailcontroller.text;
              //         //   PassLogin = passcontroller.text;
              //         //   await callApi();
              //         //   GlobalSnackBar.show(context, LoginSnackMessage),
              //       },
              //       child: loader == true ?  spinkit
              //           : Text(
              //         Languages.of(context)!.CONFIRM,
              //         style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 15,
              //             fontWeight: FontWeight.normal),
              //       ),
              //       color: Colors.black,
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(6))),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
