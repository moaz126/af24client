import 'package:af24client/Api/globalVariables.dart';
import 'package:af24client/screens/Product%20Detail/ProductDetailsScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Api/Auth_af24.dart';
import '../../localization/languages/languages.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  bool loader = false;
  callApi() async {
    setState(() {
      loader = true;
    });

    await DataApiService.instance.getWishList();
    setState(() {
      loader = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    callApi();

    super.initState();
  }

  final spinkit = SpinKitSpinningLines(
    size: 5.h,
    color: Colors.black,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
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
                "Your WishList",
                style: TextStyle(color: Colors.black),
              ),
              // Text(
              //   wishList.isEmpty
              //       ? '0 item'
              //       : wishList.length.toString() + ' items',
              //   style: Theme.of(context).textTheme.caption,
              // ),
            ],
          ),
        ),
        actions: [
          // InkWell(
          //   onTap: () async {
          //     setState(() {
          //       // wishList = [];
          //     });
          //     // await DataApiService.instance.deleteAllCart();
          //   },
          //   child: Container(
          //     padding: EdgeInsets.only(right: 10),
          //     alignment: Alignment.center,
          //     child:
          //     // Text(
          //     //   "Delete All",
          //     //   style: TextStyle(color: Colors.black),
          //     // ),
          //     Icon(Icons.delete,color: Colors.red.withOpacity(0.9),),
          //   ),
          // ),
        ],
      ),
      body: Guest == 1
          ? Center(
              child: Container(
                child: Text(Languages.of(context)!.LOGIN_FIRST),
              ),
            )
          : loader
              ? spinkit
              : wishList.isEmpty
                  ? Center(
                      child: Text('WishList is Empty'),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: (20 / 375.0) * 100.w),
                      child: ListView.builder(
                        itemCount: wishList.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 3),
                          child: Dismissible(
                            key: Key(wishList[index].id.toString()),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) async {
                              await DataApiService.instance.removeFromWishList(
                                  wishList[index].productId.toString(),
                                  context);
                              setState(() {
                                wishList.removeAt(index);
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
                            child: InkWell(
                              onTap: () {
                                Get.to(() => ProductDetailsScreen(
                                    wishList[index].product.slug));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 88,
                                      child: AspectRatio(
                                        aspectRatio: 1.0,
                                        child: Container(
                                          padding: EdgeInsets.all(
                                              (10 / 375.0) * 100.w),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                'https://becknowledge.com/af24/public/storage/product/thumbnail/' +
                                                    wishList[index]
                                                        .Details
                                                        .thumbnail
                                                        .toString(),
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                shimmerCategoryLoader(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Image.asset(
                                              'assets/images/NoPic.jpg',
                                            ),
                                          ),
                                          // Image.network('https://becknowledge.com/af24/public/storage/product/thumbnail/ '+ wishList[index].Details.thumbnail.toString()),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Container(
                                          width: 50.w,
                                          child: Text(
                                            wishList[index].Details.name,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: wishList[index]
                                                    .Details
                                                    .unitPrice
                                                    .toString() +
                                                '€',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15.sp,
                                                color: Colors.red),
                                            children: [
                                              /*   TextSpan(
                                        text: " x2",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1), */
                                            ],
                                          ),
                                        ),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //   MainAxisAlignment.spaceEvenly,
                                        //   children: [
                                        //     InkWell(
                                        //         onTap: () async {
                                        //           // setState(() {
                                        //           //   getCartlist[index].quantity--;
                                        //           // });
                                        //           // await DataApiService.instance
                                        //           //     .updateCart(
                                        //           //     getCartlist[index]
                                        //           //         .id
                                        //           //         .toString(),
                                        //           //     getCartlist[index]
                                        //           //         .quantity
                                        //           //         .toString(),
                                        //           //     context);
                                        //         },
                                        //         child: Container(
                                        //             decoration: BoxDecoration(
                                        //               color: Colors.grey.shade100,
                                        //               borderRadius: BorderRadius.circular(100),
                                        //             ),
                                        //             child: Icon(Icons.remove))),
                                        //     SizedBox(width: 1.w,),
                                        //     Container(
                                        //       alignment: Alignment.center,
                                        //       height: 20,
                                        //       child: Text(wishList[index]
                                        //           .Details.unitPrice
                                        //           .toString()),
                                        //     ),
                                        //     SizedBox(width: 1.w,),
                                        //     InkWell(
                                        //         onTap: () async {
                                        //           // setState(() {
                                        //           //   getCartlist[index].quantity++;
                                        //           // });
                                        //           // await DataApiService.instance
                                        //           //     .updateCart(
                                        //           //     getCartlist[index]
                                        //           //         .id
                                        //           //         .toString(),
                                        //           //     getCartlist[index]
                                        //           //         .quantity
                                        //           //         .toString(),
                                        //           //     context);
                                        //         },
                                        //         child: Container(
                                        //             decoration: BoxDecoration(
                                        //               color: Colors.grey.shade100,
                                        //               borderRadius: BorderRadius.circular(100),
                                        //             ),
                                        //             child: Icon(Icons.add)))
                                        //   ],
                                        // ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                        onTap: () async {
                                          DataApiService.instance
                                              .removeFromWishList(
                                                  wishList[index]
                                                      .productId
                                                      .toString(),
                                                  context);
                                          setState(() {
                                            wishList.removeAt(index);
                                          });
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red.withOpacity(0.9),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
    );
  }
}
