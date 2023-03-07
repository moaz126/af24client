import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Api/Auth_af24.dart';
import '../../Provider/NotificationProvider.dart';
import '../../localization/languages/languages.dart';
import '../../Api/globalVariables.dart';
import '../../newBar.dart';

class EditCustomerInfoScreen extends StatefulWidget {
  const EditCustomerInfoScreen({Key? key}) : super(key: key);

  @override
  State<EditCustomerInfoScreen> createState() => _EditCustomerInfoScreenState();
}

class _EditCustomerInfoScreenState extends State<EditCustomerInfoScreen> {
  String initialCountry = 'NG';
  String CountryName = '';
  String CountryCode = '';
  PhoneNumber number = PhoneNumber(isoCode: 'PK');
  File? file;
  String imagepath = '';
  final _formKey = GlobalKey<FormState>();
  final FNamecontroller = TextEditingController();
  final LNamecontroller = TextEditingController();
  final Phonecontroller = TextEditingController();
  bool loader = false;
  final spinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.white,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      if(GoogleSignUp == true)
        {
          initialCountry = 'NG';
        }
      else
      {
        if (sellerinfo!.country_name! == null) {
          initialCountry = 'NG';
        } else {
          number = PhoneNumber(isoCode: sellerinfo!.country_name!);
          initialCountry = sellerinfo!.country_name!;
          CountryCode = sellerinfo!.country_code!;
          CountryName = sellerinfo!.country_name!;
        }
        FNamecontroller.text = sellerinfo!.fName!;
        LNamecontroller.text = sellerinfo!.lName!;
        Phonecontroller.text = sellerinfo!.phone!;
      }
    });
  }
  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
    await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });

  @override
  void dispose() {
    Phonecontroller.dispose();
    super.dispose();
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Text(
            Languages.of(context)!.EDIT_CUSTOMER_INFO,
            style: TextStyle(color: Colors.black, fontSize: 20.sp),
          ),
        ),
        leading: InkWell(
            onTap: Get.back,
            child: Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  // ClipOval(
                  //   child:
                  //   CachedNetworkImage(
                  //     imageUrl:
                  //     'https://becknowledge.com/af24/public/storage/storage/seller/${sellerinfo!.image}',
                  //     fit: BoxFit.fill,
                  //     placeholder: (context, url) =>
                  //         Image.asset(
                  //           'assets/icons/Seller app icon (8).png',
                  //           height: 20.h,
                  //           width: 20.h,
                  //         ),
                  //     errorWidget:
                  //         (context, url, error) =>
                  //         Image.asset(
                  //           'assets/icons/Seller app icon (8).png',
                  //           height: 20.h,
                  //           width: 20.h,
                  //         ),
                  //   ),
                  // ),
                  file == null ?
                      sellerinfo!.image == null || sellerinfo!.image == '' || sellerinfo!.image == 'def.png' ?
              ClipOval(
              child:
              Image.asset("assets/icons/guest.png",height: 15.h,width: 15.h,fit: BoxFit.fill))
                      :
                      ClipOval(
                          child:
                          CachedNetworkImage(
                      height: 15.h,
                      width: 15.h,
                            imageUrl:
                            "https://becknowledge.com/af24/public/storage/profile/"+sellerinfo!.image.toString(),
                            fit: BoxFit.fill,
                            placeholder: (context, url) =>
                                shimmerCategoryLoader(),
                            errorWidget:
                                (context, url, error) =>
                                Image.asset(
                                  height: 15.h,
                                  width: 15.h,
                                  'assets/images/NoPic.jpg',
                                ),
                          ),
                      )
                          //Image.network("https://becknowledge.com/af24/public/storage/profile/"+sellerinfo!.image.toString(),height: 15.h,width: 15.h,fit: BoxFit.fill))
                      :
                  ClipOval(
                    child:
                    Image.file(file!,height: 15.h,width: 15.h,fit: BoxFit.fill,),
                  ),
                  InkWell(
                    onTap: (){
                      selectFile();
                    },
                    child: ClipOval(
                      child: Container(
                        height: 3.h,
                        width: 3.h,
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent
                        ),
                        child: Icon(Icons.edit_note_rounded,color: Colors.white,size: 2.5.h,),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Expanded(
                child: Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.h),
                        topRight: Radius.circular(5.h)),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 50.0, bottom: 20.0, right: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                            width: 70.w,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.2)),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              controller: FNamecontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return Languages.of(context)!.REQUIRED;
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: sellerinfo!.fName == null || sellerinfo!.fName == '' ? "First Name" : sellerinfo!.fName,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(fontSize: 15)),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                            width: 70.w,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.2)),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              controller: LNamecontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return Languages.of(context)!.REQUIRED;
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: sellerinfo!.lName == null || sellerinfo!.lName == '' ? "Last Name" : sellerinfo!.lName,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(fontSize: 15)),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                            width: 70.w,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.2)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: <Widget>[
                                InternationalPhoneNumberInput(
                                  onInputChanged: (PhoneNumber number) {
                                    CountryCode = number.dialCode!;
                                    CountryName = number.isoCode!;
                                    print('jhgbubyu');
                                    print(number.isoCode);
                                    print(Phonecontroller.text);
                                  },
                                  onInputValidated: (bool value) {
                                    print(value);
                                  },
                                  selectorConfig: SelectorConfig(
                                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                  ),
                                  ignoreBlank: false,
                                  autoValidateMode: AutovalidateMode.disabled,
                                  selectorTextStyle: TextStyle(color: Colors.black),
                                  searchBoxDecoration: InputDecoration(hintText: "   Search by name or country code",hintStyle: TextStyle(color: Colors.black.withOpacity(0.7))),
                                  initialValue: number,
                                  textFieldController: Phonecontroller,
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

                          SizedBox(
                            height: 3.h,
                          ),
                          // Container(
                          //   //color: Colors.red,
                          //   width: 30.w,
                          //   height: 6.h,
                          //
                          //   child: FlatButton(
                          //       onPressed: () async {
                          //         if (_formKey.currentState!.validate()) {
                          //           if(Phonecontroller.text.length < 4)
                          //             {
                          //               AwesomeDialog(
                          //                 context: context,
                          //                 dialogType: DialogType.ERROR,
                          //                 animType: AnimType.BOTTOMSLIDE,
                          //                 title: Languages.of(context)!.ERROR,
                          //                 desc: Languages.of(context)!.PHONE_LENGTH,
                          //                 btnOkOnPress: () {},
                          //               ).show();
                          //             }
                          //           else if(CountryCode == null || CountryCode == '' || CountryName == null || CountryCode == '')
                          //             {
                          //               AwesomeDialog(
                          //                 context: context,
                          //                 dialogType: DialogType.ERROR,
                          //                 animType: AnimType.BOTTOMSLIDE,
                          //                 title: Languages.of(context)!.ERROR,
                          //                 desc: Languages.of(context)!.SELECT_COUNTRY_FIRST,
                          //                 btnOkOnPress: () {},
                          //               ).show();
                          //             }
                          //           else
                          //           {
                          //             setState(() {
                          //               loader = true;
                          //             });
                          //             Map<String, dynamic> Updateinfo = {
                          //               "f_name": FNamecontroller.text,
                          //               "l_name": LNamecontroller.text,
                          //               "phone": Phonecontroller.text,
                          //             };
                          //             await DataApiService.instance
                          //                 .UpdateCustomerInfo(
                          //                     FNamecontroller.text,
                          //                     LNamecontroller.text,
                          //                     Phonecontroller.text,
                          //                     imagepath,
                          //               CountryCode,
                          //               CountryName,
                          //
                          //             );
                          //             DataApiService.instance.getSellerInfo();
                          //             // GlobalSnackBar.show(context, EmailVerficationMessage!);
                          //             setState(() {
                          //               loader = false;
                          //             });
                          //             // GlobalSnackBar.show(context, LoginSnackMessage);
                          //             EditProfileStatusCode != '200'
                          //                 ? AwesomeDialog(
                          //                     context: context,
                          //                     dialogType: DialogType.ERROR,
                          //                     animType: AnimType.BOTTOMSLIDE,
                          //                     title: Languages.of(context)!.ERROR,
                          //                     desc: Languages.of(context)!.ERROR,
                          //                     btnOkOnPress: () {},
                          //                   ).show()
                          //                 : AwesomeDialog(
                          //                     context: context,
                          //                     dialogType: DialogType.SUCCES,
                          //                     animType: AnimType.BOTTOMSLIDE,
                          //                     title: Languages.of(context)!.SUCCESS,
                          //                     desc: Languages.of(context)!.PROFILE_UPDATED,
                          //                     btnOkOnPress: () {
                          //                       setState(() {
                          //                         Provider.of<MyNotification>(context, listen: false).setNotificationLength(sellerinfo!.notify_count_unseen!);
                          //                       });
                          //                       Navigator.of(context).push(
                          //                           MaterialPageRoute(
                          //                               builder: (context) =>
                          //                                   newBar(
                          //                                     index: 3,
                          //                                   )));
                          //                     },
                          //                   ).show();
                          //           }
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
                          //         Languages.of(context)!.SUBMIT,
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontSize: 15,
                          //                   fontWeight: FontWeight.normal),
                          //             ),
                          //       color: Colors.black,
                          //       shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(6))),
                          // ),

                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;
    imagepath = path;
    setState(() => file = File(path));
  }
}

