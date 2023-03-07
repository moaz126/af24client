import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

import '../../Api/Auth_af24.dart';
import '../../localization/languages/languages.dart';
import '../../Api/globalVariables.dart';
import 'AddressList.dart';
import 'SelectAddressCheckOut.dart';


class EditAddressCheckout extends StatefulWidget {
  final int index;
  const EditAddressCheckout(this.index);

  @override
  State<EditAddressCheckout> createState() => _EditAddressCheckoutState();
}

class _EditAddressCheckoutState extends State<EditAddressCheckout> {
  int val = -1;
  bool _value = false;
  String gender='' ;
  String? TaC ;
  final _formKey = GlobalKey<FormState>();
  final AddressTypeController = TextEditingController();
  final CityController = TextEditingController();
  final NameController = TextEditingController();
  final AddressController = TextEditingController();
  final PhoneController = TextEditingController();
  final ZipController = TextEditingController();
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

  fun(){
    AddressTypeController.text = addressList[widget.index].addressType;
    CityController.text = addressList[widget.index].city;
    NameController.text = addressList[widget.index].contactPersonName;
    AddressController.text = addressList[widget.index].address;
    PhoneController.text = addressList[widget.index].phone;
    ZipController.text = addressList[widget.index].zip;
  }

  @override
  void initState() {
    // TODO: implement initState
    StatusCode = '403';
    fun();
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
        backgroundColor:Colors.black,
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
                    Container(
                      child: Row(
                        children: [
                          Text(
                            Guest == 1 ?
                            Languages.of(context)!.GUEST
                                :
                            sellerinfo!.fName! + ' ' + sellerinfo!.lName.toString(),
                            style:
                            TextStyle(color: Colors.white.withOpacity(0.7)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: CircleAvatar(
                                backgroundColor: Colors.white.withOpacity(0.7),
                                maxRadius: 18,
                                child:
                                Guest == 1 ?
                                Icon(
                                  Icons.person,
                                  color: Colors.white.withOpacity(0.7),
                                  size: 30,
                                )
                                    :
                                ClipOval(
                                  child: CachedNetworkImage(
                                    height: 7.h,
                                    width: 7.h,
                                    imageUrl:
                                    'https://becknowledge.com/af24/public/storage/profile/'+sellerinfo!.image.toString(),
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) =>
                                        shimmerCategoryLoader(),
                                    errorWidget:
                                        (context, url, error) =>
                                        Image.asset(
                                          'assets/icons/My Page.png',
                                        ),
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                    )
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
                          height: 7.h,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(3.h, 0, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            Languages.of(context)!.NAME,
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
                            controller: NameController,
                            decoration: InputDecoration(
                                hintText: Languages.of(context)!.NAME,
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
                            Languages.of(context)!.ADDRESS,
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
                            controller: AddressController,
                            decoration: InputDecoration(
                                hintText: Languages.of(context)!.ADDRESS,
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
                            Languages.of(context)!.ADDRESS_TYPE + " *",
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
                            controller: AddressTypeController,
                            decoration: InputDecoration(
                                hintText: Languages.of(context)!.TEMPORARY_PERMANENT + ' *',
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
                            Languages.of(context)!.CITY + ' *',
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
                            controller: CityController,
                            decoration: InputDecoration(
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
                            Languages.of(context)!.ZIP_CODE + " *",
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
                            controller: ZipController,
                            validator: (value){
                              if(value!.isEmpty){
                                return Languages.of(context)!.REQUIRED;
                              }
                            },
                            decoration: InputDecoration(
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
                            Languages.of(context)!.PHONE_NO,
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
                            //           const EdgeInsets.fromLTRB(2, 10, 0, 10),
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
                              width: 2.w,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 14.0),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                                width: 88.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.2)),
                                    borderRadius: BorderRadius.circular(6)),
                                child: TextFormField(
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return Languages.of(context)!.REQUIRED;
                                    }
                                  },
                                  keyboardType: TextInputType.phone,
                                  controller: PhoneController,
                                  decoration: InputDecoration(
                                      hintText: Languages.of(context)!.MOBILE_NUMBER_HINT,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(fontSize: 15)),
                                ),
                              ),
                            ),
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
                            Languages.of(context)!.ORDER_PROBLEM_NO,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.withOpacity(0.9)),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Stack(
                            children: [
                              // Container(
                              //   //color: Colors.red,
                              //   width: 88.w,
                              //   height: 6.h,
                              //   child: FlatButton(
                              //       onPressed: (
                              //           ) async {
                              //         if (_formKey.currentState!.validate()) {
                              //           setState(() {
                              //             loader = true;
                              //           });
                              //           Map<String, dynamic> addaddressToMap = {
                              //             "id": addressList[widget.index].id.toString(),
                              //             "address_type": AddressTypeController.text,
                              //             "city": CityController.text,
                              //             "contact_person_name": NameController.text,
                              //             "phone": PhoneController.text,
                              //             "address": AddressController.text,
                              //             "zip": ZipController.text,
                              //             "latitude": '123.12.312',
                              //             'longitude': '123123.1231',
                              //             'is_billing': '1',
                              //           };
                              //           await DataApiService.instance.editAddress(addaddressToMap, context);
                              //           await DataApiService.instance.getAddressList();
                              //           setState(() {
                              //             loader = false;
                              //           });
                              //           // GlobalSnackBar.show(context, SnackMessage);
                              //
                              //           // setState(() async {
                              //           //   FName = FNameController.text;
                              //           //   LName=LNameController.text;
                              //           //   Email=EmailController.text;
                              //           //   Phone = dropdownvalue+PhoneController.text;
                              //           //   Password=PasswordController.text;
                              //           //   // title = gender;
                              //           //   //await DataApiService.instance.getSignUptoken();
                              //           //   await callApi();
                              //           //   GlobalSnackBar.show(context, SnackMessage);
                              //           // });
                              //           StatusCode == '200' ?
                              //           AwesomeDialog(
                              //             context: context,
                              //             dialogType: DialogType.SUCCES,
                              //             animType: AnimType.BOTTOMSLIDE,
                              //             title: Languages.of(context)!.SUCCESS,
                              //             desc: AddAddressSnackMessage,
                              //             btnOkOnPress: () async {
                              //               Navigator.pop(context);
                              //               Navigator.pushReplacement<void, void>(
                              //                 context,
                              //                 MaterialPageRoute<void>(
                              //                   builder: (BuildContext context) => const SelectAddressCheckOut(),
                              //                 ),
                              //               );
                              //             },
                              //           ).show()
                              //               :
                              //           AwesomeDialog(
                              //             context: context,
                              //             dialogType: DialogType.ERROR,
                              //             animType: AnimType.BOTTOMSLIDE,
                              //             title: Languages.of(context)!.ERROR,
                              //             desc: AddAddressSnackMessage,
                              //             btnOkOnPress: () {},
                              //           ).show();
                              //         }
                              //       },
                              //       child:
                              //       loader == true ? spinkit
                              //           :Text(
                              //         "Update Address",
                              //         style: TextStyle(
                              //             color: Colors.white,
                              //             fontSize: 15,
                              //             fontWeight: FontWeight.normal),
                              //       ),
                              //       color: Colors.black,
                              //       shape: RoundedRectangleBorder(
                              //           borderRadius: BorderRadius.circular(6))),
                              // ),
                            ]

                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(22, 15, 0, 0),
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
}
