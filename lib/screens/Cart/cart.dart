import 'package:af24client/Api/Auth_af24.dart';
import 'package:af24client/models/ConstFunctions.dart';
import 'package:af24client/Api/globalVariables.dart';
import 'package:af24client/screens/CheckOut/CheckOut.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Provider/cartProvider.dart';
import '../../localization/languages/languages.dart';

class Carts extends StatefulWidget {
  const Carts({Key? key}) : super(key: key);

  @override
  _CartsState createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  bool loader = false;
  bool Quantityloader = false;

  callApi() async {
    if (Guest == 1) {
      getCartlist = List.empty();
    } else {
      setState(() {
        loader = true;
      });

      await DataApiService.instance.getcategorylist();
      countprice();
      setState(() {
        loader = false;
      });
    }
  }

  final SendRequestspinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.white,
  );
  final Quantityspinkit = SpinKitSpinningLines(
    size: 5.h,
    color: Colors.black,
  );
  final Vouchercontroller = TextEditingController();

  showAlertDialog(BuildContext context) {
    bool SendRequestLoader = false;
    // set up the AlertDialog
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              // title: Text("Notice"),
              // content: Text("Launching this missile will destroy the entire universe. Is this what you intended to do?"),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Languages.of(context)!.REQUIRED;
                      }
                    },
                    controller: Vouchercontroller,
                    decoration: InputDecoration(
                        hintText: Languages.of(context)!.VOUCHER_CODE,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 15)),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(),
                    onPressed: () async {
                      setState(() {
                        print('object');
                        SendRequestLoader = true;
                      });
                      Map<String, dynamic> body = {
                        "code": Vouchercontroller.text,
                      };
                      print(SendRequestLoader.toString());
                      await DataApiService.instance.applyVoucher(body);
                      print('Hello');
                      print('Hello');
                      // GlobalSnackBar.show(context, LoginSnackMessage);
                      setState(() {
                        SendRequestLoader = false;
                      });
                      StatusCode != '200'
                          ? AwesomeDialog(
                              context: context,
                              dialogType: DialogType.ERROR,
                              animType: AnimType.BOTTOMSLIDE,
                              title: Languages.of(context)!.ERROR,
                              desc: AddAddressSnackMessage,
                              btnOkOnPress: () {},
                            ).show()
                          : AwesomeDialog(
                              context: context,
                              dialogType: DialogType.SUCCES,
                              animType: AnimType.BOTTOMSLIDE,
                              title: Languages.of(context)!.SUCCESS,
                              desc: AddAddressSnackMessage,
                              btnOkOnPress: () {},
                            ).show();
                    },
                    child: SendRequestLoader == true
                        ? SendRequestspinkit
                        : Text(Languages.of(context)!.APPLY_VOUCHER),
                  ),
                ),
              ],
            );
          });
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
    Quantityloader = false;
    super.initState();
  }

  final spinkit = SpinKitSpinningLines(
    size: 5.h,
    color: Colors.black,
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
          Languages.of(context)!.YOUR_CART,
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
        //       await DataApiService.instance.getCartCount(sellerinfo!.id!.toInt());
        //       setState(() {
        //
        //       });
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
      body: Guest == 1
          ? Center(
              child: Text(Languages.of(context)!.LOGIN_FIRST),
            )
          : loader
              ? spinkit
              : getCartlist.isEmpty
                  ? Center(
                      child: Text(Languages.of(context)!.EMPTY_CART),
                    )
                  : Stack(
                      children: [
                        Opacity(
                          opacity: Quantityloader == true ? 0.1 : 1.0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: (20 / 375.0) * 100.w),
                            child: ListView.builder(
                              itemCount: getCartlist.length,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 3),
                                child: Dismissible(
                                  key: Key(getCartlist[index].id.toString()),
                                  direction: DismissDirection.endToStart,
                                  onDismissed: (direction) async {
                                    print(getCartlist[index].id.toString());
                                    /*  Map<String, dynamic> cartid = {
                              'key': getCartlist[index].id.toString()
                            }; */
                                    DataApiService.instance.deletesingleCart(
                                        getCartlist[index].id.toString(),
                                        context);
                                    Provider.of<MyCart>(context, listen: false)
                                        .decrement();
                                    setState(() {
                                      getCartlist.removeAt(index);
                                      countprice();
                                    });
                                    await DataApiService.instance
                                        .getCartCount(sellerinfo!.id!.toInt());
                                    setState(() {});
                                  },
                                  background: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFE6E6),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      children: [Spacer(), Icon(Icons.delete)],
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 88,
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
                                                  'assets/images/NoPic.jpg',
                                                  height: 20.h,
                                                  width: 20.h,
                                                ),
                                              ),
                                              //Image.network('https://becknowledge.com/af24/public/storage/product/thumbnail/'+getCartlist[index].thumbnail),
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
                                              width: 40.w,
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
                                                    text: getCartlist[index]
                                                            .price
                                                            .toString() +
                                                        "€",
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
                                                // Text(getCartlist[index].s)
                                              ],
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
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                    onTap: () async {
                                                      if (getCartlist[index]
                                                              .quantity >
                                                          1) {
                                                        setState(() {
                                                          Quantityloader = true;
                                                        });
                                                        getCartlist[index]
                                                            .quantity--;
                                                        await DataApiService
                                                            .instance
                                                            .updateCart(
                                                                getCartlist[
                                                                        index]
                                                                    .id
                                                                    .toString(),
                                                                getCartlist[
                                                                        index]
                                                                    .quantity
                                                                    .toString(),
                                                                context);
                                                        setState(() {
                                                          Quantityloader =
                                                              false;
                                                        });
                                                      } else {
                                                        getCartlist[index]
                                                            .quantity = 1;
                                                      }
                                                      setState(() {
                                                        countprice();
                                                      });
                                                    },
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .grey.shade100,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                        ),
                                                        child: Icon(
                                                            Icons.remove))),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  height: 20,
                                                  child: Text(getCartlist[index]
                                                      .quantity
                                                      .toString()),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                InkWell(
                                                    onTap: () async {
                                                      setState(() {
                                                        getCartlist[index]
                                                            .quantity++;
                                                        Quantityloader = true;
                                                      });
                                                      await DataApiService
                                                          .instance
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .grey.shade100,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                        ),
                                                        child: Icon(Icons.add)))
                                              ],
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                          ],
                                        ),
                                        Expanded(child: SizedBox()),
                                        InkWell(
                                            onTap: () async {
                                              DataApiService.instance
                                                  .deletesingleCart(
                                                      getCartlist[index]
                                                          .id
                                                          .toString(),
                                                      context);
                                              Provider.of<MyCart>(context,
                                                      listen: false)
                                                  .decrement();
                                              setState(() {
                                                getCartlist.removeAt(index);
                                                countprice();
                                              });
                                              await DataApiService.instance
                                                  .getCartCount(
                                                      sellerinfo!.id!.toInt());
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color:
                                                  Colors.red.withOpacity(0.9),
                                            )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Quantityloader == true
                              ? Quantityspinkit
                              : Container(),
                        )
                      ],
                    ),
      bottomNavigationBar: Guest == 1
          ? Container(
              height: 10.h,
              width: 96.w,
            )
          : getCartlist.isEmpty
              ? Container(
                  height: 10.h,
                  width: 10.w,
                )
              : Opacity(
                  opacity: Quantityloader == true ? 0.1 : 1.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: (15 / 375.0) * 100.w,
                      horizontal: (30 / 375.0) * 100.w,
                    ),
                    // height: 174,
                    width: 96.w,
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
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                height: (40 / 375.0) * 100.w,
                                width: (40 / 375.0) * 100.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F6F9),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(Icons.note_add),
                              ),
                              Spacer(),
                              InkWell(
                                  onTap: () {
                                    showAlertDialog(context);
                                  },
                                  child: Text(
                                      Languages.of(context)!.ADD_VOUCHER_CODE)),
                              const SizedBox(width: 10),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: Colors.black,
                              )
                            ],
                          ),
                          SizedBox(
                            height: (20 / 375.0) * 100.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getCartlist.isEmpty
                                  ? Text.rich(
                                      TextSpan(
                                        text: "Total:\n",
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
                                        text: "Total:\n",
                                        children: [
                                          TextSpan(
                                            text: totalPrice.toString() + "€",
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
                                      // await DataApiService.instance.placeOrder();
                                      // GlobalSnackBar.show(context, SnackMessage);
                                      Get.to(CheckOut(-1));
                                    },
                                    child: Text(
                                      Languages.of(context)!.CHECK_OUT,
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
                ),
    );
  }
}
