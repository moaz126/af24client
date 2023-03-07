import 'package:af24client/screens/Address/AddAddress.dart';
import 'package:af24client/screens/Address/EditAddress.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Api/Auth_af24.dart';
import '../../localization/languages/languages.dart';
import '../../Api/globalVariables.dart';
import '../LoginCreateAccount/login.dart';


class AddressList extends StatefulWidget {
  const AddressList({Key? key}) : super(key: key);

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  final _formKey = GlobalKey<FormState>();
  final emailcontroller= TextEditingController();
  bool loader = false;
  final spinkit = SpinKitSpinningLines(
    size: 5.h,
    color: Colors.black,
  );
  fun() async {
    setState(() {
      loader = true;
    });
    await DataApiService.instance.getAddressList();
    setState(() {
      loader = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    StatusCode = '403';
    fun();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: SingleChildScrollView(
    //     child: Form(
    //       key: _formKey,
    //       child: Column(
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
    //                   color: Colors.black,
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Container(
    //             margin: EdgeInsets.fromLTRB(3.h, 0, 0, 0),
    //             alignment: Alignment.topLeft,
    //             child: Text("Address"),
    //           ),
    //           SizedBox(
    //             height: 0.5.h,
    //           ),
    //           Container(
    //             padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
    //             width: 88.w,
    //             decoration: BoxDecoration(
    //                 border: Border.all(color: Colors.grey.withOpacity(0.2)),
    //                 borderRadius: BorderRadius.circular(6)),
    //             child: TextFormField(
    //               validator: (value){
    //                 if(value!.isEmpty){
    //                   return "This field is required";
    //                 }
    //               },
    //               controller: emailcontroller,
    //               decoration: InputDecoration(
    //                   hintText: "Your email address",
    //                   enabledBorder: InputBorder.none,
    //                   focusedBorder: InputBorder.none,
    //                   border: InputBorder.none,
    //                   hintStyle: TextStyle(fontSize: 15)),
    //             ),
    //           ),
    //           SizedBox(height: 3.h,),
    //           Container(
    //             width: 30.w,
    //             height: 6.h,
    //             child: FlatButton(
    //                 onPressed: () async {
    //                   if (_formKey.currentState!.validate()) {
    //                     StatusCode = '403';
    //                     setState(() {
    //                       loader = true;
    //                     });
    //                     Map<String, dynamic> ForgotEmailToMap = {
    //                       "email": emailcontroller.text,
    //                     };
    //                     await DataApiService.instance.ForgotPassword(emailcontroller.text);
    //                     setState(()  {
    //                       // GlobalSnackBar.show(context, ForgotPasswordMessage!);
    //                       loader = false;
    //                     });
    //                     // GlobalSnackBar.show(context, LoginSnackMessage);
    //                     StatusCode != '200' ?
    //                     AwesomeDialog(
    //                       context: context,
    //                       dialogType: DialogType.ERROR,
    //                       animType: AnimType.BOTTOMSLIDE,
    //                       title: 'Error',
    //                       desc: ForgotPasswordMessage,
    //                       btnOkOnPress: (){ },
    //                     ).show()
    //                         :
    //                     AwesomeDialog(
    //                       context: context,
    //                       dialogType: DialogType.SUCCES,
    //                       animType: AnimType.BOTTOMSLIDE,
    //                       title: 'Check Your Email',
    //                       desc: ForgotPasswordMessage,
    //                       btnOkOnPress: (){
    //                         Get.to(Login());
    //                       },
    //                     ).show();
    //                   }
    //                   else{
    //                     StatusCode = '403';
    //                   }
    //
    //
    //                   // setState(() async {
    //                   //   Emaillogin = emailcontroller.text;
    //                   //   PassLogin = passcontroller.text;
    //                   //   await callApi();
    //                   //   GlobalSnackBar.show(context, LoginSnackMessage),
    //                 },
    //                 child: loader == true ?  spinkit
    //                     : Text(
    //                   "Confirm",
    //                   style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 15,
    //                       fontWeight: FontWeight.normal),
    //                 ),
    //                 color: Colors.black,
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(6))),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () async {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Center(
          child: Column(
            children: [
              Text(
                Languages.of(context)!.ADDRESS,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            child:
            InkWell(
              onTap: (){
                if(Guest == 1)
                {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.INFO,
                    animType: AnimType.BOTTOMSLIDE,
                    title: Languages.of(context)!.LOGIN,
                    desc: Languages.of(context)!.LOGIN_FIRST,
                    btnCancelOnPress: (){},
                    btnCancelText: Languages.of(context)!.CANCEL,
                    btnOkText: Languages.of(context)!.LOGIN,
                    btnOkOnPress: () {
                      Get.to(()=>Login());
                    },
                  ).show();
                }
                else {
                    Get.to(AddAddress());
                  }
                },
              child: Row(
                children: [
                  Image.asset('assets/images/addaddress.png',height: 3.h,)
                ],
              ),
            )
          ),
        ],
      ),
      body:
          Guest == 1 ?
              Center(
                child: Container(
                  child: Text(Languages.of(context)!.LOGIN_FIRST),
                ),
              )
              :
          loader ?
              spinkit :
              addressList.isEmpty
              ?
              Center(
                child: Text(Languages.of(context)!.EMPTY_ADDRESS),
              )
        :
      Padding(
        padding: EdgeInsets.symmetric(horizontal: (20 / 375.0) * 100.w),
        child: ListView.builder(
          itemCount: addressList.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 3),
            child: Dismissible(
              key: Key(addressList[index].id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) async {
                await
                DataApiService.instance.deleteAddress(addressList[index].id.toString(), context);
                setState(() {
                  addressList.removeAt(index);
                });
              },
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [Spacer(), Icon(Icons.delete)],
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(Languages.of(context)!.NAME + ': ',style: TextStyle(fontSize: 13.sp),),
                            Text(addressList[index].contactPersonName,
                              style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 11.sp),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Languages.of(context)!.ADDRESS + ": ",style: TextStyle(fontSize: 13.sp)),
                            Container(
                              width: 60.w,
                              child:
                              Text(
                                addressList[index].address,
                                style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 11.sp),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(Languages.of(context)!.ADDRESS_TYPE+ ": ",style: TextStyle(fontSize: 13.sp),),
                            Text(addressList[index].addressType,
                              style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 11.sp),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(Languages.of(context)!.ZIP_CODE + ": ",style: TextStyle(fontSize: 13.sp),),
                            Text.rich(
                              TextSpan(
                                text:addressList[index].zip.toString(),
                                style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 11.sp),
                                children: [
                                  /*   TextSpan(
                                      text: " x2",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1), */
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 23.w,
                            ),
                          ],
                        )
                      ],
                    ),
                    InkWell(
                        onTap: (){
                          Get.to(EditAddress(index));
                        },
                        child: Icon(Icons.edit,color: Colors.blue,)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
