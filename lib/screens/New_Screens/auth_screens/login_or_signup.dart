import 'package:af24client/screens/New_Screens/auth_screens/almost_done_screen.dart';
import 'package:af24client/screens/New_Screens/auth_screens/shipping_country_screen.dart';
import 'package:af24client/screens/New_Screens/home_screen/home_page.dart';
import 'package:af24client/screens/Widgets/dialogbox..dart';
import 'package:af24client/screens/Widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Api/Auth_af24.dart';
import '../../../Api/globalVariables.dart';
import '../../Widgets/common_elevated_button.dart';
import '../../Widgets/common_textfield.dart';
import '../../Widgets/common_widgets.dart';
import '../../Widgets/page_transition.dart';


class Login_SignUp_Screen extends StatefulWidget {
  const Login_SignUp_Screen({Key? key}) : super(key: key);

  @override
  State<Login_SignUp_Screen> createState() => _Login_SignUp_ScreenState();
}

class _Login_SignUp_ScreenState extends State<Login_SignUp_Screen> {
  final TextEditingController FirstNameController = TextEditingController();
  final TextEditingController LastNameController = TextEditingController();
  final TextEditingController EmailAddressSignUpController =
  TextEditingController();
  final TextEditingController EmailAddressLoginController =
  TextEditingController();
  final TextEditingController PasswordSignUpController =
  TextEditingController();
  final TextEditingController PasswordControllerLogin = TextEditingController();
  final TextEditingController ConfirmPasswordSignUpController =
  TextEditingController();
  bool button_loader = false;
  bool SignUp = true;
  bool LogIn = false;
  final _signupformKey = GlobalKey<FormState>();
  final _loginformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                SizedBox(
                  width: 12,
                ),
                Text('Continue with Email',style: TextStyles.TitleTexStyle13(),)
              ],
            ),

            Row(
              children: [
                SizedBox(
                  width: 12,
                ),
                SizedBox(
                  width: 20,
                  child: Divider(
                    thickness: 2,
                    color: Colors.black,

                  ),
                ),
              ],
            ),


            Row(
              children: [
                SizedBox(
                  width: 12,
                ),
                Image.asset('assets/images/loginicon.png',width: 20,),
                SizedBox(
                  width: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: (){
                            setState(() {
                              SignUp = true;
                              LogIn = false;
                            });
                          },
                          child: Text('Sign Up',
                              style:
                              SignUp == true?
                              TextStyles.TitleTexStyle13():
                              TextStyles.TitleTexStyle13().copyWith(
                                  fontWeight: FontWeight.normal
                              )
                          )),
                      SizedBox(width: 10,),
                      InkWell(
                          onTap: (){
                            setState(() {
                              SignUp = false;
                              LogIn = true;

                            });
                            print(SignUp);
                            print(LogIn);

                          },

                          child: Text('Log in',


                              style:
                              LogIn == true ?
                              TextStyles.TitleTexStyle13() :
                              TextStyles.TitleTexStyle13().copyWith(
                                  fontWeight: FontWeight.normal
                              )

                          )),
                    ],
                  ),
                )

              ],
            ),

            SizedBox(
              height: 5,
            ),
            
            Stack(children: [
              SizedBox(
                  height: 5, child: SizedBox(

                  )

              ),
              Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  SignUp == true
                      ? Container(
                    height: 5,
                    width: 30,
                    color: Colors.black,
                  )
                      : Row(
                    children: [
                      SizedBox(
                        width: 60,
                      ),
                      Container(
                        height: 5,
                        width: 25,
                        color: Colors.black,
                      ),
                    ],
                  )
                ],
              ),
            ]),

            Column(
              children: [

                SignUp == true
                    ? Form(
                  key: _signupformKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          controller: FirstNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Name";
                            } else {
                              return null;
                            }
                          },
                          cursorColor: Colors.black,
                          decoration:
                          InputDecorations.inputDecorationNoBorder(
                              labelText: "First Name*",
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          controller: LastNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Name";
                            } else {
                              return null;
                            }
                          },
                          cursorColor: Colors.black,
                          decoration:
                          InputDecorations.inputDecorationNoBorder(
                              labelText: "Last Name*"),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          controller: EmailAddressSignUpController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Email";
                            } else {
                              return null;
                            }
                          },
                          cursorColor: Colors.black,
                          decoration:
                          InputDecorations.inputDecorationNoBorder(
                              labelText: "Email Address*"),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          controller: PasswordSignUpController,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 8) {
                              return "Please Enter valid Password";
                            } else {
                              return null;
                            }
                          },
                          cursorColor: Colors.black,
                          decoration:
                          InputDecorations.inputDecorationNoBorder(
                              labelText: "Create Password*"),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                            controller: ConfirmPasswordSignUpController,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return "Please Enter valid Password";
                              } else {
                                return null;
                              }
                            },
                            cursorColor: Colors.black,
                            decoration:
                            InputDecorations.inputDecorationNoBorder(
                                labelText: "Confirm Password*")),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            'assets/images/passwordinfo.png',
                            height: 18,
                            width: 18,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                              'Password needs to be at least 8 characters.',style: TextStyles.TitleTexStyle12().copyWith(
                            fontWeight: FontWeight.normal
                          ),),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      button_loader
                          ? buttonLoader
                          : CommonElevatedButtonBlack(
                          title: 'Register',
                          onClicked: () async {
                            if (_signupformKey.currentState!
                                .validate()) {
                              print(PasswordSignUpController.text);
                              print(ConfirmPasswordSignUpController
                                  .text);
                              if (PasswordSignUpController.text ==
                                  ConfirmPasswordSignUpController
                                      .text) {
                                Map<String, dynamic> body = {
                                  'f_name': FirstNameController.text,
                                  'l_name': LastNameController.text,
                                  'email':
                                  EmailAddressSignUpController
                                      .text,
                                  'password':
                                  PasswordSignUpController.text
                                };
                                setState(() {
                                  button_loader = true;
                                });

                                bool status = await DataApiService
                                    .instance
                                    .getSignUptoken(body, context);
                                setState(() {
                                  button_loader = false;
                                });
                                if (status) {
                                  Fluttertoast.showToast(
                                      msg: SnackMessage,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  setState(() {
                                    // SignUp = false;
                                    // LogIn = true;
                                    PageTransition.fadeInNavigation(
                                        page: AlmostDoneScreen(
                                        ));
                                  });
                                } else {
                                  dialogController.showDefaultDialog(
                                    title: "Signup",
                                    message: SnackMessage,
                                    buttonText: 'Ok',
                                    onClick: () {
                                      Get.back();
                                    },
                                  );
                                }
                              } else {
                                dialogController.showDefaultDialog(
                                  title: "Signup",
                                  message: "Passowrd not matched",
                                  buttonText: 'Ok',
                                  onClick: () {
                                    Get.back();
                                  },
                                );
                              }
                            }
                          })
                    ],
                  ),
                )
                    : Form(
                  key: _loginformKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          controller: EmailAddressLoginController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Email";
                            } else {
                              return null;
                            }
                          },
                          cursorColor: Colors.black,
                          decoration:
                          InputDecorations.inputDecorationNoBorder(
                              labelText: "Email Address"),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          controller: PasswordControllerLogin,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 8) {
                              return "Please Enter valid Password";
                            } else {
                              return null;
                            }
                          },
                          cursorColor: Colors.black,
                          decoration:
                          InputDecorations.inputDecorationNoBorder(
                              labelText: "Create Password"),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Forgot password?'),
                      SizedBox(
                        height: 15,
                      ),
                      // Text('Or'),

                      SizedBox(
                        height: 50,
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: button_loader
                              ? buttonLoader
                              : CommonElevatedButtonBlack(
                              title: 'Login',
                              onClicked: () async {
                                if (_loginformKey.currentState!
                                    .validate()) {
                                  Map<String, dynamic> body = {
                                    'email':
                                    EmailAddressLoginController
                                        .text,
                                    'password':
                                    PasswordControllerLogin.text
                                  };
                                  setState(() {
                                    button_loader = true;
                                  });
                                  bool status = await DataApiService
                                      .instance
                                      .getlogintoken(body, context);
                                  setState(() {
                                    button_loader = false;
                                  });
                                  if (status) {
                                    PageTransition.fadeInNavigation(
                                        page: HomePage());
                                  } else {
                                    if (tempToken == '') {
                                      dialogController
                                          .showDefaultDialog(
                                        title: 'Login',
                                        message: SnackMessage,
                                        buttonText: "ok",
                                        onClick: () {
                                          Get.back();
                                        },
                                      );
                                    } else {
                                      dialogController
                                          .showDefaultDialog(
                                        title: 'Login',
                                        message: SnackMessage,
                                        buttonText: "Re-send email",
                                        onClick: () {
                                          Map<String, dynamic> send =
                                          {
                                            'email':
                                            EmailAddressLoginController
                                                .text,
                                            'temporary_token':
                                            tempToken
                                          };
                                          DataApiService.instance
                                              .EmailVerification(
                                              send);

                                          Get.back();
                                        },
                                      );
                                    }
                                  }
                                }

                                // Get.to(()=>HomePage());
                              }))
                    ],
                  ),
                )
              ],
            ),


          ],
        ),
      )
    );
  }
}
