import 'package:af24client/localization/languages/languages.dart';
import 'package:af24client/Api/globalVariables.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/refresh/pull_to_refresh/src/smart_refresher.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Api/Auth_af24.dart';
import '../../Models/ProductDetailsList.dart';
import '../../Provider/cartProvider.dart';
import '../../navBar.dart';
import '../../newBar.dart';
import '../Cart/cart.dart';
import '../Product Detail/ProductDetailsScreen.dart';


class LatestProductsScreen extends StatefulWidget {
  const LatestProductsScreen({Key? key}) : super(key: key);

  @override
  _LatestProductsScreenState createState() => _LatestProductsScreenState();
}

class _LatestProductsScreenState extends State<LatestProductsScreen> {
  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  Future<void> _pullRefresh() async {
    fun();
    _refreshController.refreshCompleted();
  }
  bool loader = false;
  final spinkit = SpinKitSpinningLines(
    size: 5.h,
    color: Colors.black,
  );
  fun() async {
    setState(() {
      loader = true;
    });
    await DataApiService.instance.getLatestProducts();
    setState(() {
      loader = false;
    });
    if(Guest == 1)
      {

      }
    else
      {
        await DataApiService.instance.getCartCount(sellerinfo!.id!.toInt());
      }
  }
  initState() {
    // TODO: implement initState
    fun();
    super.initState();
  }
  final List<String> BrandName = [
    'Dior',
    'CHANEL',
    'Madam Queen SHOP',
  ];
  final List<String> Guide = [
    'CHANEL 2022 Easy-to-Use Guide Guide (Must-read) .....',
  ];
  final List<String> Country = [
    'Czech Republic',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Get.offAll(() => newBar(index: 0));
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
          child: Text(Languages.of(context)!.LATEST_PRODUCTS_TITLE,
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        actions: [
          SizedBox(
            width: 3.w,
          ),
          InkWell(
            onTap: () async {
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
      loader == true ? spinkit :
          latestProducts.length == 0 
        ?
              Center(child: Text(Languages.of(context)!.PRODUCT_FOUND,style: TextStyle(fontSize: 13.sp),))
              :
      SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        controller: _refreshController,
        onRefresh: _pullRefresh,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(Languages.of(context)!.NEW_PRODUCTS_COUNT+' ('+'${latestProducts.length}'+')',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),),
                    ),
                  ],
                ),

                GridView.builder(
                  itemCount: latestProducts.length,
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
                                // await DataApiService.instance.getProductDetails(latestProducts[index].slug);
                               Get.to(ProductDetailsScreen(latestProducts[index].slug.toString()));
                              },
                              child: Column(

                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child:
                                            latestProducts[index]
                                                .secretComment == 0 ?
                                            Container(height: 11.sp,)
                                                :
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      right: 2.0),
                                                  child: Text(
                                                    latestProducts[index]
                                                        .secretComment >= 100 ?
                                                    "99+"
                                                        :
                                                    latestProducts[index]
                                                        .secretComment
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.4),
                                                      fontSize: 10.sp,
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      // _incrementCounter();
                                                    },
                                                    child: Image.asset(
                                                      "assets/icons/Seller app icon (12).png",
                                                      height: 11.sp,
                                                      color:
                                                      Colors.grey[500],
                                                    )),
                                              ],
                                            )
                                        ),
                                        // Row(
                                        //   children: [
                                        //     Text(
                                        //       '$_counter',
                                        //       style: TextStyle(
                                        //         color: Colors.black
                                        //             .withOpacity(0.4),
                                        //         fontSize: 10.sp,
                                        //       ),
                                        //     ),
                                        //     Padding(
                                        //       padding:
                                        //           const EdgeInsets.only(
                                        //               left: 2.0),
                                        //       child: Container(
                                        //         child: InkWell(
                                        //             onTap: () {
                                        //               // _incrementCounter();
                                        //             },
                                        //             child: Image.asset(
                                        //               "assets/icons/Seller app icon (13).png",
                                        //               height: 11.sp,
                                        //               color: Colors
                                        //                   .grey[500],
                                        //             )),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      CachedNetworkImage(
                                        height: 15.h,
                                        width: 40.w,
                                        imageUrl:
                                        'http://becknowledge.com/af24/storage/app/public/product/'+latestProducts[index].images[0].toString(),
                                        fit: BoxFit.scaleDown,
                                        placeholder: (context, url) =>
                                            shimmerCategoryLoader(),
                                        errorWidget:
                                            (context, url, error) =>
                                            Image.asset(
                                              'assets/images/NoPic.jpg',
                                              height: 15.h,
                                              width: 40.h,
                                            ),
                                      )
                                      // Image.network('http://becknowledge.com/af24/storage/app/public/product/'+latestProducts[index].images[0].toString(), height:15.h,width: 40.w, fit: BoxFit.fill,),
                                    ],
                                  ),
                                  SizedBox(height: 1.0.h,),
                                  Row(
                                    children: [
                                      Container(
                                          width: 40.w,
                                          child: Text('${latestProducts[index].brand.name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),overflow: TextOverflow.ellipsis,maxLines: 1,)),
                                    ],
                                  ),
                                  SizedBox(height: 0.1.h,),
                                  Row(
                                    children: [
                                      Container(
                                          width: 40.w,
                                          child: Text('${latestProducts[index].name}',style: TextStyle(fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 1,)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text('${latestProducts[index].unitPrice}',style: TextStyle(height: 0.2.h,fontWeight: FontWeight.bold,color: Colors.red),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                  Text(
                                    '€',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.red
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
                    mainAxisExtent: 32.h,
                  ),
                  padding: EdgeInsets.all(5),
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
