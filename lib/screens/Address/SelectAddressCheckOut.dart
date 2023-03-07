import 'package:af24client/screens/Address/AddAddressCheckOut.dart';
import 'package:af24client/screens/Address/EditAddressCheckOut.dart';
import 'package:af24client/screens/CheckOut/CheckOut.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Api/Auth_af24.dart';
import '../../localization/languages/languages.dart';
import '../../Api/globalVariables.dart';
import 'AddAddress.dart';


class SelectAddressCheckOut extends StatefulWidget {
  const SelectAddressCheckOut({Key? key}) : super(key: key);

  @override
  State<SelectAddressCheckOut> createState() => _SelectAddressCheckOutState();
}

class _SelectAddressCheckOutState extends State<SelectAddressCheckOut> {
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
                Languages.of(context)!.SELECT_ADDRESS,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () async {
              setState(() {
                getCartlist = [];
              });
            },
            child:
            Container(
                padding: EdgeInsets.only(right: 10),
                alignment: Alignment.center,
                child:
                InkWell(
                  onTap: (){
                    Get.to(AddAddressCheckOut());
                  },
                  child: Row(
                    children: [
                      Image.asset('assets/images/addaddress.png',height: 3.h,)
                    ],
                  ),
                )
            ),
          ),
        ],
      ),
      body:
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
            child: InkWell(
              onTap: (){
                Get.off(()=>CheckOut(index));
              },
              child:
              Container(
                padding: EdgeInsets.only(left: 8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(Languages.of(context)!.NAME + ": ",style: TextStyle(fontSize: 13.sp),),
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
                                Text(Languages.of(context)!.ADDRESS +": ",style: TextStyle(fontSize: 13.sp)),
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
                                Text(Languages.of(context)!.ADDRESS_TYPE + ": ",style: TextStyle(fontSize: 13.sp),),
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
                              Get.to(EditAddressCheckout(index));
                            },
                            child: Icon(Icons.edit,color: Colors.blue,)),
                      ],
                    ),
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
