import 'package:af24client/screens/AppLanguageSettings/languageMain.dart';
import 'package:af24client/screens/Terms&Conditions/Terms&Conditions.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:country_pickers/country.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

import '../../Api/Auth_af24.dart';
import '../../localization/languages/languages.dart';
import '../../models/ConstFunctions.dart';
import '../../Api/globalVariables.dart';
import 'login.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);


  @override
  _signupState createState() => _signupState();
}
class _signupState extends State<signup> {
  String initialCountry = 'NG';
  String CountryName = '';
  String CountryCode = '';
  PhoneNumber number = PhoneNumber(isoCode: 'PK');
  String _errorMessage = '';
  bool ViewPassword = false;
  bool ViewConfirmPassword = false;
  int val = -1;
  bool _value = false;
  String gender='' ;
  String? TaC ;
  final _formKey = GlobalKey<FormState>();
  final FNameController = TextEditingController();
  final LNameController = TextEditingController();
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  final ConfirmPasswordController = TextEditingController();
  final PhoneController = TextEditingController();
  final TitleController = TextEditingController();
  final DOBController = TextEditingController();
  final NewsLetterController = TextEditingController();
  DateTime _selectedDate=DateTime.now();
  TextEditingController _textEditingController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool loader = false;
  // callApi() async {
  //   setState(() {
  //     loader = true;
  //   });
  //   await DataApiService.instance.getSignUptoken();
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


@override
  void initState() {
    // TODO: implement initState
  StatusCode = '403';
  TermConditions = '';
    super.initState();
  }

  String dropdownvalue = '0300';
  var items = [
    '0300',
    '0301',
    '0302',
    '0303',
    '0304',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              width: MediaQuery.of(context).size.width,
              height: 9.h,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/icons/Seller app icon (11).png',
                      height: 4.5.h,
                      color: Colors.white,
                    ),
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                        child: Icon(Icons.arrow_back_rounded,color: Colors.white,)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                        height: 3.h,
                      ),
                        Container(
                          margin: EdgeInsets.fromLTRB(3.h, 2.h, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            Languages.of(context)!.FIRST_NAME + " *",
                            style:
                            TextStyle(color: Colors.black.withOpacity(0.7)),
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          width: 88.w,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(6)),
                          child: TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return Languages.of(context)!.REQUIRED;
                              }
                            },
                            controller: FNameController,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: Languages.of(context)!.FIRST_NAME,
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(3.h, 2.h, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            Languages.of(context)!.LAST_NAME + " *",
                            style:
                            TextStyle(color: Colors.black.withOpacity(0.7)),
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          width: 88.w,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(6)),
                          child: TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return Languages.of(context)!.REQUIRED;
                              }
                            },
                            controller: LNameController,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: Languages.of(context)!.LAST_NAME,
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(3.h, 2.h, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            Languages.of(context)!.USERNAME + " *",
                            style:
                            TextStyle(color: Colors.black.withOpacity(0.7)),
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          width: 88.w,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(6)),
                          child: TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return Languages.of(context)!.REQUIRED;
                              }
                            },
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: Languages.of(context)!.USERNAME,
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(3.h, 2.h, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            Languages.of(context)!.EMAIL + " *",
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.7)),
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          width: 88.w,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(6)),
                          child: TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return Languages.of(context)!.REQUIRED;
                              }
                            },
                            controller: EmailController,
                            decoration: InputDecoration(
                                hintText: Languages.of(context)!.EMAIL,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(3.h, 2.h, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            Languages.of(context)!.PASSWORD + " *",
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.7)),
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          width: 88.w,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(6)),
                          child: TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return Languages.of(context)!.REQUIRED;
                              }
                            },
                            controller: PasswordController,
                            obscureText: !ViewPassword,
                            decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  onTap: (){
                                    setState(() {
                                      ViewPassword = !ViewPassword;
                                    });
                                  },
                                  child: Icon(
                                    ViewPassword ?
                                    Icons.visibility
                                        :
                                    Icons.visibility_off,
                                    size: 20,
                                  ),
                                ),
                                hintText: Languages.of(context)!.PASSWORD,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 5, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            Languages.of(context)!.SIGNUP_PASSWORD_EXTRA,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.withOpacity(0.9)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(3.h, 2.h, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            Languages.of(context)!.CONFIRM_PASSWORD + " *",
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.7)),
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          width: 88.w,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(6)),
                          child: TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return Languages.of(context)!.REQUIRED;
                              }
                            },
                            controller: ConfirmPasswordController,
                            obscureText: !ViewConfirmPassword,
                            decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  onTap: (){
                                    setState(() {
                                      ViewConfirmPassword = !ViewConfirmPassword;
                                    });
                                  },
                                  child: Icon(
                                    ViewConfirmPassword ?
                                    Icons.visibility
                                        :
                                    Icons.visibility_off,
                                    size: 20,
                                  ),
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: Languages.of(context)!.CONFIRM_PASSWORD,
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(3.h, 2.h, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            Languages.of(context)!.TITLE,
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.7)),
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Transform.scale(
                                    alignment: AlignmentDirectional.centerEnd,
                                      scale: 0.7,
                                      child:Radio(
                                        value: 'Female',
                                        groupValue: gender,
                                        onChanged: (value) {
                                          setState(() { gender = value.toString(); });
                                        },
                                      ),),
                                  Text(
                                    textAlign: TextAlign.left,
                                    Languages.of(context)!.TITLE_MS,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7)),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Row(
                                children: [
                                  Transform.scale(
                                    alignment: AlignmentDirectional.centerEnd,
                                    scale: 0.7,
                                    child: Radio(
                                      value: 'Male',
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() { gender = value.toString(); });
                                      },                                  ),
                                  ),
                                  Text(
                                    textAlign: TextAlign.left,
                                    Languages.of(context)!.TITLE_MR,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7)),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Row(
                                children: [
                                  Transform.scale(
                                    alignment: AlignmentDirectional.centerEnd,
                                    scale: 0.7,
                                    child: Radio(
                                      value: 'Other',
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() { gender = value.toString(); });
                                      },                                  ),
                                  ),
                                  Text(
                                    textAlign: TextAlign.left,
                                    "Other",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(3.h, 2.h, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            Languages.of(context)!.BIRTHDAY,
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.7)),
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          width: 88.w,
                          height: 7.2.h,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(6)),
                          child: InkWell(
                            onTap: (){
                              _selectDate(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${selectedDate.toLocal()}".split(' ')[0] ,style: TextStyle(fontSize: 2.h),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(Icons.calendar_today_rounded,color:Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),


                        Container(
                          margin: EdgeInsets.fromLTRB(3.h, 2.h, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            Languages.of(context)!.MOBILE_NUMBER,
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.7)),
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Row(
                          children: [
                            // Container(
                            //   decoration: BoxDecoration(
                            //       border: Border.all(
                            //           color: Colors.grey.withOpacity(0.2)),
                            //       borderRadius: BorderRadius.circular(6)),
                            //   margin: EdgeInsets.fromLTRB(3.h, 0.h, 0, 0),
                            //   child: DropdownButton(
                            //
                            //     underline: Container(),
                            //     value: dropdownvalue,
                            //     icon: Padding(
                            //       padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            //       child: Icon(Icons.keyboard_arrow_down),
                            //     ),
                            //     items: items.map((String items) {
                            //       return DropdownMenuItem(
                            //         value: items,
                            //         child: Padding(
                            //           padding:
                            //               const EdgeInsets.fromLTRB(2, 10, 0, 10),
                            //           child: Text(
                            //             items,
                            //             style: TextStyle(fontSize: 15),
                            //           ),
                            //         ),
                            //       );
                            //     }).toList(),
                            //     onChanged: (String? newValue) {
                            //       setState(() {
                            //         dropdownvalue = newValue!;
                            //       });
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                              width: 88.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.2)),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Column(
                                children: <Widget>[
                                  InternationalPhoneNumberInput(
                                    onInputChanged: (PhoneNumber number) {
                                      print('jhgbubyu');
                                      CountryCode = number.dialCode!;
                                      CountryName = number.isoCode!;
                                      print(number.dialCode);
                                      print(PhoneController.text);
                                    },
                                    onInputValidated: (bool value) {
                                      print(value);
                                    },
                                    selectorConfig: SelectorConfig(
                                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                    ),
                                    ignoreBlank: false,
                                    searchBoxDecoration: InputDecoration(hintText: "   Search by name or country code",hintStyle: TextStyle(color: Colors.black.withOpacity(0.7))),
                                    autoValidateMode: AutovalidateMode.disabled,
                                    selectorTextStyle: TextStyle(color: Colors.black),
                                    initialValue: number,
                                    textFieldController: PhoneController,
                                    formatInput: false,
                                    spaceBetweenSelectorAndTextField: 0,
                                    maxLength: 13,
                                    inputDecoration: InputDecoration(fillColor: Colors.grey,border: InputBorder.none),
                                    keyboardType:
                                    TextInputType.numberWithOptions(signed: true, decimal: true),
                                    inputBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)
                                    ),
                                    onSaved: (PhoneNumber number) {
                                      print('On Saved: $number');
                                    },
                                  ),
                                  // ElevatedButton(
                                  //   onPressed: () {
                                  //     _formKey.currentState!.validate();
                                  //   },
                                  //   child: Text('Validate'),
                                  // ),
                                ],
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                            //   width: 88.w,
                            //   decoration: BoxDecoration(
                            //       border: Border.all(
                            //           color: Colors.grey.withOpacity(0.2)),
                            //       borderRadius: BorderRadius.circular(6)),
                            //   child: TextFormField(
                            //     validator: (value){
                            //       if(value!.isEmpty){
                            //         return "This field is required";
                            //       }
                            //     },
                            //     inputFormatters: <TextInputFormatter>[
                            //       FilteringTextInputFormatter
                            //           .digitsOnly,
                            //       LengthLimitingTextInputFormatter(11)
                            //     ],
                            //     keyboardType:
                            //     TextInputType.number,
                            //     controller: PhoneController,
                            //     decoration: InputDecoration(
                            //         hintText: "Number",
                            //         enabledBorder: InputBorder.none,
                            //         focusedBorder: InputBorder.none,
                            //         border: InputBorder.none,
                            //         hintStyle: TextStyle(fontSize: 15)),
                            //   ),
                            // ),
                          ],
                        ),
                        /*  Padding(
                          padding: const EdgeInsets.fromLTRB(21, 5, 0, 0),
                          child: Text(
                            "This number will be used to contact you in case of a problem with your order",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.withOpacity(0.9)),
                          ),
                        ), */

                        Container(
                          width: 96.w,
                          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            Languages.of(context)!.MOBILE_NUMBER_EXTRA,
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.withOpacity(1)),
                          ),
                        ),
                        // Container(
                        //   width: 96.w,
                        //   padding: EdgeInsets.fromLTRB(15, 2.h, 0, 0),
                        //   alignment: Alignment.topLeft,
                        //   child: Text(
                        //     "Receive our Newsletter",
                        //     style: TextStyle(
                        //         fontSize: 17,
                        //         color: Colors.black.withOpacity(0.5)),
                        //   ),
                        // ),
                        // Container(
                        //   width: 96.w,
                        //   padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                        //   alignment: Alignment.topLeft,
                        //   child: Text(
                        //     "Discover our latest collections, news and inspirations before anyone else.",
                        //     style: TextStyle(
                        //         fontSize: 12,
                        //         color: Colors.grey.withOpacity(0.9)),
                        //   ),
                        // ),
                        // Row(
                        //   children: [
                        //     Container(
                        //       padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        //       child: Row(
                        //         children: [
                        //           Transform.scale(
                        //               scale: 0.7,
                        //               child: Radio(
                        //                 value: '1',
                        //                 groupValue: NewsLetter,
                        //                 onChanged: (value) {
                        //                   setState(() {
                        //                     NewsLetter = value.toString();});
                        //                 },  ),
                        //           ),
                        //           Text(
                        //             "Yes.",
                        //             style: TextStyle(
                        //                 color: Colors.black.withOpacity(0.7)),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //     Container(
                        //       padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        //       child: Row(
                        //         children: [
                        //           Transform.scale(
                        //             scale: 0.7,
                        //             child: Radio(
                        //               value: '0',
                        //               groupValue: NewsLetter,
                        //               onChanged: (value) {
                        //                 setState(() { NewsLetter = value.toString(); });
                        //               },
                        //             ),
                        //           ),
                        //           Text(
                        //             "No",
                        //             style: TextStyle(
                        //                 color: Colors.black.withOpacity(0.7)),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Row(
                            children: [
                              Transform.scale(
                                alignment: AlignmentDirectional.centerEnd,
                                  scale: 0.7,
                                  child: Radio(
                                    value: 'Yes',
                                    groupValue: TaC,
                                    onChanged: (value) {
                                      setState(() { TaC = value.toString();
                                        TermConditions = '1';
                                      });
                                    },
                                  ),
                                  ),
                              Container(
                                width: 80.w,
                                child: RichText(
                                  text: TextSpan(
                                      text: Languages.of(context)!.TERMS,
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black.withOpacity(0.7)),
                                      children: <TextSpan>[
                                        TextSpan(text: Languages.of(context)!.TERMS_CONDITION,
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold,
                                                color: HexColor('#2f84ea'),),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Get.to(()=>TermsConditionsScreen());
                                              }
                                        )
                                      ]
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Stack(
                          children: [
                            Container(
                              //color: Colors.red,
                              width: 88.w,
                              height: 6.h,
                              // child: FlatButton(
                              //     onPressed: (
                              //         ) async {
                              //       if (_formKey.currentState!.validate()) {
                              //         if(ConfirmPasswordController.text != PasswordController.text)
                              //           {
                              //             AwesomeDialog(
                              //               context: context,
                              //               dialogType: DialogType.ERROR,
                              //               animType: AnimType.BOTTOMSLIDE,
                              //               title: Languages.of(context)!.ERROR,
                              //               desc: Languages.of(context)!.CONFIRM_PASSWORD_MATCH,
                              //               btnOkOnPress: () {
                              //               },
                              //             ).show();
                              //           }
                              //         else if(PasswordController.text.length<8)
                              //           {
                              //             AwesomeDialog(
                              //               context: context,
                              //               dialogType: DialogType.ERROR,
                              //               animType: AnimType.BOTTOMSLIDE,
                              //               title: Languages.of(context)!.ERROR,
                              //               desc: Languages.of(context)!.PASSWORD_CONDITION,
                              //               btnOkOnPress: () {
                              //               },
                              //             ).show();
                              //           }
                              //         else if(selectedDate.toString().substring(0,10) == DateTime.now().toString().substring(0,10))
                              //           {
                              //             AwesomeDialog(
                              //               context: context,
                              //               dialogType: DialogType.ERROR,
                              //               animType: AnimType.BOTTOMSLIDE,
                              //               title:Languages.of(context)!.ERROR,
                              //               desc: Languages.of(context)!.DOB_CONDITION,
                              //               btnOkOnPress: () {
                              //               },
                              //             ).show();
                              //           }
                              //         else if(!EmailValidator.validate(EmailController.text))
                              //         {
                              //           AwesomeDialog(
                              //             context: context,
                              //             dialogType: DialogType.ERROR,
                              //             animType: AnimType.BOTTOMSLIDE,
                              //             title: Languages.of(context)!.ERROR,
                              //             desc: Languages.of(context)!.EMAIL_CONDITION,
                              //             btnOkOnPress: () {
                              //             },
                              //           ).show();
                              //         }
                              //         else if(PhoneController.text.length<4)
                              //         {
                              //           AwesomeDialog(
                              //             context: context,
                              //             dialogType: DialogType.ERROR,
                              //             animType: AnimType.BOTTOMSLIDE,
                              //             title: Languages.of(context)!.ERROR,
                              //             desc: Languages.of(context)!.MOBILE_CONDITION,
                              //             btnOkOnPress: () {
                              //             },
                              //           ).show();
                              //         }
                              //         else if(TermConditions == '')
                              //         {
                              //           AwesomeDialog(
                              //             context: context,
                              //             dialogType: DialogType.ERROR,
                              //             animType: AnimType.BOTTOMSLIDE,
                              //             title: Languages.of(context)!.ERROR,
                              //             desc: Languages.of(context)!.TERMS_CONDITION,
                              //             btnOkOnPress: () {
                              //             },
                              //           ).show();
                              //         }
                              //         else if(CountryCode == null || CountryCode == '' || CountryName == '' || CountryName == null)
                              //         {
                              //           AwesomeDialog(
                              //             context: context,
                              //             dialogType: DialogType.ERROR,
                              //             animType: AnimType.BOTTOMSLIDE,
                              //             title: Languages.of(context)!.ERROR,
                              //             desc: Languages.of(context)!.COUNTRY_CONDITION,
                              //             btnOkOnPress: () {
                              //             },
                              //           ).show();
                              //         }
                              //         else
                              //         {
                              //         setState(() {
                              //           loader = true;
                              //         });
                              //         print(CountryCode);
                              //         print(CountryCode);
                              //         print(CountryName);
                              //         print(CountryName);
                              //         Map<String, dynamic> signupToMap = {
                              //           "f_name": FNameController.text,
                              //           "l_name": LNameController.text,
                              //           "email": EmailController.text,
                              //           "phone": PhoneController.text,
                              //           "password": PasswordController.text,
                              //           "title": gender,
                              //           "d_o_b": selectedDate.toString(),
                              //           "newsletter": TermConditions,
                              //           "country_code": CountryCode,
                              //           "country_name": CountryName,
                              //           "login_medium": "app",
                              //         };
                              //         await DataApiService.instance
                              //             .getSignUptoken(signupToMap, context);
                              //         setState(() {
                              //           loader = false;
                              //         });
                              //         // GlobalSnackBar.show(context, SnackMessage);
                              //
                              //         // setState(() async {
                              //         //   FName = FNameController.text;
                              //         //   LName=LNameController.text;
                              //         //   Email=EmailController.text;
                              //         //   Phone = dropdownvalue+PhoneController.text;
                              //         //   Password=PasswordController.text;
                              //         //   // title = gender;
                              //         //   //await DataApiService.instance.getSignUptoken();
                              //         //   await callApi();
                              //         //   GlobalSnackBar.show(context, SnackMessage);
                              //         // });
                              //         StatusCode == '200'
                              //             ? AwesomeDialog(
                              //                 context: context,
                              //                 dialogType: DialogType.SUCCES,
                              //                 animType: AnimType.BOTTOMSLIDE,
                              //                 title: Languages.of(context)!.SUCCESS,
                              //                 desc: SnackMessage,
                              //                 btnOkOnPress: () {
                              //                   Get.off(Login());
                              //                 },
                              //               ).show()
                              //             : AwesomeDialog(
                              //                 context: context,
                              //                 dialogType: DialogType.ERROR,
                              //                 animType: AnimType.BOTTOMSLIDE,
                              //                 title: Languages.of(context)!.ERROR,
                              //                 desc: SnackMessage,
                              //                 btnOkOnPress: () {},
                              //               ).show();
                              //       }
                              //     }
                              //     },
                              //     child:
                              //     loader == true ? spinkit
                              //         :Text(
                              //       Languages.of(context)!.REGISTER,
                              //       style: TextStyle(
                              //           color: Colors.white,
                              //           fontSize: 15,
                              //           fontWeight: FontWeight.normal),
                              //     ),
                              //     color: Colors.black,
                              //     shape: RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(6))),
                            ),
                ]

                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(22, 30, 0, 0),
                          child: Row(
                            children: [
                              Text(
                                "⚈",
                                style: TextStyle(
                                    fontSize: 7,
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                              SizedBox(
                                width: 2.h,
                              ),
                              InkWell(
                                onTap: (){
                                  Get.back();
                                },
                                child: Text(
                                  Languages.of(context)!.BACK_TO_LOGIN,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(22, 5, 0, 0),
                          child: Row(
                            children: [
                              Text(
                                "*",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 2.h,
                              ),
                              Text(
                                Languages.of(context)!.REQUIRED_FIELDS,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1940, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      if(picked.isBefore(selectedDate))
      {
        setState(() {
          selectedDate = picked;
          DOB = picked.toString();
        });
      }
      else{
       GlobalSnackBar.show(context, 'Invalid date');
      }
  }


  void validateEmail(String val) {
    if(val.isEmpty){
      setState(() {
        _errorMessage = "Email can not be empty";
      });
    }else if(!EmailValidator.validate(val, true)){
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    }else{
      setState(() {

        _errorMessage = "";
      });
    }
  }

}
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}



