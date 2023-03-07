import 'package:af24client/screens/Widgets/page_transition.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'common_elevated_button.dart';
import 'elevated_button_50.dart';


class CommonUiWidget {


   static Widget DividerWidthOne() {
    return Divider(
      thickness: 0.7,
      color: Colors.black,
    );
  }
   static Widget Container1Nhalf() {
     return Container(
     height: 1.5,
       color: Colors.black,
     );
   }


   static Widget DividerWidthTwo() {
    return Divider(
      thickness: 2,
      color: Colors.black,
    );
  }
   static Widget DividerWidthOneNThree() {
     return Container(
       height: 1.3,
       color: Colors.black,
     );
   }

   static Widget DividerWidthOneNHalf() {
    return Divider(
      thickness: 1.5,
      color: Colors.black,

    );
  }
   Future<dynamic> _onBackPressed(context) async {
     return AwesomeDialog(
       context: context,
       dialogType: DialogType.question,
       animType: AnimType.BOTTOMSLIDE,
       title: 'Exit',
       desc: 'Do you want to exit app',
       btnCancelOnPress: () {},
       btnCancelText: 'No',
       btnOkText: 'Yes',
       btnOkOnPress: () async {
         SystemNavigator.pop();
       },
     ).show();
   }




   static Widget OrderNow() {
     return Column(
       children: [
         CommonUiWidget.DividerWidthOneNThree(),
         SizedBox(
           height: 5,
         ),
         Row(mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
               height: 35,
               width: 35,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: Colors.black
               ),
               child: Center(
                 child: Text('AF24',style: TextStyles.TitleTexStyle10().copyWith(
                   // fontWeight: FontWeight.normal,
                   color: Colors.white,
                 ),),
               ),
             )
           ],
         ),
         Padding(
           padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
           child: Align(
             alignment: Alignment.center,
             child: Text('If you want to buy this, please order now.This button available only for 10min.',
               textAlign: TextAlign.center ,style: TextStyles.TitleTexStyle13().copyWith(
                   fontWeight: FontWeight.normal
               ),
             ),
           ),
         ),
         // Row(
         //   children: [
         //     Checkbox(activeColor: Colors.black,
         //       value: _value,
         //       onChanged: (bool? value) {
         //         setState(() {
         //           _value = value!;
         //         });
         //       },
         //     ), //
         //     Text('Returns due to simple change of mind are prohibited.',style: TextStyles.TitleTexStyle11().copyWith(
         //         fontWeight: FontWeight.normal
         //     ),)// Checkbox
         //   ],
         // ),
         SizedBox(
           height: 5,
         ),
         Row(mainAxisAlignment: MainAxisAlignment.center,
           children: [
             CommonElevatedButtonBlack50(title: 'Order Now', onClicked: (){}),
             SizedBox(
               width: 15,
             ),
             Text('Cancel')
           ],
         ),
         SizedBox(
           height: 3,
         ),

         Row(mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text('18:06:10 12.12.2022.',style: TextStyles.TitleTexStyle13().copyWith(
                 fontWeight: FontWeight.normal
             ),)
           ],
         ),
         SizedBox(
           height: 7,
         ),
         CommonUiWidget.DividerWidthOneNThree(),
       ],
     );
   }
   static Widget ThankYouForOrder() {
     return Column(
       children: [
         CommonUiWidget.DividerWidthOneNThree(),
         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Column(
               children: [
                 Image.asset('assets/images/af24icon.png',height: 50,width: 50,)
               ],
             ),
             Column(
               children: [
                 SizedBox(
                   height: 5,
                 ),
                 Row(mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(
                       height: 35,
                       width: 35,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                           color: Colors.black
                       ),
                       child: Center(
                         child: Text('AF24',style: TextStyles.TitleTexStyle10().copyWith(
                           // fontWeight: FontWeight.normal,
                           color: Colors.white,
                         ),),
                       ),
                     )
                   ],
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                   child: Align(
                     alignment: Alignment.center,
                     child: Text('Thanks for your order,\nWhen seller deliver this artikel we will notice you.',
                       textAlign: TextAlign.center ,style: TextStyles.TitleTexStyle10().copyWith(
                           fontWeight: FontWeight.normal
                       ),
                     ),
                   ),
                 ),
                 SizedBox(
                   height: 5,
                 ),


                 Row(mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('18:06:10 12.12.2022.',style: TextStyles.TitleTexStyle13().copyWith(
                         fontWeight: FontWeight.normal
                     ),)
                   ],
                 ),

               ],
             ),
             Column(
               children: [
                 Image.asset('assets/images/af24icon.png',height: 50,width: 50,)
               ],
             ),
           ],
         ),
         CommonUiWidget.DividerWidthOneNThree(),
       ],
     );
   }

   static Widget OrderSent_ShippingAddres() {
     return Column(
       children: [
         CommonUiWidget.DividerWidthOneNThree(),
         Column(
           children: [
             SizedBox(
               height: 10,
             ),

             Padding(
               padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
               child: Align(
                 alignment: Alignment.center,
                 child: Text('Seller sent your order to your shipping address.\nYou can track your order now.\nTraacking nr. 12345678wxe',
                   textAlign: TextAlign.center ,style: TextStyles.TitleTexStyle13().copyWith(
                       fontWeight: FontWeight.normal
                   ),
                 ),
               ),
             ),
             SizedBox(
               height: 15,
             ),


             Row(mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('18:06:10 12.12.2022.',style: TextStyles.TitleTexStyle11().copyWith(
                     fontWeight: FontWeight.normal
                 ),)
               ],
             ),

           ],
         ),
         CommonUiWidget.DividerWidthOneNThree(),
       ],
     );
   }
   static Widget OrderArrived() {
     return Column(
       children: [
         CommonUiWidget.DividerWidthOneNThree(),
         Column(
           children: [
             SizedBox(
               height: 10,
             ),

             Padding(
               padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
               child: Align(
                 alignment: Alignment.center,
                 child: Text('Arrived!\nYour oder arrived. please let seller know in 3 days, if\n the product is defect or something wrong.',
                   textAlign: TextAlign.center ,style: TextStyles.TitleTexStyle13().copyWith(
                       fontWeight: FontWeight.normal
                   ),
                 ),
               ),
             ),


             SizedBox(
               height: 15,
             ),
             CommonElevatedButtonBlack(title:'I have an issue with my product' , onClicked: (){}),
             SizedBox(
               height:15,
             ),

             Row(mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('18:06:10 12.12.2022.',style: TextStyles.TitleTexStyle11().copyWith(
                     fontWeight: FontWeight.normal
                 ),)
               ],
             ),

           ],
         ),
         CommonUiWidget.DividerWidthOneNThree(),
       ],
     );
   }
   static Widget ImageUpload() {
     return  Column(
       children: [
         CommonUiWidget.DividerWidthOneNThree(),
         Column(
           children: [
             SizedBox(
               height: 10,
             ),

             Padding(
               padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
               child: Align(
                 alignment: Alignment.center,
                 child: Text('If you have any images, which to show seller you\n please upload image.',
                   textAlign: TextAlign.center ,style: TextStyles.TitleTexStyle13().copyWith(
                       fontWeight: FontWeight.normal
                   ),
                 ),
               ),
             ),


             SizedBox(
               height: 15,
             ),
             CommonElevatedButtonBlack50(title:'Image upload' , onClicked: (){}),
             SizedBox(
               height:15,
             ),

             Row(mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('18:06:10 12.12.2022.',style: TextStyles.TitleTexStyle11().copyWith(
                     fontWeight: FontWeight.normal
                 ),)
               ],
             ),

           ],
         ),
         CommonUiWidget.DividerWidthOneNThree(),
       ],
     );
   }


}