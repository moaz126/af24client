import 'package:af24client/Api/globalVariables.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Api/Auth_af24.dart';
import '../../Models/ProductDetailsList.dart';
import '../../Provider/cartProvider.dart';
import '../../localization/languages/languages.dart';
import '../Brand/brand.dart';

import '../Cart/cart.dart';

class AllSellers extends StatefulWidget {
  const AllSellers({Key? key}) : super(key: key);

  @override
  State<AllSellers> createState() => _AllSellersState();
}

class _AllSellersState extends State<AllSellers> {
  fun() async {
    setState(() {
      loader = true;
    });
    await DataApiService.instance.getAllSellersList();
    setState(() {
      loader = false;
    });
    if(Guest == 1 )
      {

      }
    else
      {
        await DataApiService.instance.getCartCount(sellerinfo!.id!.toInt());
      }

    setState(() {

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
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child:
          Padding(
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
          child: Text(Languages.of(context)!.ALL_SELLERS,
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
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(Languages.of(context)!.ALL_SELLERS+ ' ('+'${allSellers.length}'+')',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),),
                  ),
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
                itemCount: allSellers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                            // await DataApiService.instance
                            //     .getSellerProductsList(allSellers[index].sellerId);
                            Get.to(brand(index));
                          },
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipOval(
                                  child:
                                  CachedNetworkImage(
                                    height: 9.h,
                                    width: 9.h,
                                    imageUrl:
                                    'https://becknowledge.com/af24/public/storage/shop/' + allSellers[index].image,
                                    fit: BoxFit.contain,
                                    placeholder: (context, url) =>
                                        shimmerCategoryLoader(),
                                    errorWidget:
                                        (context, url, error) =>
                                        Image.asset(
                                          'assets/images/NoPic.jpg',
                                          height: 9.h,
                                          width: 9.h,
                                        ),
                                  ),
                                  // allSellers[index].image.toString() == "def.png" || allSellers[index].image.toString() == "" ?
                                  // Image.asset('assets/icons/Seller app icon (8).png',height: 9.h,width: 9.h,fit: BoxFit.cover,)
                                  //     :
                                  // Image.network(
                                  //     height: 9.h,
                                  //     width: 9.h,
                                  //     fit: BoxFit.cover,
                                  //     'https://becknowledge.com/af24/public/storage/shop/' +
                                  //         allSellers[index].image),
                                ),
                                SizedBox(
                                  height: 1.0.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 20.w,
                                      child: Text(
                                        '${allSellers[index].name}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 9.sp),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  mainAxisExtent: 17.h,
                ),
                shrinkWrap: true,
                physics: ScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
