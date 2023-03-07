import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/refresh/pull_to_refresh/src/smart_refresher.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Api/Auth_af24.dart';
import '../../Provider/cartProvider.dart';
import '../../localization/languages/languages.dart';
import '../../Api/globalVariables.dart';
import '../../navBar.dart';
import '../../newBar.dart';
import '../Cart/cart.dart';
import '../Product Detail/ProductDetailsScreen.dart';



class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({Key? key}) : super(key: key);

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {

  bool Screenloader = false;
  final Screenspinkit = SpinKitSpinningLines(
    size: 5.h,
    color: Colors.black,
  );
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        bottomNavigationBar:  newNavBar(
          index: 1,
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          titleSpacing: 0,
          elevation: 0,
          leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Icon(
                Icons.arrow_back_ios,
                size: 23,
                color: Colors.black,
                //Icon Size
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 9.0),
            child: Text('Search',
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          actions: [
            SizedBox(
              width: 3.w,
            ),
            InkWell(
              onTap: (){
                Get.to(Carts());
              },
              child: Consumer<MyCart>(builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 11.0),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image.asset(
                        'assets/icons/Seller app icon (6).png',
                        height: 4.5.h,
                      ),
                      // Container(
                      //   height: 12,
                      //   width: 12,
                      //   decoration: BoxDecoration(
                      //       color: Colors.orange[700],
                      //       borderRadius: BorderRadius.circular(10)),
                      // ),
                      Container(
                        height: 1.5.h,
                        padding: EdgeInsets.only(left: 1.5, right: 1),
                        decoration: BoxDecoration(
                            color: Colors.orange[700],
                            borderRadius: BorderRadius.circular(100)),
                        //color: Colors.blue,
                        child: Guest == 1
                            ? Text(
                          "0",
                          style:
                          TextStyle(color: Colors.black, fontSize: 8),
                        )
                            : Text(
                          value.getCartLength().toString(),
                          style:
                          TextStyle(color: Colors.black, fontSize: 8),
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body:
        Screenloader == true ? Screenspinkit :
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 0.7.h,),
                Row(
                  children: [
                    Text(Languages.of(context)!.PRODUCT + ' ('+'${searchProducts.length}'+')',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),),
                  ],
                ),
                // GridView(
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     crossAxisSpacing: 5,
                //     mainAxisSpacing: 5,
                //   ),
                //   children: [
                //     Card(
                //       color: Colors.green,
                //       child: Text("1", style: TextStyle(color: Colors.white,fontSize: 30),),
                //     ),
                //     Card(
                //       color: Colors.green,
                //       child: Text("2", style: TextStyle(color: Colors.white,fontSize: 30),),
                //     ),
                //     Card(
                //       color: Colors.green,
                //       child: Text("3", style: TextStyle(color: Colors.white,fontSize: 30),),
                //     ),
                //     Card(
                //       color: Colors.green,
                //       child: Text("4", style: TextStyle(color: Colors.white,fontSize: 30),),
                //     ),
                //   ],
                // )


                GridView.builder(
                  itemCount: searchProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade200),borderRadius: BorderRadius.circular(1.h)),
                      child:
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () async {
                                Get.to(ProductDetailsScreen(searchProducts[index].slug.toString()));
                              },
                              child: Column(

                                children: [
                                  Row(
                                    children: [
                                      CachedNetworkImage(
                                        height: 15.h,
                                        width: 40.w,
                                        imageUrl:
                                        'https://becknowledge.com/af24/public/storage/product/'+searchProducts[index].images[0],
                                        fit: BoxFit.fitWidth,
                                        placeholder: (context, url) =>
                                            shimmerCategoryLoader(),
                                        errorWidget:
                                            (context, url, error) =>
                                            Image.asset(
                                              'assets/images/NoPic.jpg',
                                              height: 15.h,
                                              width: 40.w,
                                            ),
                                      ),
                                      //Image.network('https://becknowledge.com/af24/public/storage/product/'+categoryProduct[index].images[0], height:15.h,width: 40.w,fit: BoxFit.fitWidth,),
                                    ],
                                  ),
                                  SizedBox(height: 1.h,),
                                  Row(
                                    children: [
                                      Container(width: 40.w, child: Text('${searchProducts[index].brand.name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                    ],
                                  ),
                                  SizedBox(height: 0.1.h,),
                                  Row(
                                    children: [
                                      Container(width: 40.w, child: Text('${searchProducts[index].name}',style: TextStyle(fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                    ],
                                  ),
                                  // SizedBox(height: 1.0.h,),
                                  // SizedBox(height: 0.7.h,),
                                  // Column(
                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   children: [
                                  //     Container(child: Text('${sellerProducts[index].details}',style: TextStyle(height: 0.16.h,color: Colors.black.withOpacity(0.6)),maxLines: 2,overflow: TextOverflow.ellipsis)),
                                  //   ],
                                  // ),

                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [

                                  Text('${searchProducts[index].unitPrice}',style: TextStyle(height: 0.2.h,fontWeight: FontWeight.bold,color: Colors.red),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                  Text(
                                    "€",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),


                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    mainAxisExtent: 31.h,
                  ),
                  padding: EdgeInsets.all(5),
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                )
              ],
            ),
          ),
        ),
      );
  }
}
