import 'package:af24client/Api/Auth_af24.dart';
import 'package:af24client/screens/Cart/cart.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Models/ProductDetailsList.dart';
import '../../Provider/cartProvider.dart';
import '../../localization/languages/languages.dart';
import '../../Api/globalVariables.dart';
import '../../navBar.dart';
import '../LoginCreateAccount/login.dart';
import '../Product Detail/ProductDetailsScreen.dart';

class brand extends StatefulWidget {
  final int index;
  brand(this.index);


  @override
  _brandState createState() => _brandState();
}

class _brandState extends State<brand> {
  bool loader = false;
  bool Followloader = false;
  bool Productloader = false;
  bool CheckFollow()
  {
    for(int i=0; i<FollowSellers.length;i++)
    {
      if(FollowSellers[i]==allSellers[widget.index].sellerId.toString())
      {
        return true;
      }
    }
    return false;
  }
  final Productspinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.black,
  );

  final Followspinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.black,
  );
  final spinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.white,
  );
  final List<String> BrandName = [
    'Dior',
    'CHANEL',
    'Madam Queen SHOP',
  ];
  final List<String> Guide = [
    '',
  ];
  final List<String> Country = [
    'Czech Republic',
  ];
  fun()
  async {
    setState(() {
      Followloader = true;
      Productloader = true;
    });
    await DataApiService.instance
        .getSellerProductsList(allSellers[widget.index].sellerId);
    setState(() {
      Productloader = false;
    });
    if(Guest == 1)
      {
        setState(() {
          Followloader = false;
        });
      }
    else
    {
      await DataApiService.instance
          .getSellerFollowList(sellerinfo!.id.toString());

      setState(() {
        Followloader = false;
      });
      await DataApiService.instance.getCartCount(sellerinfo!.id!.toInt());
      setState(() {});
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    fun();
    super.initState();
  }
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
          child: Text(allSellers[widget.index].name,
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
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        // Image.asset(
                        //   'assets/icons/Seller app icon (7).png',
                        //   height: 9.h,
                        // ),
                        ClipOval(
                          child:
                          CachedNetworkImage(
                            height: 9.0.h,
                            width: 9.0.h,
                            imageUrl:
                            'https://becknowledge.com/af24/public/storage/shop/'+allSellers[widget.index].image,
                            fit: BoxFit.contain,
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
                    // allSellers[widget.index].image == "def.png" || allSellers[widget.index].image == '' ?
                    //     Image.asset('assets/icons/Seller app icon (8).png',height: 9.h,width: 9.h,fit: BoxFit.cover,)
                    //     :
                    //       Image.network(height: 9.h,width: 9.h,fit: BoxFit.cover,'https://becknowledge.com/af24/public/storage/shop/'+allSellers[widget.index].image),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2.w),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${allSellers[widget.index].name}',
                                  style: TextStyle(fontSize: 1.7.h,fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(right: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/icons/Seller app icon (15).png',
                                        height: 2.h,
                                      ),
                                      SizedBox(
                                        width: 0.3.h,
                                      ),
                                      Container(
                                        width: 20.w,
                                        child: Text('${allSellers[widget.index].address}',
                                            style: TextStyle(fontSize: 1.7.h,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Followloader == true ? Followspinkit :
                  Container(
                    width: 30.w,
                    child: ElevatedButton(
                      onPressed: () async {
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
                        else
                        {
                                setState(() {
                                  loader = true;
                                });
                                await DataApiService.instance
                                    .requestFollowSeller(
                                        allSellers[widget.index]
                                            .sellerId
                                            .toString(),
                                        sellerinfo!.id.toString());
                                await DataApiService.instance
                                    .getSellerFollowList(
                                        sellerinfo!.id.toString());
                                setState(() {
                                  loader = false;
                                });
                                StatusCode != '200'
                                    ? AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.ERROR,
                                        animType: AnimType.BOTTOMSLIDE,
                                        title: Languages.of(context)!.ERROR,
                                        desc: Languages.of(context)!.ERROR,
                                        btnOkOnPress: () {},
                                      ).show()
                                    : AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.SUCCES,
                                        animType: AnimType.BOTTOMSLIDE,
                                        title: Languages.of(context)!.SUCCESS,
                                        desc: Languages.of(context)!.REQUEST_COMPLETED,
                                        btnOkOnPress: () {},
                                      ).show();
                              }
                            },
                      child:
                      loader == true ? spinkit :
                          Guest == 1 ? Text(Languages.of(context)!.FOLLOW) :
                      CheckFollow() ?
                      Text(Languages.of(context)!.UN_FOLLOW) :
                      Text(Languages.of(context)!.FOLLOW),
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.black)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Expanded(child: Text(maxLines: 1,'${Guide[0]}',overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 11.sp,fontWeight: FontWeight.bold),)),
                  ],
                ),
              ),
              SizedBox(height: 0.7.h,),
              Divider(height: 5.h,color: Colors.grey[200],thickness: 1.h,),
              Row(
                children: [
                  Text(Languages.of(context)!.PRODUCT + ' ('+'${sellerProducts.length}'+')',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),),
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

              Productloader == true ? Productspinkit :
              GridView.builder(
                itemCount: sellerProducts.length,
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
                              // await DataApiService.instance.getProductDetails(sellerProducts[index].slug);
                              Get.to(ProductDetailsScreen(sellerProducts[index].slug.toString()));
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child:
                                          sellerProducts[index]
                                              .secretComments == 0 ?
                                          Container(height: 11.sp,)
                                              :
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    right: 2.0),
                                                child: Text(
                                                  sellerProducts[index]
                                                      .secretComments >= 100 ?
                                                  "99+"
                                                      :
                                                  sellerProducts[index]
                                                      .secretComments
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
                                      'https://becknowledge.com/af24/public/storage/product/'+sellerProducts[index].images[0].toString(),
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
                                    //Image.network('https://becknowledge.com/af24/public/storage/product/'+sellerProducts[index].images[0].toString(), height:15.h,width: 40.w,fit: BoxFit.fitWidth,),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(width: 40.w, child: Text('${sellerProducts[index].brand.name}',style: TextStyle(fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(width: 40.w, child: Text('${sellerProducts[index].name}',style: TextStyle(fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,)),
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
                          SizedBox(height: 0.5.h,),
                          Container(
                            child: Row(
                              children: [
                                Text('${sellerProducts[index].unitPrice}',style: TextStyle(height: 0.2.h,fontWeight: FontWeight.bold,color: Colors.red),maxLines: 2,overflow: TextOverflow.ellipsis,),
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
