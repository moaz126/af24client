import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Api/Auth_af24.dart';
import '../../Provider/cartProvider.dart';
import '../../localization/languages/languages.dart';
import '../../Api/globalVariables.dart';
import '../Cart/cart.dart';
import '../Product Detail/ProductDetailsScreen.dart';


class BestProductsScreen extends StatefulWidget {
  const BestProductsScreen({Key? key}) : super(key: key);

  @override
  State<BestProductsScreen> createState() => _BestProductsScreenState();
}

class _BestProductsScreenState extends State<BestProductsScreen> {
  bool loader = false;
  final spinkit = SpinKitSpinningLines(
    size: 5.h,
    color: Colors.black,
  );
  fun() async {
    setState(() {
      loader = true;
    });
    await DataApiService.instance.getBestSellings();
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Text(Languages.of(context)!.BEST_PRODUCTS,
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
          bestSellings.length == 0
        ?
              Center(child: Text(Languages.of(context)!.PRODUCT_FOUND,style: TextStyle(fontSize: 13.sp),))
              :
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(Languages.of(context)!.NEW_PRODUCTS_COUNT+'('+'${bestSellings.length}'+')',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),),
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
                itemCount: bestSellings.length,
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
                              Get.to(ProductDetailsScreen(bestSellings[index].slug.toString()));
                            },
                            child: Column(

                              children: [
                                Row(
                                  children: [
                                    CachedNetworkImage(
                                      height: 15.h,
                                      width: 40.w,
                                      imageUrl:
                                      'http://becknowledge.com/af24/storage/app/public/product/'+bestSellings[index].images[0].toString(),
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
                                Row(
                                  children: [
                                    Container(
                                        width: 30.w,
                                        child: Text('${bestSellings[index].brand.name}',style: TextStyle(fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 1,)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: 30.w,
                                        child: Text('${bestSellings[index].name}',style: TextStyle(fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 1,)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text('${bestSellings[index].unitPrice}',style: TextStyle(height: 0.2.h,fontWeight: FontWeight.bold,color: Colors.red),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                Text(
                                  '€',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.red
                                  ),
                                )
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
                  mainAxisExtent: 28.h,
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
