import 'package:af24client/Api/Urls.dart';
import 'package:af24client/navBar.dart';
import 'package:af24client/screens/Address/SelectAddressCheckOut.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Api/Auth_af24.dart';
import '../../Provider/cartProvider.dart';
import '../../localization/languages/languages.dart';
import '../../models/ConstFunctions.dart';
import '../../Api/globalVariables.dart';
import '../../newBar.dart';
import '../PaymentMethod/PaymentMethod.dart';
import '../WebView/WebView.dart';

class CheckOut extends StatefulWidget {
  final int index;

  CheckOut(this.index);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  bool loader = false;
bool Quantityloader = false;
  bool Buttonloader = false;

  callApi() async {
    setState(() {
      loader = true;
    });

    await DataApiService.instance.getcategorylist();
    countprice();
    setState(() {
      loader = false;
    });
  }

  countprice() {
    totalPrice = 0;
    for (var i = 0; i < getCartlist.length; i++) {
      totalPrice += getCartlist[i].price * getCartlist[i].quantity;
    }
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

  final Quantityspinkit = SpinKitSpinningLines(
    size: 5.h,
    color: Colors.black,
  );

  final Buttonspinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.white,
  );
  double totalPrice = 0;

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
        title: Text(
          Languages.of(context)!.CHECK_OUT,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Consumer<MyCart>(builder: (context, value, child) {
            return Center(
              child: Text(
                getCartlist.isEmpty
                    ? '0 item'
                    : value.getCartLength().toString() + ' items',
                style: Theme.of(context).textTheme.caption,
              ),
            );
          }),
          SizedBox(
            width: 10,
          ),
        ],
        // actions: [
        //   InkWell(
        //     onTap: () async {
        //       setState(() {
        //         getCartlist = [];
        //       });
        //       await DataApiService.instance.deleteAllCart();
        //     },
        //     child: Container(
        //       padding: EdgeInsets.only(right: 10),
        //       alignment: Alignment.center,
        //       child:
        //       // Text(
        //       //   "Delete All",
        //       //   style: TextStyle(color: Colors.black),
        //       // ),
        //       Icon(Icons.delete,color: Colors.red.withOpacity(0.9),),
        //     ),
        //   ),
        // ],
      ),
      body: loader
          ? spinkit
          : getCartlist.isEmpty
              ? Center(
                  child: Text(Languages.of(context)!.EMPTY_CART),
                )
              : Stack(
                children: [
                  Opacity(
        opacity: Quantityloader == true ? 0.1 : 1.0,
                    child: Stack(
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              widget.index == -1
                                  ? Padding(
                                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: (20 / 375.0) * 100.w),
                                        child: InkWell(
                                          onTap: () {
                                            Get.back();
                                            Get.to(SelectAddressCheckOut());
                                          },
                                          child: Container(
                                            width: 90.w,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10)),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.add_circle_outline),
                                                Text(Languages.of(context)!.ADD_ADDRESS),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: (20 / 375.0) * 100.w),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Row(
                                          children: [
                                            SizedBox(width: 3.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      Languages.of(context)!.NAME + ": ",
                                                      style: TextStyle(fontSize: 13.sp),
                                                    ),
                                                    Container(
                                                      width: 50.w,
                                                      child: Text(
                                                        addressList[widget.index]
                                                            .contactPersonName,
                                                        style: TextStyle(
                                                            color: Colors.black
                                                                .withOpacity(0.5),
                                                            fontSize: 11.sp),
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                    InkWell(
                                                        onTap: () {
                                                          Get.to(SelectAddressCheckOut());
                                                        },
                                                        child: Text(
                                                          Languages.of(context)!.CHANGE,
                                                          style: TextStyle(
                                                              color: Colors.blue,
                                                              fontSize: 12.sp),
                                                        ))
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(Languages.of(context)!.ADDRESS + ": ",
                                                        style:
                                                            TextStyle(fontSize: 13.sp)),
                                                    Container(
                                                      width: 65.w,
                                                      child: Text(
                                                        addressList[widget.index].address,
                                                        style: TextStyle(
                                                            color: Colors.black
                                                                .withOpacity(0.5),
                                                            fontSize: 11.sp),
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      Languages.of(context)!.ADDRESS_TYPE + ": ",
                                                      style: TextStyle(fontSize: 13.sp),
                                                    ),
                                                    Text(
                                                      addressList[widget.index]
                                                          .addressType,
                                                      style: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.5),
                                                          fontSize: 11.sp),
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text(
                                                      Languages.of(context)!.ZIP_CODE + ": ",
                                                      style: TextStyle(fontSize: 13.sp),
                                                    ),
                                                    Text.rich(
                                                      TextSpan(
                                                        text: addressList[widget.index]
                                                            .zip
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.black
                                                                .withOpacity(0.5),
                                                            fontSize: 11.sp),
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
                                          ],
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                  Get.to(() => PaymentMethod(widget.index));
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: (20 / 375.0) * 100.w, vertical: 8.0),
                                  child: Container(
                                    width: 90.w,
                                    height: 5.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.credit_card,
                                            color: Colors.blue,
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          PAYMENT_METHOD.value != ""
                                              ? Text(
                                                  PAYMENT_METHOD.value,
                                                  style: TextStyle(fontSize: 13.sp),
                                                )
                                              : Text(
                                            Languages.of(context)!.PAYMENT_METHOD,
                                                  style: TextStyle(fontSize: 13.sp),
                                                ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: getCartlist.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.symmetric(vertical: 3),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: (20 / 375.0) * 100.w),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 20.w,
                                                  child: AspectRatio(
                                                    aspectRatio: 0.88,
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
                                                                getCartlist[index]
                                                                    .thumbnail,
                                                        fit: BoxFit.fill,
                                                        placeholder: (context, url) =>
                                                            shimmerCategoryLoader(),
                                                        errorWidget:
                                                            (context, url, error) =>
                                                                Image.asset(
                                                          'assets/icons/My Page.png',
                                                          height: 20.h,
                                                          width: 20.h,
                                                        ),
                                                      ),
                                                      //Image.network('https://becknowledge.com/af24/public/storage/product/thumbnail/'+getCartlist[index].thumbnail),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 5.w),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Container(
                                                        width: 30.w,
                                                        child: Text(
                                                          getCartlist[index].name,
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16),
                                                          maxLines: 2,
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text.rich(
                                                            TextSpan(
                                                              text:
                                                                  getCartlist[index]
                                                                      .price
                                                                      .toString() + "€" ,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight.w600,
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
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(getCartlist[index].size +
                                                              ' - '),
                                                          Container(
                                                            height: 15,
                                                            width: 15,
                                                            color: HexColor(
                                                                getCartlist[index].color),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                    onTap: () async {
                                                      setState(() {
                                                        if (getCartlist[index].quantity >
                                                            1) {
                                                          getCartlist[index].quantity--;
                                                        } else {
                                                          getCartlist[index].quantity = 1;
                                                        }
                                                        setState(() {
                                                          Quantityloader = true;
                                                        });
                                                        countprice();
                                                      });
                                                      await DataApiService.instance
                                                          .updateCart(
                                                              getCartlist[index]
                                                                  .id
                                                                  .toString(),
                                                              getCartlist[index]
                                                                  .quantity
                                                                  .toString(),
                                                              context);
                                                      setState(() {
                                                        Quantityloader = false;
                                                      });
                                                    },
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.grey.shade100,
                                                          borderRadius:
                                                              BorderRadius.circular(100),
                                                        ),
                                                        child: Icon(Icons.remove))),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  height: 20,
                                                  child: Text(getCartlist[index]
                                                      .quantity
                                                      .toString()),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                InkWell(
                                                    onTap: () async {
                                                      setState(() {
                                                        getCartlist[index].quantity++;
                                                        Quantityloader = true;
                                                      });
                                                      await DataApiService.instance
                                                          .updateCart(
                                                              getCartlist[index]
                                                                  .id
                                                                  .toString(),
                                                              getCartlist[index]
                                                                  .quantity
                                                                  .toString(),
                                                              context);
                                                      setState(() {
                                                        Quantityloader = false;
                                                        countprice();
                                                      });
                                                    },
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.grey.shade100,
                                                          borderRadius:
                                                              BorderRadius.circular(100),
                                                        ),
                                                        child: Icon(Icons.add))),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, right: 8.0),
                                              child: Divider(
                                                color: Colors.grey.withOpacity(0.5),
                                                thickness: 0.1.h,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, right: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    Languages.of(context)!.SUB_TOTAL,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Text(
                                                        getCartlist[index]
                                                            .price
                                                            .toString() + "€" ,
                                                    style: TextStyle(color: Colors.grey),
                                                  ),
                                                  Text(

                                                        (getCartlist[index].price *
                                                                getCartlist[index]
                                                                    .quantity)
                                                            .toString() + "€" ,
                                                    style: TextStyle(color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, right: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    Languages.of(context)!.TOTAL,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Text(

                                                        (getCartlist[index].price *
                                                                getCartlist[index]
                                                                    .quantity)
                                                            .toString() + "€" ,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: (15 / 375.0) * 100.w,
                                  horizontal: (30 / 375.0) * 100.w,
                                ),
                                // height: 174,
                                height: 10.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, -15),
                                      blurRadius: 20,
                                      color: Color(0xFFDADADA).withOpacity(0.15),
                                    )
                                  ],
                                ),
                                child: SafeArea(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          getCartlist.isEmpty
                                              ? Text.rich(
                                                  TextSpan(
                                                    text: Languages.of(context)!.TOTAL + ':\n',
                                                    children: [
                                                      TextSpan(
                                                        text: "0.0€",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Text.rich(
                                                  TextSpan(
                                                    text: Languages.of(context)!.TOTAL + ": ",
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                        totalPrice.toString() + "€" ,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                          SizedBox(
                                            width: 35.w,
                                            child: SizedBox(
                                              height: 40,
                                              child: TextButton(
                                                style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(13)),
                                                  primary: Colors.white,
                                                  backgroundColor: Colors.black,
                                                ),
                                                onPressed: () async {
                                                  if (widget.index != -1) {
                                                    if (PAYMENT_METHOD.value != "") {
                                                      if (PAYMENT_METHOD.value ==
                                                          "Online Payment") {
                                                        Get.to(WebViewContainer(OnlinePayment_url + '?' + 'customer_id='+ sellerinfo!.id.toString() + '&' + 'address_id=' + addressList[widget.index].id.toString() + '&' + 'billing_address_id=' + addressList[widget.index].id.toString()));

                                                        // AwesomeDialog(
                                                        //   context: context,
                                                        //   dialogType: DialogType.SUCCES,
                                                        //   animType: AnimType.BOTTOMSLIDE,
                                                        //   title: 'Success',
                                                        //   desc: 'Online Payment',
                                                        //   btnOkOnPress: () {
                                                        //     Get.to(WebViewContainer(
                                                        //         OnlinePayment_url ));
                                                        //   },
                                                        // ).show();
                                                      } else {
                                                        setState(() {
                                                          Buttonloader = true;
                                                        });
                                                        await DataApiService.instance
                                                            .placeOrder(addressList[widget.index].id.toString());
                                                        Provider.of<MyCart>(context, listen: false).setToZero();
                                                        setState(() {
                                                          Buttonloader = false;
                                                        });
                                                        AwesomeDialog(
                                                          context: context,
                                                          dialogType: DialogType.SUCCES,
                                                          animType: AnimType.BOTTOMSLIDE,
                                                          title: Languages.of(context)!.SUCCESS,
                                                          desc:
                                                          Languages.of(context)!.ORDER_PLACED,
                                                          btnOkOnPress: () {
                                                            Get.offAll(() => newBar(
                                                                  index: 0,
                                                                ));
                                                          },
                                                        ).show();
                                                      }
                                                    } else {
                                                      AwesomeDialog(
                                                        context: context,
                                                        dialogType: DialogType.ERROR,
                                                        animType: AnimType.BOTTOMSLIDE,
                                                        title: Languages.of(context)!.ERROR,
                                                        desc:
                                                        'Please ' + Languages.of(context)!.PAYMENT_METHOD,
                                                        btnOkOnPress: () {},
                                                      ).show();
                                                    }
                                                  } else {
                                                    AwesomeDialog(
                                                      context: context,
                                                      dialogType: DialogType.ERROR,
                                                      animType: AnimType.BOTTOMSLIDE,
                                                      title: Languages.of(context)!.ERROR,
                                                      desc: "Please " + Languages.of(context)!.SELECT_ADDRESS,
                                                      btnOkOnPress: () {},
                                                    ).show();
                                                  }

                                                  // GlobalSnackBar.show(context, SnackMessage);
                                                },
                                                child: Buttonloader == true
                                                    ? Buttonspinkit
                                                    : Text(
                                                  Languages.of(context)!.PLACE_ORDER,
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                              ),
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
                      ],
                    ),
                  ),
                  Center(
                    child: Quantityloader == true ? Quantityspinkit : Container(),
                  )
                ],
              ),

      // bottomNavigationBar:
      // Container(
      //   padding: EdgeInsets.symmetric(
      //     vertical: (15 / 375.0) * 100.w,
      //     horizontal: (30 / 375.0) * 100.w,
      //   ),
      //   // height: 174,
      //   width: 96.w,
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(30),
      //       topRight: Radius.circular(30),
      //     ),
      //     boxShadow: [
      //       BoxShadow(
      //         offset: Offset(0, -15),
      //         blurRadius: 20,
      //         color: Color(0xFFDADADA).withOpacity(0.15),
      //       )
      //     ],
      //   ),
      //   child: SafeArea(
      //     child: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             getCartlist.isEmpty
      //                 ? Text.rich(
      //               TextSpan(
      //                 text: "Total:\n",
      //                 children: [
      //                   TextSpan(
      //                     text: "\$0.0",
      //                     style: TextStyle(
      //                         fontSize: 16, color: Colors.black),
      //                   ),
      //                 ],
      //               ),
      //             )
      //                 : Text.rich(
      //               TextSpan(
      //                 text: "Total: ",
      //                 children: [
      //                   TextSpan(
      //                     text: "\$" + totalPrice.toString(),
      //                     style: TextStyle(
      //                         fontSize: 16, color: Colors.black),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             SizedBox(
      //               width: 35.w,
      //               child: SizedBox(
      //                 height: 40,
      //                 child: TextButton(
      //                   style: TextButton.styleFrom(
      //                     shape: RoundedRectangleBorder(
      //                         borderRadius: BorderRadius.circular(13)),
      //                     primary: Colors.white,
      //                     backgroundColor: Colors.black,
      //                   ),
      //                   onPressed: () async {
      //                     setState(() {
      //                       Buttonloader = true;
      //                     });
      //                     await DataApiService.instance.placeOrder();
      //                     setState(() {
      //                       Buttonloader = false;
      //                     });
      //                     AwesomeDialog(
      //                       context: context,
      //                       dialogType: DialogType.SUCCES,
      //                       animType: AnimType.BOTTOMSLIDE,
      //                       title: 'Success',
      //                       desc: 'Order Placed Successfully',
      //                       btnOkOnPress: () {
      //                         Get.offAll(()=>newBar(
      //                           index: 0,
      //                         ));
      //                       },
      //                     ).show();
      //                     // GlobalSnackBar.show(context, SnackMessage);
      //                   },
      //                   child: Text(
      //                     'Place Order',
      //                     style: TextStyle(
      //                       fontSize: 15,
      //                       color: Colors.white,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
