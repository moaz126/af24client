import 'package:af24client/screens/CheckOut/CheckOut.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../localization/languages/languages.dart';
import '../../Api/globalVariables.dart';


class PaymentMethod extends StatefulWidget {
  final int index;
  PaymentMethod(this.index);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () async {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        centerTitle: false,
        title: Text(
          Languages.of(context)!.PAYMENT_METHOD,
          style: TextStyle(color: Colors.black,fontSize: 15.sp),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              Checkbox(
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(4)),
                  ),
                  side: BorderSide(
                    color: Colors.black,
                    width: 1.5,
                  ),
                  activeColor: Colors.black,
                  value: PAYMENT_METHOD.value=='Online Payment',
                  onChanged: (value) {
                    setState(() {
                      PAYMENT_METHOD.value='Online Payment';
                    });
                  }),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Languages.of(context)!.ONLINE_PAYMENT,
                      ))),

            ],
          ),
          Row(
            children: [
              Checkbox(
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(4)),
                  ),
                  side: BorderSide(
                    color: Colors.black,
                    width: 1.5,
                  ),
                  activeColor: Colors.black,
                  value: PAYMENT_METHOD.value=='Cash on delivery',
                  onChanged: (value) {
                    setState(() {
                      PAYMENT_METHOD.value='Cash on delivery';
                    });
                  }),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Languages.of(context)!.CASH_ON_DELIVERY,
                      ))),

            ],
          ),
          SizedBox(height: 30,),
          Container(
            //color: Colors.red,
            width: 100.w,
            height: 6.h,

            // child: Center(
            //   child: FlatButton(
            //       onPressed: () async {
            //         if(PAYMENT_METHOD.value != "" )
            //           {
            //             if(widget.index == -1)
            //               {
            //                 Get.off(()=>CheckOut(-1));
            //               }
            //             else {
            //           Get.off(() => CheckOut(0));
            //         }
            //       }
            //       },
            //       child: Text(
            //         Languages.of(context)!.CONFIRM_PAYMENT_METHOD,
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 15,
            //             fontWeight: FontWeight.normal),
            //       ),
            //       color: Colors.black,
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(6)),),
            // ),
          )
        ],
      ),
    );

  }
}
