import 'package:af24client/Api/Auth_af24.dart';
import 'package:af24client/localization/languages/languages.dart';
import 'package:af24client/Api/globalVariables.dart';
import 'package:af24client/screens/AppLanguageSettings/languageMain.dart';
import 'package:af24client/screens/ForgotPassword/ForgotEmail.dart';
import 'package:af24client/screens/LoginCreateAccount/signUp.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../Provider/NotificationProvider.dart';
import '../../main.dart';
import '../../models/ConstFunctions.dart';
import '../../models/GoogleSignIn.dart';
import '../../newBar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? email, pass;
  bool rememberMe = false;
  var storedCreds;
  List<String> creds = [];
  String? _email;
  String _pass = '';
  bool View = false;
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loader = false;
  bool Screenloader = false;
  bool data = false;
  getStoredCredsList() async {
    storedCreds = await getCredsList();
    setState(() {
      data = true;
    });
    print(storedCreds);
  }

  matchPassword() {
    if (data) {
      if (storedCreds.isNotEmpty) {
        for (int i = 0; i < storedCreds.length; i++) {
          if (storedCreds[i].split(',')[0] == _email) {
            setState(() {
              if(_pass != '')
                {
                  passcontroller.text = _pass;
                }
              else
              {
                passcontroller.text = storedCreds[i].split(',')[1];
              }
            });
          }
        }
      }
    }
  }


  // callApi() async {
  //   setState(() {
  //     loader = true;
  //   });
  //   await DataApiService.instance.getlogintoken();
  //
  //   setState(() {
  //     loader = false;
  //   });
  //
  // }
  final spinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.white,
  );
  final Screenspinkit = SpinKitSpinningLines(
    size: 5.h,
    color: Colors.black,
  );
  @override
  void initState() {
    // TODO: implement initState
    StatusCode = '403';
    GoogleSignUp = false;
    Screenloader = false;
    getStoredCredsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    matchPassword();
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
        body:
        Screenloader == true ? Screenspinkit :
        SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 3.h,
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
              child: Text(Languages.of(context)!.EMAIL,),
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
              child:
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return Languages.of(context)!.REQUIRED;
                  }
                },
                onChanged: (text) {
                  setState(() {
                    _email = text;
                  });
                },
                controller: emailcontroller,
                decoration: InputDecoration(
                    hintText: Languages.of(context)!.SIGNIN_EMAIL_HINT,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 15)),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(3.h, 1.h, 0, 0),
              alignment: Alignment.topLeft,
              child: Text(Languages.of(context)!.PASSWORD,),
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return Languages.of(context)!.REQUIRED;
                  }
                },
                obscureText: !View,
                onChanged: (text) {
                  // setState(() {
                  //   _pass = text;
                  // });
                  _pass = text;
                  print(_pass);
                  print(text);
                },
                enabled: true,
                controller: passcontroller,
                decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: (){
                        setState(() {
                          View = !View;
                        });
                      },
                      child: Icon(
                        View ?
                        Icons.visibility
                        :
                        Icons.visibility_off,
                        size: 20,
                      ),
                    ),
                    hintText: Languages.of(context)!.SIGNIN_PASSWORD_HINT,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 15)),
              ),
            ),
            Container(
              child: ListTileTheme(
                horizontalTitleGap: 0,
                child: CheckboxListTile(
                    checkColor: Colors.white,
                    activeColor: Colors.black,
                    title: Text("Remember Me",style: TextStyle(fontSize: 11.sp),),
                    value: rememberMe,
                    onChanged: (newValue) {
                      setState(() {
                        rememberMe = newValue!;
                        print('Test');
                        print(_pass);
                        setState(() {
                          passcontroller.text = _pass;
                        });
                        print('Test');
                        if (rememberMe) {
                          print('Test1');
                          if (creds.isEmpty) {

                            creds.add(_email! + "," + _pass);
                            creds = creds + storedCreds;
                            print('Text');
                            print(creds);
                          }
                        }
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            // Container(
            //   //color: Colors.red,
            //   width: 88.w,
            //   height: 6.h,
            //
            //   child: FlatButton(
            //       onPressed: () async {
            //         if (_formKey.currentState!.validate()) {
            //           StatusCode = '403';
            //           setState(() {
            //             loader = true;
            //           });
            //           Map<String, dynamic> loginToMap = {
            //             "email": emailcontroller.text,
            //             "password": passcontroller.text,
            //           };
            //           await DataApiService.instance
            //               .getlogintoken(loginToMap, context);
            //           if(LoginSuccess == true )
            //             {
            //               await DataApiService.instance.getSellerInfo();
            //               setState(() {
            //                 Provider.of<MyNotification>(context, listen: false).setNotificationLength(sellerinfo!.notify_count_unseen!);
            //               });
            //               DataApiService.instance.updateFcmToken();
            //               if (rememberMe) {
            //                 saveCredsList(creds);
            //               }
            //             }
            //         //   StatusCode == '200'
            //         //       ? await DataApiService.instance.EmailVerification()
            //         //       :
            //         // Container();
            //           // // await DataApiService.instance.EmailVerification();
            //           // StatusCode == '200'
            //           //     ? await DataApiService.instance.getbrandlist()
            //           //     : Container();
            //           // StatusCode == '200'
            //           //     ? await DataApiService.instance.getTopSellersList()
            //           //     : Container();
            //           // StatusCode == '200'
            //           //     ? await DataApiService.instance.getAllSellersList()
            //           //     : Container();
            //           // StatusCode == '200'
            //           //     ? await DataApiService.instance.getAddressList()
            //           //     : Container();
            //           // StatusCode == '200'
            //           //     ? await DataApiService.instance.getTopRated()
            //           //     : Container();
            //           // StatusCode == '200'
            //           //     ? await DataApiService.instance.getBanners()
            //           //     : Container();
            //           // GlobalSnackBar.show(context, EmailVerficationMessage!);
            //           setState(() {
            //             loader = false;
            //           });
            //           // GlobalSnackBar.show(context, LoginSnackMessage);
            //
            //           LoginStatusCode != '200'
            //               ? AwesomeDialog(
            //                   context: context,
            //                   dialogType: DialogType.ERROR,
            //                   animType: AnimType.BOTTOMSLIDE,
            //                   title: Languages.of(context)!.ERROR,
            //                   desc: Languages.of(context)!.LOGIN_FAILED,
            //                   btnOkOnPress: () {},
            //                 ).show()
            //               :
            //               Guest =0;
            //           LoginSuccess == true ?
            //           Get.offAll(()=>newBar(
            //             index: 0,
            //           ))
            //               :
            //           AwesomeDialog(
            //             context: context,
            //             dialogType: DialogType.ERROR,
            //             animType: AnimType.BOTTOMSLIDE,
            //             title: Languages.of(context)!.ERROR,
            //             desc: LoginSnackMessage,
            //             btnOkOnPress: () {},
            //           ).show();
            //         } else {
            //           StatusCode = '403';
            //         }
            //
            //         // setState(() async {
            //         //   Emaillogin = emailcontroller.text;
            //         //   PassLogin = passcontroller.text;
            //         //   await callApi();
            //         //   GlobalSnackBar.show(context, LoginSnackMessage),
            //       },
            //       child: loader == true
            //           ? spinkit
            //           : Text(
            //           Languages.of(context)!.LOGIN,
            //               style: TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 15,
            //                   fontWeight: FontWeight.normal),
            //             ),
            //       color: Colors.black,
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(6))),
            // ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    // onTap: ()
                    // async {
                    //   await DataApiService.instance.ForgotPassword();
                    //   GlobalSnackBar.show(context, ForgotPasswordMessage!);
                    // },
                    onTap: () {
                      Get.to(()=>ForgotPassword());
                    },
                    child: Container(
                      child: Text(
                          Languages.of(context)!.FORGOTPASSWORD,
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    // onTap: ()
                    // async {
                    //   await DataApiService.instance.ForgotPassword();
                    //   GlobalSnackBar.show(context, ForgotPasswordMessage!);
                    // },
                    onTap: () {
                      Get.to(()=>signup());
                    },
                    child: Container(
                      child: Text(
                        Languages.of(context)!.DONT_HAVE_AN_ACCOUNT,
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            // Container(
            //   //color: Colors.red,
            //   width: 88.w,
            //   height: 6.h,
            //   decoration: BoxDecoration(
            //       border: Border.all(color: Colors.grey.withOpacity(0.2)),
            //       borderRadius: BorderRadius.circular(6)),
            //
            //   child: FlatButton(
            //     onPressed: () {},
            //     child: Padding(
            //       padding: const EdgeInsets.only(left: 60.0),
            //       child: Row(
            //         children: [
            //           Image.asset('assets/images/facebook.png', height: 18),
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Text(
            //               Languages.of(context)!.CONTINUE_WITH_FACEBOOK,
            //               style: TextStyle(
            //                   color: Colors.black.withOpacity(0.5),
            //                   fontSize: 15,
            //                   fontWeight: FontWeight.normal),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     color: Colors.grey.withOpacity(0.01),
            //   ),
            // ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              //color: Colors.red,
              width: 88.w,
              height: 6.h,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(6)),

              // child: FlatButton(
              //   onPressed: () {
              //     googleLogin();
              //     // Provider.of<GoogleAuthenticateProvider>(context, listen: false).signIn(context,false);
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 60.0),
              //     child: Row(
              //       children: [
              //         Image.asset('assets/images/google.png', height: 18),
              //         Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Text(
              //             Languages.of(context)!.CONTINUE_WITH_GOOGLE,
              //             style: TextStyle(
              //                 color: Colors.black.withOpacity(0.5),
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.normal),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              //   color: Colors.grey.withOpacity(0.01),
              // ),
            ),
            SizedBox(
              height: 1.h,
            ),
          ],
        ),
      ),
    ));
    Container();
  }
  googleLogin() async {
    print("googleLogin method Called");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var reslut = await _googleSignIn.signIn();
      if (reslut == null) {
        return;
      }
      final userData = await reslut.authentication;
      setState(() {
        Screenloader = true;
      });
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
      await FirebaseAuth.instance.signInWithCredential(credential);
      print("Result $reslut");
      print(reslut.displayName);
      print(reslut.email);
      print(reslut.photoUrl);
      Map<String, dynamic> signupToMap = {
        "f_name": reslut.displayName.toString().split(" ")[0],
        "l_name": reslut.displayName.toString().split(" ")[1],
        "email": reslut.email,
        "phone": "",
        "password": "5764%CFD@",
        "title": "",
        "d_o_b": "",
        "newsletter": "",
        "country_code": "",
        "country_name": "",
        "social_id": reslut.id,
        "login_medium": "google",
      };
      await DataApiService.instance.getSignUptoken(signupToMap,context);
      setState(() {
        GoogleSignUp = true;
      });
      await DataApiService.instance.getSellerInfo();
      setState(() {
        Provider.of<MyNotification>(context, listen: false).setNotificationLength(sellerinfo!.notify_count_unseen!);
      });
      setUserLoggedIn(true);
      saveUserDataToken(token: Customer_Token.value);
      Get.offAll(() => newBar(index: 0));
      DataApiService.instance.updateFcmToken();
      print("Done");
      print("Done");
      // Get.offAll(const Question1());
    } catch (error) {
      print(error);
    }
  }
}
