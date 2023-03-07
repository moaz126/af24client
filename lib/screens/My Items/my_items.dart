// import 'package:af24client/models/globalVariables.dart';
// import 'package:af24client/screens/Address/AddressList.dart';
// import 'package:af24client/screens/AppLanguageSettings/languageMain.dart';
// import 'package:af24client/screens/Cart/cart.dart';
// import 'package:af24client/screens/Address/AddAddress.dart';
// import 'package:af24client/screens/CategoryProduct/CategoryProduct.dart';
// import 'package:af24client/screens/OrderHistory/OrderList.dart';
// import 'package:af24client/screens/WishList/WishList.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:sizer/sizer.dart';
//
// import '../../Api/Auth_af24.dart';
// import '../../navBar.dart';
//
// class category extends StatefulWidget {
//   const category({Key? key}) : super(key: key);
//
//   @override
//   _categoryState createState() => _categoryState();
// }
//
// class _categoryState extends State<category> {
//   fun() async {
//     setState(() {
//       loader = true;
//     });
//     await DataApiService.instance.getCategoriesList();
//     setState(() {
//       loader = false;
//     });
//   }
//   bool loader = false;
//   final spinkit = SpinKitSpinningLines(
//     size: 5.h,
//     color: Colors.black,
//   );
//   @override
//   initState() {
//     // TODO: implement initState
//     fun();
//     super.initState();
//   }
//   bool category = false;
//   bool women = false;
//   bool men = false;
//   bool kids = false;
//   bool brand = false;
//   bool clothing = false;
//   bool shoes = false;
//   bool accessories = false;
//   bool country = false;
//
//   @override
//   void setState(VoidCallback fn) {
//     // TODO: implement setState
//
//     super.setState(fn);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: loader == true ? Colors.white : Colors.black,
//         // appBar: AppBar(
//         //   backgroundColor: Colors.black,
//         //   leading: InkWell(
//         //       onTap: (){
//         //         Get.back();
//         //       },
//         //       child: Icon(Icons.arrow_back_rounded,color: Colors.white,)),
//         // ),
//         body:
//         loader == true ? spinkit :
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 8.0,top: 8.0),
//               child: InkWell(
//                   onTap: (){
//                   Get.back();
//                   },
//                 child: Icon(Icons.arrow_back_rounded,color: Colors.white,)),
//             ),
//             Container(
//               alignment: Alignment.bottomLeft,
//               width: MediaQuery.of(context).size.width,
//               height: 11.h,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10.0, right: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Image.asset(
//                       'assets/icons/Seller app icon (11).png',
//                       height: 4.5.h,
//                       color: Colors.white,
//                     ),
//                     Container(
//                       child:
//                       Row(
//                         children: [
//                           Container(
//                             width: 13.w,
//                             child: Text (
//                               Guest == 1 ? 'Guest' :
//                               sellerinfo!.fName! + ' ' + sellerinfo!.lName.toString(),
//                               style:
//                                   TextStyle(color: Colors.white.withOpacity(0.7),),
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           Guest == 1 || sellerinfo!.image == null || sellerinfo!.image == 'def.png' || sellerinfo!.image == '' ?
//                           Padding(
//                             padding: const EdgeInsets.only(left: 8.0, right: 8),
//                             child: CircleAvatar(
//                               backgroundColor: Colors.white.withOpacity(0.7),
//                               maxRadius: 18,
//                               child:
//                               Image.asset('assets/icons/My Page-1.png',color: Colors.black,height:7.h,),
//                             ),
//                           )
//                           :
//                           Padding(
//                             padding: const EdgeInsets.only(right: 8.0,left: 8.0),
//                             child: ClipOval(
//                               child:
//                               CachedNetworkImage(
//                                 height: 9.0.h,
//                                 width: 9.0.h,
//                                 imageUrl:
//                                 'https://becknowledge.com/af24/public/storage/profile/'+sellerinfo!.image.toString(),
//                                 fit: BoxFit.fill,
//                                 placeholder: (context, url) =>
//                                     shimmerCategoryLoader(),
//                                 errorWidget:
//                                     (context, url, error) =>
//                                     Image.asset(
//                                       height: 9.0.h,
//                                       width: 9.0.h,
//                                       'assets/images/NoPic.jpg',
//                                     ),
//                               ),
//                               //Image.network('https://becknowledge.com/af24/public/storage/profile/'+sellerinfo!.image.toString(),height: 9.0.h,width: 9.0.h,fit: BoxFit.fill)),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(20),
//                         topRight: Radius.circular(20))),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 8.0, right: 8),
//                   child: ListView(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 12.0, bottom: 12),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             InkWell(
//                               onTap: (){
//                                 Get.to(OrderList());
//                               },
//                               child: iconCounter(
//                                   counter: 0,
//                                   image: Image.asset(
//                                     'assets/icons/bag.png',
//                                     height: 35.sp,
//                                   ),
//                                   labelTexts: 'Orders'),
//                             ),
//                             InkWell(
//                               onTap: (){
//                                 Get.to(Carts());
//                               },
//                               child: iconCounter(
//                                   counter:
//                                   Guest == 1 ? 0 :
//                                   cartCount,
//                                   image: Image.asset(
//                                     'assets/icons/shopping-cart.png',
//                                     height: 35.sp,
//                                   ),
//                                   labelTexts: 'Cart'),
//                             ),
//                             InkWell(
//                               onTap: () async {
//                                 Get.to(WishList());
//                               },
//                               child: iconCounter(
//                                   counter: 0,
//                                   image: Image.asset(
//                                     'assets/icons/wishlist.png',
//                                     height: 35.sp,
//                                   ),
//                                   labelTexts: 'Wishlist'),
//                             ),
//                           ],
//                         ),
//                       ),
//                       InkWell(
//                         onTap: (){
//                           Get.to(AddressList());
//                         },
//                         child: ListTile(
//                           leading: Image.asset(
//                             'assets/icons/address.png',
//                             color: Color(0xFF5F5F5F),
//                             height: 18.sp,
//                           ),
//                           title: Text('Address'),
//                         ),
//                       ),
//                       ListTile(
//                         leading: Image.asset(
//                           'assets/icons/category.png',
//                           color: Color(0xFF5F5F5F),
//                           height: 18.sp,
//                         ),
//                         title: Text('All Category'),
//                         onTap: () {
//                           setState(() {
//                             category = !category;
//                           });
//                         },
//                       ),
//                       if (category)
//                         Padding(
//                           padding: const EdgeInsets.only(left: 12.0, right: 12),
//                           child: Column(
//                             children: [
//                               Divider(
//                                 height: 1,
//                                 thickness: 1,
//                               ),
//                               ListTile(
//                                 onTap: () {
//                                   setState(() {
//                                     women = !women;
//                                   });
//                                 },
//                                 dense: true,
//                                 visualDensity: VisualDensity(vertical: 0),
//                                 title: Text(
//                                   categoriesList[0].name,
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 trailing: !women
//                                     ? Icon(Icons.arrow_forward_ios)
//                                     : Icon(
//                                         Icons.keyboard_arrow_down_sharp,
//                                         size: 28.sp,
//                                       ),
//                               ),
//                               Divider(
//                                 height: 1,
//                                 thickness: 1,
//                               ),
//                               if (women)
//                                 Column(
//                                   children: [
//                                     InkWell( onTap: (){
//                                       Get.to(CategoryProduct(categoriesList[0].id));
//                                     },child: clothingList(text: categoriesList[0].childes[0].name)),
//                                     ListTile(
//                                       onTap: () {
//                                         setState(() {
//                                           brand = !brand;
//                                         });
//                                       },
//                                       dense: true,
//                                       visualDensity:
//                                           VisualDensity(vertical: -4),
//                                       title: Text(
//                                         categoriesList[0].childes[1].name,
//                                         style:
//                                             TextStyle(color: Color(0XFF5F5F5F)),
//                                       ),
//                                       trailing: !brand
//                                           ? Padding(
//                                               padding: const EdgeInsets.only(
//                                                   right: 8.0),
//                                               child: Image.asset(
//                                                 'assets/icons/plus-2.png',
//                                                 height: 10.sp,
//                                                 color: Color(0XFF5F5F5F),
//                                               ),
//                                             )
//                                           : Padding(
//                                               padding: const EdgeInsets.only(
//                                                   right: 8.0),
//                                               child: Image.asset(
//                                                 'assets/icons/minus.png',
//                                                 height: 10.sp,
//                                                 color: Color(0XFF5F5F5F),
//                                               ),
//                                             ),
//                                     ),
//                                     ListTile(
//                                       onTap: () {
//                                         setState(() {
//                                           clothing = !clothing;
//                                         });
//                                       },
//                                       dense: true,
//                                       visualDensity:
//                                           VisualDensity(vertical: -4),
//                                       title: Text(
//                                         categoriesList[0].childes[2].name,
//                                         style:
//                                             TextStyle(color: Color(0XFF5F5F5F)),
//                                       ),
//                                       trailing: !clothing
//                                           ? Padding(
//                                               padding: const EdgeInsets.only(
//                                                   right: 8.0),
//                                               child: Image.asset(
//                                                 'assets/icons/plus-2.png',
//                                                 height: 10.sp,
//                                                 color: Color(0XFF5F5F5F),
//                                               ),
//                                             )
//                                           : Padding(
//                                               padding: const EdgeInsets.only(
//                                                   right: 8.0),
//                                               child: Image.asset(
//                                                 'assets/icons/minus.png',
//                                                 height: 10.sp,
//                                                 color: Color(0XFF5F5F5F),
//                                               ),
//                                             ),
//                                     ),
//                                     clothing
//                                         ? Column(
//                                             children: [
//                                               clothingList(text: ' - Show all'),
//                                               clothingList(
//                                                   text: ' - Activewear'),
//                                               clothingList(
//                                                   text: ' - Blazer&Formalwear'),
//                                               clothingList(
//                                                   text: ' - Blouses&tops'),
//                                               clothingList(text: ' - Denim'),
//                                               clothingList(text: ' - Trouser'),
//                                               clothingList(
//                                                   text: ' - Jackets & Coats'),
//                                               clothingList(text: ' - Dresses'),
//                                               clothingList(text: ' - Skirts'),
//                                               clothingList(text: ' - Shorts'),
//                                               clothingList(text: ' - Knitwear'),
//                                               clothingList(
//                                                   text: ' - SweatShirts'),
//                                               clothingList(text: ' - T-Shirts'),
//                                               clothingList(text: ' - Laundry'),
//                                             ],
//                                           )
//                                         : Container(),
//                                     ListTile(
//                                       onTap: () {
//                                         setState(() {
//                                           shoes = !shoes;
//                                         });
//                                       },
//                                       dense: true,
//                                       visualDensity:
//                                           VisualDensity(vertical: -4),
//                                       title: Text(
//                                         categoriesList[0].childes[3].name,
//                                         style:
//                                             TextStyle(color: Color(0XFF5F5F5F)),
//                                       ),
//                                       trailing: !shoes
//                                           ? Padding(
//                                               padding: const EdgeInsets.only(
//                                                   right: 8.0),
//                                               child: Image.asset(
//                                                 'assets/icons/plus-2.png',
//                                                 height: 10.sp,
//                                                 color: Color(0XFF5F5F5F),
//                                               ),
//                                             )
//                                           : Padding(
//                                               padding: const EdgeInsets.only(
//                                                   right: 8.0),
//                                               child: Image.asset(
//                                                 'assets/icons/minus.png',
//                                                 height: 10.sp,
//                                                 color: Color(0XFF5F5F5F),
//                                               ),
//                                             ),
//                                     ),
//                                     shoes
//                                         ? Column(
//                                             children: [
//                                               clothingList(text: ' - Show all'),
//                                               clothingList(text: ' - Scents'),
//                                               clothingList(text: ' - Belts'),
//                                               clothingList(
//                                                   text: ' - Hats & Caps'),
//                                               clothingList(text: ' - Scarves'),
//                                               clothingList(text: ' - Jwellery'),
//                                               clothingList(text: ' - Other'),
//                                               clothingList(text: ' - Bags'),
//                                             ],
//                                           )
//                                         : Container(),
//                                     ListTile(
//                                       onTap: () {
//                                         setState(() {
//                                           accessories = !accessories;
//                                         });
//                                       },
//                                       dense: true,
//                                       visualDensity:
//                                           VisualDensity(vertical: -4),
//                                       title: Text(
//                                         categoriesList[0].childes[4].name,
//                                         style:
//                                             TextStyle(color: Color(0XFF5F5F5F)),
//                                       ),
//                                       trailing: !accessories
//                                           ? Padding(
//                                               padding: const EdgeInsets.only(
//                                                   right: 8.0),
//                                               child: Image.asset(
//                                                 'assets/icons/plus-2.png',
//                                                 height: 10.sp,
//                                                 color: Color(0XFF5F5F5F),
//                                               ),
//                                             )
//                                           : Padding(
//                                               padding: const EdgeInsets.only(
//                                                   right: 8.0),
//                                               child: Image.asset(
//                                                 'assets/icons/minus.png',
//                                                 height: 10.sp,
//                                                 color: Color(0XFF5F5F5F),
//                                               ),
//                                             ),
//                                     ),
//                                     accessories
//                                         ? Column(
//                                             children: [
//                                               clothingList(text: ' - Show all'),
//                                               clothingList(text: ' - Scents'),
//                                               clothingList(text: ' - Belts'),
//                                               clothingList(
//                                                   text: ' - Hats & Caps'),
//                                               clothingList(text: ' - Scarves'),
//                                               clothingList(text: ' - Jwellery'),
//                                               clothingList(text: ' - Other'),
//                                               clothingList(text: ' - Bags'),
//                                             ],
//                                           )
//                                         : Container(),
//                                     clothingList(text: categoriesList[0].childes[5].name),
//                                     Divider(height: 1.h,thickness: 1,)
//                                   ],
//                                 ),
//                               ListTile(
//                                 onTap: () {
//                                   setState(() {
//                                     men = !men;
//                                   });
//                                 },
//                                 dense: true,
//                                 visualDensity: VisualDensity(vertical: 0),
//                                 title: Text(
//                                   categoriesList[1].name,
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 trailing: !men
//                                     ? Icon(Icons.arrow_forward_ios)
//                                     : Icon(
//                                         Icons.keyboard_arrow_down_sharp,
//                                         size: 28.sp,
//                                       ),
//                               ),
//                               Divider(
//                                 height: 1,
//                                 thickness: 1,
//                               ),
//                               if (men)
//                                 Column(
//                                   children: [
//                                     InkWell(
//                                         onTap: (){
//                                           Get.to(CategoryProduct(categoriesList[1].id));
//                                         },
//                                         child: clothingList(text: categoriesList[1].childes[0].name)),
//                                     ListTile(
//                                       // onTap: () {
//                                       //   setState(() {
//                                       //     brand = !brand;
//                                       //   });
//                                       // },
//                                       dense: true,
//                                       visualDensity:
//                                           VisualDensity(vertical: -4),
//                                       title: Text(
//                                         categoriesList[1].childes[1].name,
//                                         style:
//                                             TextStyle(color: Color(0XFF5F5F5F)),
//                                       ),
//                                     ),
//                                     ListTile(
//                                       // onTap: () {
//                                       //   setState(() {
//                                       //     clothing = !clothing;
//                                       //   });
//                                       // },
//                                       dense: true,
//                                       visualDensity:
//                                           VisualDensity(vertical: -4),
//                                       title: Text(
//                                         categoriesList[1].childes[2].name,
//                                         style:
//                                             TextStyle(color: Color(0XFF5F5F5F)),
//                                       ),
//                                     ),
//                                     ListTile(
//                                       // onTap: () {
//                                       //   setState(() {
//                                       //     clothing = !clothing;
//                                       //   });
//                                       // },
//                                       dense: true,
//                                       visualDensity:
//                                           VisualDensity(vertical: -4),
//                                       title: Text(
//                                         categoriesList[1].childes[3].name,
//                                         style:
//                                             TextStyle(color: Color(0XFF5F5F5F)),
//                                       ),
//                                     ),
//
//                                     clothing
//                                         ? Column(
//                                             children: [
//                                               clothingList(text: ' - Show all'),
//                                               clothingList(
//                                                   text: ' - Activewear'),
//                                               clothingList(
//                                                   text: ' - Blazer&Formalwear'),
//                                               clothingList(
//                                                   text: ' - Blouses&tops'),
//                                               clothingList(text: ' - Denim'),
//                                               clothingList(text: ' - Trouser'),
//                                               clothingList(
//                                                   text: ' - Jackets & Coats'),
//                                               clothingList(text: ' - Dresses'),
//                                               clothingList(text: ' - Skirts'),
//                                               clothingList(text: ' - Shorts'),
//                                               clothingList(text: ' - Knitwear'),
//                                               clothingList(
//                                                   text: ' - SweatShirts'),
//                                               clothingList(text: ' - T-Shirts'),
//                                               clothingList(text: ' - Laundry'),
//                                             ],
//                                           )
//                                         : Container(),
//                                     ListTile(
//                                       // onTap: () {
//                                       //   setState(() {
//                                       //     shoes = !shoes;
//                                       //   });
//                                       // },
//                                       dense: true,
//                                       visualDensity:
//                                           VisualDensity(vertical: -4),
//                                       title: Text(
//                                         categoriesList[1].childes[4].name,
//                                         style:
//                                             TextStyle(color: Color(0XFF5F5F5F)),
//                                       ),
//                                     ),
//                                     shoes
//                                         ? Column(
//                                             children: [
//                                               clothingList(text: ' - Show all'),
//                                               clothingList(text: ' - Scents'),
//                                               clothingList(text: ' - Belts'),
//                                               clothingList(
//                                                   text: ' - Hats & Caps'),
//                                               clothingList(text: ' - Scarves'),
//                                               clothingList(text: ' - Jwellery'),
//                                               clothingList(text: ' - Other'),
//                                               clothingList(text: ' - Bags'),
//                                             ],
//                                           )
//                                         : Container(),
//                                     Divider(height: 1.h,thickness: 1,)
//                                   ],
//                                 ),
//                               ListTile(
//                                 onTap: () {
//                                   setState(() {
//                                     kids = !kids;
//                                   });
//                                 },
//                                 dense: true,
//                                 visualDensity: VisualDensity(vertical: 0),
//                                 title: Text(
//                                   categoriesList[2].name,
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 trailing: !kids
//                                     ? Icon(Icons.arrow_forward_ios)
//                                     : Icon(
//                                         Icons.keyboard_arrow_down_sharp,
//                                         size: 28.sp,
//                                       ),
//                               ),
//                               Divider(
//                                 height: 1,
//                                 thickness: 1,
//                               ),
//                               // if (kids)
//                                 // Column(
//                                 //   children: [
//                                 //     InkWell(
//                                 //         onTap: (){
//                                 //           //Get.to(CategoryProduct(categoriesList[2].id));
//                                 //         },
//                                 //         child: clothingList(text: categoriesList[2].childes[0].name)),
//                                 //     ListTile(
//                                 //       // onTap: () {
//                                 //       //   setState(() {
//                                 //       //     brand = !brand;
//                                 //       //   });
//                                 //       // },
//                                 //       dense: true,
//                                 //       visualDensity:
//                                 //           VisualDensity(vertical: -4),
//                                 //       title: Text(
//                                 //         categoriesList[2].childes[1].name,
//                                 //         style:
//                                 //             TextStyle(color: Color(0XFF5F5F5F)),
//                                 //       ),
//                                 //       trailing: !brand
//                                 //           ? Padding(
//                                 //               padding: const EdgeInsets.only(
//                                 //                   right: 8.0),
//                                 //               child: Image.asset(
//                                 //                 'assets/icons/plus-2.png',
//                                 //                 height: 10.sp,
//                                 //                 color: Color(0XFF5F5F5F),
//                                 //               ),
//                                 //             )
//                                 //           : Padding(
//                                 //               padding: const EdgeInsets.only(
//                                 //                   right: 8.0),
//                                 //               child: Image.asset(
//                                 //                 'assets/icons/minus.png',
//                                 //                 height: 10.sp,
//                                 //                 color: Color(0XFF5F5F5F),
//                                 //               ),
//                                 //             ),
//                                 //     ),
//                                 //     ListTile(
//                                 //       // onTap: () {
//                                 //       //   setState(() {
//                                 //       //     clothing = !clothing;
//                                 //       //   });
//                                 //       // },
//                                 //       dense: true,
//                                 //       visualDensity:
//                                 //           VisualDensity(vertical: -4),
//                                 //       title: Text(
//                                 //         categoriesList[2].childes[2].name,
//                                 //         style:
//                                 //             TextStyle(color: Color(0XFF5F5F5F)),
//                                 //       ),
//                                 //       trailing: !clothing
//                                 //           ? Padding(
//                                 //               padding: const EdgeInsets.only(
//                                 //                   right: 8.0),
//                                 //               child: Image.asset(
//                                 //                 'assets/icons/plus-2.png',
//                                 //                 height: 10.sp,
//                                 //                 color: Color(0XFF5F5F5F),
//                                 //               ),
//                                 //             )
//                                 //           : Padding(
//                                 //               padding: const EdgeInsets.only(
//                                 //                   right: 8.0),
//                                 //               child: Image.asset(
//                                 //                 'assets/icons/minus.png',
//                                 //                 height: 10.sp,
//                                 //                 color: Color(0XFF5F5F5F),
//                                 //               ),
//                                 //             ),
//                                 //     ),
//                                 //     clothing
//                                 //         ? Column(
//                                 //             children: [
//                                 //               clothingList(text: ' - Show all'),
//                                 //               clothingList(
//                                 //                   text: ' - Activewear'),
//                                 //               clothingList(
//                                 //                   text: ' - Blazer&Formalwear'),
//                                 //               clothingList(
//                                 //                   text: ' - Blouses&tops'),
//                                 //               clothingList(text: ' - Denim'),
//                                 //               clothingList(text: ' - Trouser'),
//                                 //               clothingList(
//                                 //                   text: ' - Jackets & Coats'),
//                                 //               clothingList(text: ' - Dresses'),
//                                 //               clothingList(text: ' - Skirts'),
//                                 //               clothingList(text: ' - Shorts'),
//                                 //               clothingList(text: ' - Knitwear'),
//                                 //               clothingList(
//                                 //                   text: ' - SweatShirts'),
//                                 //               clothingList(text: ' - T-Shirts'),
//                                 //               clothingList(text: ' - Laundry'),
//                                 //             ],
//                                 //           )
//                                 //         : Container(),
//                                 //       // onTap: () {
//                                 //       //   setState(() {
//                                 //       //     shoes = !shoes;
//                                 //       //   });
//                                 //       // },
//                                 //     // ListTile(
//                                 //     //   // onTap: () {
//                                 //     //   //   setState(() {
//                                 //     //   //     accessories = !accessories;
//                                 //     //   //   });
//                                 //     //   // },
//                                 //     //   dense: true,
//                                 //     //   visualDensity:
//                                 //     //       VisualDensity(vertical: -4),
//                                 //     //   title: Text(
//                                 //     //     'Accessories',
//                                 //     //     style:
//                                 //     //         TextStyle(color: Color(0XFF5F5F5F)),
//                                 //     //   ),
//                                 //     //   trailing: !accessories
//                                 //     //       ? Padding(
//                                 //     //           padding: const EdgeInsets.only(
//                                 //     //               right: 8.0),
//                                 //     //           child: Image.asset(
//                                 //     //             'assets/icons/plus-2.png',
//                                 //     //             height: 10.sp,
//                                 //     //             color: Color(0XFF5F5F5F),
//                                 //     //           ),
//                                 //     //         )
//                                 //     //       : Padding(
//                                 //     //           padding: const EdgeInsets.only(
//                                 //     //               right: 8.0),
//                                 //     //           child: Image.asset(
//                                 //     //             'assets/icons/minus.png',
//                                 //     //             height: 10.sp,
//                                 //     //             color: Color(0XFF5F5F5F),
//                                 //     //           ),
//                                 //     //         ),
//                                 //     // ),
//                                 //     // accessories
//                                 //     //     ? Column(
//                                 //     //         children: [
//                                 //     //           clothingList(text: ' - Show all'),
//                                 //     //           clothingList(text: ' - Scents'),
//                                 //     //           clothingList(text: ' - Belts'),
//                                 //     //           clothingList(
//                                 //     //               text: ' - Hats & Caps'),
//                                 //     //           clothingList(text: ' - Scarves'),
//                                 //     //           clothingList(text: ' - Jwellery'),
//                                 //     //           clothingList(text: ' - Other'),
//                                 //     //           clothingList(text: ' - Bags'),
//                                 //     //         ],
//                                 //     //       )
//                                 //     //     : Container(),
//                                 //     // clothingList(text: 'Gifts'),
//                                 //     Divider(height: 1.h,thickness: 1,)
//                                 //   ],
//                                 // ),
//                               // ListTile(
//                               //   onTap: () {
//                               //     setState(() {
//                               //       country = !country;
//                               //     });
//                               //   },
//                               //   dense: true,
//                               //   visualDensity: VisualDensity(vertical: 0),
//                               //   title: Text(
//                               //     'Country',
//                               //     style: TextStyle(fontWeight: FontWeight.bold),
//                               //   ),
//                               //   trailing: !country
//                               //       ? Icon(Icons.arrow_forward_ios)
//                               //       : Icon(
//                               //           Icons.keyboard_arrow_down_sharp,
//                               //           size: 28.sp,
//                               //         ),
//                               // ),
//                               // Divider(
//                               //   height: 1,
//                               //   thickness: 1,
//                               // ),
//                               // if (country)
//                               //   Column(
//                               //     children: [
//                               //       ListTile(
//                               //         minLeadingWidth: 5,
//                               //         dense: true,
//                               //         visualDensity:
//                               //             VisualDensity(vertical: -4),
//                               //         leading: Image.asset(
//                               //           'assets/icons/united-kingdom.png',
//                               //           height: 15.sp,
//                               //         ),
//                               //         title: Align(
//                               //           alignment: Alignment(-1.08, 0),
//                               //           child: Text(
//                               //             'UK',
//                               //             style: TextStyle(
//                               //                 color: Color(0XFF5F5F5F)),
//                               //           ),
//                               //         ),
//                               //       ),
//                               //       ListTile(
//                               //         minLeadingWidth: 5,
//                               //         dense: true,
//                               //         visualDensity:
//                               //             VisualDensity(vertical: -4),
//                               //         leading: Image.asset(
//                               //           'assets/icons/united-states-of-america.png',
//                               //           height: 15.sp,
//                               //         ),
//                               //         title: Align(
//                               //           alignment: Alignment(-1.16, 0),
//                               //           child: Text(
//                               //             'United States of America',
//                               //             style: TextStyle(
//                               //                 color: Color(0XFF5F5F5F)),
//                               //           ),
//                               //         ),
//                               //       ),
//                               //       ListTile(
//                               //         minLeadingWidth: 5,
//                               //         dense: true,
//                               //         visualDensity:
//                               //             VisualDensity(vertical: -4),
//                               //         leading: Image.asset(
//                               //           'assets/icons/china.png',
//                               //           height: 15.sp,
//                               //         ),
//                               //         title: Align(
//                               //           alignment: Alignment(-1.08, 0),
//                               //           child: Text(
//                               //             'China',
//                               //             style: TextStyle(
//                               //                 color: Color(0XFF5F5F5F)),
//                               //           ),
//                               //         ),
//                               //       ),
//                               //       ListTile(
//                               //         minLeadingWidth: 5,
//                               //         dense: true,
//                               //         visualDensity:
//                               //             VisualDensity(vertical: -4),
//                               //         leading: Image.asset(
//                               //           'assets/icons/japan.png',
//                               //           height: 15.sp,
//                               //         ),
//                               //         title: Align(
//                               //           alignment: Alignment(-1.08, 0),
//                               //           child: Text(
//                               //             'Japan',
//                               //             style: TextStyle(
//                               //                 color: Color(0XFF5F5F5F)),
//                               //           ),
//                               //         ),
//                               //       ),
//                               //       ListTile(
//                               //         minLeadingWidth: 5,
//                               //         dense: true,
//                               //         visualDensity:
//                               //             VisualDensity(vertical: -4),
//                               //         leading: Image.asset(
//                               //           'assets/icons/czech-republic.png',
//                               //           height: 15.sp,
//                               //         ),
//                               //         title: Align(
//                               //           alignment: Alignment(-1.08, 0),
//                               //           child: Text(
//                               //             'Czech-Republic',
//                               //             style: TextStyle(
//                               //                 color: Color(0XFF5F5F5F)),
//                               //           ),
//                               //         ),
//                               //       ),
//                               //       Divider(height: 1.h,thickness: 1,)
//                               //     ],
//                               //   )
//                             ],
//                           ),
//                         ),
//                       // ListTile(
//                       //   leading: Image.asset(
//                       //     'assets/icons/settings.png',
//                       //     color: Color(0xFF5F5F5F),
//                       //     height: 18.sp,
//                       //   ),
//                       //   title: Text('Settings',style: TextStyle(color: Color(0XFF5F5F5F)),),
//                       //   onTap: () {
//                       //     Get.to(languageMain());
//                       //   },
//                       // ),
//                       // ListTile(
//                       //   leading: Image.asset(
//                       //     'assets/icons/contact.png',
//                       //     color: Color(0xFF5F5F5F),
//                       //     height: 18.sp,
//                       //   ),
//                       //   title: Text('Terms and Condition',style: TextStyle(color: Color(0XFF5F5F5F)),),
//                       //   onTap: () {},
//                       // ),
//                       // ListTile(
//                       //   leading: Image.asset(
//                       //     'assets/icons/privacy-policy.png',
//                       //     color: Color(0xFF5F5F5F),
//                       //     height: 18.sp,
//                       //   ),
//                       //   title: Text('Privacy Policy',style: TextStyle(color: Color(0XFF5F5F5F)),),
//                       //   onTap: () {},
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   ListTile clothingList({required String text}) {
//     return ListTile(
//       dense: true,
//       visualDensity: VisualDensity(vertical: -4),
//       title: Text(
//         '$text',
//         style: TextStyle(color: Color(0XFF5F5F5F)),
//       ),
//     );
//   }
//
//   ListTile buildListTile({required bool checks, required String text}) {
//     return ListTile(
//       onTap: () {
//         setState(() {
//           checks = !checks;
//         });
//       },
//       dense: true,
//       visualDensity: VisualDensity(vertical: 0),
//       title: Text(
//         '$text',
//         style: TextStyle(fontWeight: FontWeight.bold),
//       ),
//       trailing: !checks
//           ? Padding(
//               padding: const EdgeInsets.only(right: 8.0),
//               child: Image.asset(
//                 'assets/icons/plus-2.png',
//                 height: 10.sp,
//                 color: Color(0XFF5F5F5F),
//               ),
//             )
//           : Padding(
//               padding: const EdgeInsets.only(right: 8.0),
//               child: Image.asset(
//                 'assets/icons/minus.png',
//                 height: 10.sp,
//                 color: Color(0XFF5F5F5F),
//               ),
//             ),
//     );
//   }
//
//   Column iconCounter(
//       {required String labelTexts,
//       required int counter,
//       required Widget image}) {
//     return Column(
//       children: [
//         Container(
//           height: 9.h,
//           width: 9.h,
//           decoration: BoxDecoration(
//             color: Colors.black,
//             borderRadius: BorderRadius.all(Radius.circular(8)),
//           ),
//           child: Stack(alignment: Alignment.center, children: [
//             Center(
//               child: image,
//             ),
//             counter > 0
//                 ? Stack(children: [
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 38.0, left: 28),
//                       child: Container(
//                         height: 16,
//                         width: 16,
//                         decoration: BoxDecoration(
//                             color: Colors.red,
//                             borderRadius: BorderRadius.circular(10)),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 30.0, top: 2.2),
//                       child: Text(
//                         '$counter',
//                         style: TextStyle(color: Colors.white, fontSize: 8),
//                       ),
//                     )
//                   ])
//                 : Container(),
//           ]),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 5.0),
//           child: Text(
//             '$labelTexts',
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//           ),
//         )
//       ],
//     );
//   }
// }

import 'package:af24client/main.dart';
import 'package:af24client/Api/globalVariables.dart';
import 'package:af24client/screens/Address/AddressList.dart';
import 'package:af24client/screens/AppLanguageSettings/languageMain.dart';
import 'package:af24client/screens/Cart/cart.dart';
import 'package:af24client/screens/Address/AddAddress.dart';
import 'package:af24client/screens/CategoryProduct/CategoryProduct.dart';
import 'package:af24client/screens/OrderHistory/OrderList.dart';
import 'package:af24client/screens/WishList/WishList.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../Api/Auth_af24.dart';
import '../../localization/languages/languages.dart';
import '../../navBar.dart';

class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  _categoryState createState() => _categoryState();
}

class _categoryState extends State<category> {
  int MainCategoryIndex = -1;
  int SubCategoryIndex = -1;

  fun() async {
    setState(() {
      loader = true;
    });
    await DataApiService.instance.getCategoriesList();
    setState(() {
      loader = false;
    });
  }

  bool loader = false;
  final spinkit = SpinKitSpinningLines(
    size: 5.h,
    color: Colors.black,
  );

  @override
  initState() {
    // TODO: implement initState
    fun();
    MainCategoryIndex = -1;
    SubCategoryIndex = -1;
    super.initState();
  }

  bool category = false;
  bool women = false;
  bool men = false;
  bool kids = false;
  bool brand = false;
  bool clothing = false;
  bool shoes = false;
  bool accessories = false;
  bool country = false;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState

    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: loader == true ? Colors.white : Colors.black,
        // appBar: AppBar(
        //   backgroundColor: Colors.black,
        //   leading: InkWell(
        //       onTap: (){
        //         Get.back();
        //       },
        //       child: Icon(Icons.arrow_back_rounded,color: Colors.white,)),
        // ),
        body: loader == true
            ? spinkit
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    width: MediaQuery.of(context).size.width,
                    height: 11.h,
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
                                Container(
                                  width: 30.w,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    Guest == 1
                                        ? Languages.of(context)!.GUEST
                                        : sellerinfo!.fName! +
                                            ' ' +
                                            sellerinfo!.lName.toString(),
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Guest == 1 ||
                                        sellerinfo!.image == null ||
                                        sellerinfo!.image == 'def.png' ||
                                        sellerinfo!.image == ''
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8),
                                        child: CircleAvatar(
                                          backgroundColor:
                                              Colors.white.withOpacity(0.7),
                                          maxRadius: 18,
                                          child: Image.asset(
                                            'assets/icons/My Page.png',
                                            height: 7.h,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8.0, left: 8.0),
                                        child: ClipOval(
                                          child: CachedNetworkImage(
                                            height: 9.0.h,
                                            width: 9.0.h,
                                            imageUrl:
                                                'https://becknowledge.com/af24/public/storage/profile/' +
                                                    sellerinfo!.image
                                                        .toString(),
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) =>
                                                shimmerCategoryLoader(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Image.asset(
                                              height: 9.0.h,
                                              width: 9.0.h,
                                              'assets/images/NoPic.jpg',
                                            ),
                                          ),
                                          //Image.network('https://becknowledge.com/af24/public/storage/profile/'+sellerinfo!.image.toString(),height: 9.0.h,width: 9.0.h,fit: BoxFit.fill)),
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: ListView(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12.0, bottom: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(OrderList());
                                    },
                                    child: iconCounter(
                                        counter: 0,
                                        image: Image.asset(
                                          'assets/icons/bag.png',
                                          height: 35.sp,
                                        ),
                                        labelTexts: Languages.of(context)!.Orders),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(Carts());
                                    },
                                    child: iconCounter(
                                        counter: Guest == 1 ? 0 : cartCount,
                                        image: Image.asset(
                                          'assets/icons/shopping-cart.png',
                                          height: 35.sp,
                                        ),
                                        labelTexts: Languages.of(context)!.CART),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      Get.to(WishList());
                                    },
                                    child: iconCounter(
                                        counter: 0,
                                        image: Image.asset(
                                          'assets/icons/wishlist.png',
                                          height: 35.sp,
                                        ),
                                        labelTexts: Languages.of(context)!.WISHLIST),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(AddressList());
                              },
                              child: ListTile(
                                leading: Image.asset(
                                  'assets/icons/address.png',
                                  color: Color(0xFF5F5F5F),
                                  height: 18.sp,
                                ),
                                title: Text(Languages.of(context)!.ADDRESS),
                              ),
                            ),
                            ListTile(
                              leading: Image.asset(
                                'assets/icons/category.png',
                                color: Color(0xFF5F5F5F),
                                height: 18.sp,
                              ),
                              title: Text(Languages.of(context)!.ALL_CATEGORY),
                              onTap: () {
                                setState(() {
                                  category = !category;
                                });
                              },
                            ),
                            if (category)
                              for (int mainCategory = 0;
                                  mainCategory < categoriesList.length;
                                  mainCategory++)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12.0, right: 12),
                                  child: Column(
                                    children: [
                                      Divider(
                                        height: 1,
                                        thickness: 1,
                                      ),
                                      ListTile(
                                        onTap: () {
                                          setState(() {
                                            if (MainCategoryIndex ==
                                                mainCategory) {
                                              MainCategoryIndex = -1;
                                            } else {
                                              MainCategoryIndex = mainCategory;
                                            }
                                          });
                                        },
                                        dense: true,
                                        visualDensity:
                                            VisualDensity(vertical: 0),
                                        title: Text(
                                          categoriesList[mainCategory].name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            fontSize: 13.sp
                                          ),
                                        ),
                                        trailing: MainCategoryIndex !=
                                                mainCategory
                                            ? Icon(Icons.arrow_forward_ios)
                                            : Icon(
                                                Icons.keyboard_arrow_down_sharp,
                                                size: 28.sp,
                                              ),
                                      ),
                                      if (MainCategoryIndex == mainCategory)
                                        Column(
                                          children: [
                                            for (int subCategoty = 0;
                                                subCategoty <
                                                    categoriesList[mainCategory]
                                                        .childes
                                                        .length;
                                                subCategoty++)
                                              Column(
                                                children: [
                                                  Divider(
                                                    height: 1.h,
                                                    thickness: 1,
                                                  ),
                                                  ListTile(
                                                    onTap: () {
                                                      setState(() {
                                                        SubCategoryIndex =
                                                            subCategoty;
                                                      });
                                                      Get.to(()=>CategoryProduct(categoriesList[mainCategory].childes[subCategoty].id,categoriesList[mainCategory].childes[subCategoty].name));
                                                    },
                                                    dense: true,
                                                    visualDensity:
                                                        VisualDensity(
                                                            vertical: -4),
                                                    title: Text(
                                                      categoriesList[
                                                              mainCategory]
                                                          .childes[subCategoty]
                                                          .name,
                                                      style: TextStyle(
                                                          color: Color(
                                                              0XFF5F5F5F)),
                                                    ),
                                                    // trailing: !shoes
                                                    //     ? Padding(
                                                    //         padding:
                                                    //             const EdgeInsets
                                                    //                     .only(
                                                    //                 right: 8.0),
                                                    //         child: Image.asset(
                                                    //           'assets/icons/plus-2.png',
                                                    //           height: 10.sp,
                                                    //           color: Color(
                                                    //               0XFF5F5F5F),
                                                    //         ),
                                                    //       )
                                                    //     : Padding(
                                                    //         padding:
                                                    //             const EdgeInsets
                                                    //                     .only(
                                                    //                 right: 8.0),
                                                    //         child: Image.asset(
                                                    //           'assets/icons/minus.png',
                                                    //           height: 10.sp,
                                                    //           color: Color(
                                                    //               0XFF5F5F5F),
                                                    //         ),
                                                    //       ),
                                                  ),
                                                  // SubCategoryIndex == subCategoty
                                                  //     ? Column(
                                                  //   children: [
                                                  //     clothingList(
                                                  //         text: ' - Show all'),
                                                  //     clothingList(
                                                  //         text: ' - Scents'),
                                                  //     clothingList(
                                                  //         text: ' - Belts'),
                                                  //     clothingList(
                                                  //         text:
                                                  //         ' - Hats & Caps'),
                                                  //     clothingList(
                                                  //         text: ' - Scarves'),
                                                  //     clothingList(
                                                  //         text: ' - Jwellery'),
                                                  //     clothingList(
                                                  //         text: ' - Other'),
                                                  //     clothingList(
                                                  //         text: ' - Bags'),
                                                  //   ],
                                                  // )
                                                  //     : Container(),

                                                ],
                                              )
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12.0),
                              child: Divider(
                                height: 1,
                                thickness: 1,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  ListTile clothingList({required String text}) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity(vertical: -4),
      title: Text(
        '$text',
        style: TextStyle(color: Color(0XFF5F5F5F)),
      ),
    );
  }

  ListTile buildListTile({required bool checks, required String text}) {
    return ListTile(
      onTap: () {
        setState(() {
          checks = !checks;
        });
      },
      dense: true,
      visualDensity: VisualDensity(vertical: 0),
      title: Text(
        '$text',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: !checks
          ? Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(
                'assets/icons/plus-2.png',
                height: 10.sp,
                color: Color(0XFF5F5F5F),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(
                'assets/icons/minus.png',
                height: 10.sp,
                color: Color(0XFF5F5F5F),
              ),
            ),
    );
  }

  Column iconCounter(
      {required String labelTexts,
      required int counter,
      required Widget image}) {
    return Column(
      children: [
        Container(
          height: 9.h,
          width: 9.h,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Stack(
              alignment: Alignment.topRight, children: [
            Center(
              child: image,
            ),
            counter > 0
                ?
            Container(
              margin: EdgeInsets.only(top: 3.0,right: 3.0),
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                              '$counter',
                              style: TextStyle(color: Colors.white, fontSize: 8),
                            ),
              ),
            )
            // Stack(
            //     children: [
            //         Padding(
            //           padding: const EdgeInsets.only(bottom: 38.0, left: 28),
            //           child: Container(
            //             height: 16,
            //             width: 16,
            //             decoration: BoxDecoration(
            //                 color: Colors.red,
            //                 borderRadius: BorderRadius.circular(10)),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 30.0, top: 2.2),
            //           child: Text(
            //             '$counter',
            //             style: TextStyle(color: Colors.white, fontSize: 8),
            //           ),
            //         )
            //       ])
                : Container(),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            '$labelTexts',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
