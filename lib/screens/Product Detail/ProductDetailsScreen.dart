import 'dart:io';

import 'package:af24client/Api/Auth_af24.dart';
import 'package:af24client/models/ConstFunctions.dart';
import 'package:af24client/Api/globalVariables.dart';
import 'package:af24client/screens/LoginCreateAccount/homePage.dart';
import 'package:af24client/screens/LoginCreateAccount/login.dart';
import 'package:af24client/screens/MakeAnOffer/offer.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cron/cron.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../Provider/cartProvider.dart';
import '../../localization/languages/languages.dart';
import '../../models/CategoriesListModel.dart';
import '../../models/SecretMessagesModel.dart';
import '../../navBar.dart';
import '../../newBar.dart';
import '../Cart/cart.dart';
import '../Chat Screen/chatBox.dart';
import '../WebView/WebView.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String index;

  ProductDetailsScreen(this.index);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool ShowsCommentsIcon = false;
  bool ShowsWishIcon = false;
  bool secretComment = false;
  bool favourite = false;
  bool Screenloader = false;
  bool FollowLoader = false;
  bool ChatLoader = false;
  bool SecretLoader = false;
  int colorselect = -1;
  String SelectColor = '';
  int TotalComments = 0;
  String SelectSize = ' ';
  final _formKey = GlobalKey<FormState>();
  final cron = Cron();
  final messagecontroller = TextEditingController();
  final quantitycontroller = TextEditingController();

  MakeOffer() {
    Close();
    Get.to(() => offers(productDetails!.slug));
  }

  bool CheckFollow() {
    for (int i = 0; i < FollowSellers.length; i++) {
      if (FollowSellers[i] == productDetails!.userId.toString()) {
        return true;
      }
    }
    return false;
  }

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
                Column(
                  children: [
                    productDetails!.size.isEmpty
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 6.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField(
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return Languages.of(context)!.REQUIRED;
                                  }
                                },
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                                hint: Container(
                                    width: 40.w,
                                    child: Text(
                                      Languages.of(context)!.SELECT_SIZE,
                                      style: TextStyle(fontSize: 12.sp),
                                    )),
                                elevation: 0,
                                // Initial Value
                                // value: dropdownvalue,

                                // Down Arrow Icon
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 17,
                                  color: Colors.black,
                                ),

                                // Array list of items
                                items: productDetails!.size.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Container(
                                        width: 40.w,
                                        child: Text(
                                          items,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(fontSize: 10.sp),
                                        )),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    SelectSize = newValue!;
                                    // dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 6.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          validator: (dynamic value) {
                            if (value!.isEmpty) {
                              return Languages.of(context)!.REQUIRED;
                            }
                          },
                          decoration: InputDecoration(border: InputBorder.none),
                          hint: Container(
                              height: 20,
                              width: 40.w,
                              child: Text(
                                Languages.of(context)!.SELECT_COLOR,
                                style: TextStyle(fontSize: 12.sp),
                              )),
                          elevation: 0,
                          // Initial Value
                          // value: dropdownvalue,

                          // Down Arrow Icon
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 17,
                            color: Colors.black,
                          ),

                          // Array list of items
                          items: productDetails!.colors.map((dynamic items) {
                            return DropdownMenuItem(
                              value: items.code,
                              child: Container(
                                width: 10.w,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 20,
                                    width: 10.w,
                                    color: HexColor(items.code),
                                  ),
                                ),
                                //     Container(
                                //     color: Color(int.parse('0x' + items.code.toString().substring(1)))),
                                // )
                                // Text(
                                //   items.code, overflow: TextOverflow.ellipsis,
                                //   maxLines: 1,
                                //   style: TextStyle(fontSize: 10.sp),)),
                              ),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (dynamic newValue) {
                            setState(() {
                              SelectColor = newValue;
                              // dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return Languages.of(context)!.REQUIRED;
                          }
                        },
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        controller: quantitycontroller,
                        decoration: InputDecoration(
                            hintText: Languages.of(context)!.ENTER_QUANTITY,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontSize: 15)),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(35.w, 3.h)),
                        onPressed: () async {
                          if (SelectColor != '' &&
                              quantitycontroller.text != '' &&
                              (productDetails!.size.isEmpty ||
                                  SelectSize != '')) {
                            setState(() {
                              print('object');
                              SendRequestLoader = true;
                            });
                            Map<String, dynamic> body = {
                              "product_id": productDetails!.id.toString(),
                              "seller_id": productDetails!.userId.toString(),
                              "color": SelectColor.toString(),
                              "size": SelectSize.toString(),
                              "quantity": quantitycontroller.text,
                            };
                            print(SendRequestLoader.toString());
                            await DataApiService.instance
                                .sendProductRequest(body);
                            print('Hello');
                            print('Hello');
                            // GlobalSnackBar.show(context, LoginSnackMessage);
                            setState(() {
                              SendRequestLoader = false;
                            });
                            print(SendRequestLoader.toString());
                            StatusCode != '200'
                                ? AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.ERROR,
                                    animType: AnimType.BOTTOMSLIDE,
                                    title: Languages.of(context)!.ERROR,
                                    desc: EmailVerficationMessage,
                                    btnOkOnPress: () {
                                      Navigator.pop(context);
                                    },
                                  ).show()
                                : AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.SUCCES,
                                    animType: AnimType.BOTTOMSLIDE,
                                    title: Languages.of(context)!.SUCCESS,
                                    desc: EmailVerficationMessage,
                                    btnOkOnPress: () {
                                      Navigator.pop(context);
                                    },
                                  ).show();
                          } else {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.ERROR,
                              animType: AnimType.BOTTOMSLIDE,
                              title: Languages.of(context)!.ERROR,
                              desc: 'Please fill all fields.',
                              btnOkOnPress: () {},
                            ).show();
                          }
                        },
                        child: SendRequestLoader == true
                            ? SendRequestspinkit
                            : Text(Languages.of(context)!.SEND_REQUEST),
                      ),
                    ),
                  ],
                )
              ],
            );
          });
        });
  }

  AddToCartAlertDialog(BuildContext context) {
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
                Column(
                  children: [
                    productDetails!.size.isEmpty
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 6.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField(
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return Languages.of(context)!.REQUIRED;
                                  }
                                },
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                                hint: Container(
                                    width: 40.w,
                                    child: Text(
                                      Languages.of(context)!.SELECT_SIZE,
                                      style: TextStyle(fontSize: 12.sp),
                                    )),
                                elevation: 0,
                                // Initial Value
                                // value: dropdownvalue,

                                // Down Arrow Icon
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 17,
                                  color: Colors.black,
                                ),

                                // Array list of items
                                items: productDetails!.size.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Container(
                                        width: 40.w,
                                        child: Text(
                                          items,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(fontSize: 10.sp),
                                        )),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    SelectSize = newValue!;
                                    // dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 6.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          validator: (dynamic value) {
                            if (value!.isEmpty) {
                              return Languages.of(context)!.REQUIRED;
                            }
                          },
                          decoration: InputDecoration(border: InputBorder.none),
                          hint: Container(
                              height: 40.w,
                              width: 40.w,
                              child: Text(
                                Languages.of(context)!.SELECT_COLOR,
                                style: TextStyle(fontSize: 12.sp),
                              )),
                          elevation: 0,
                          // Initial Value
                          // value: dropdownvalue,

                          // Down Arrow Icon
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 17,
                            color: Colors.black,
                          ),

                          // Array list of items
                          items: productDetails!.colors.map((dynamic items) {
                            return DropdownMenuItem(
                              value: items.code,
                              child: Container(
                                width: 5.w,
                                height: 5.w,
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Container(
                                    height: 5.w,
                                    width: 5.w,
                                    color: HexColor(items.code),
                                  ),
                                ),
                                //     Container(
                                //     color: Color(int.parse('0x' + items.code.toString().substring(1)))),
                                // )
                                // Text(
                                //   items.code, overflow: TextOverflow.ellipsis,
                                //   maxLines: 1,
                                //   style: TextStyle(fontSize: 10.sp),)),
                              ),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (dynamic newValue) {
                            setState(() {
                              SelectColor = newValue;
                              // dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return Languages.of(context)!.REQUIRED;
                          }
                        },
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        controller: quantitycontroller,
                        decoration: InputDecoration(
                            hintText: Languages.of(context)!.ENTER_QUANTITY,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontSize: 15)),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(35.w, 3.h)),
                        onPressed: () async {
                          if (SelectColor != '' &&
                              quantitycontroller.text != '' &&
                              (productDetails!.size.isEmpty ||
                                  SelectSize != '')) {
                            setState(() {
                              print('object');
                              SendRequestLoader = true;
                            });
                            Map<String, dynamic> body = {
                              "id": productDetails!.id.toString(),
                              "color": SelectColor.toString(),
                              "size": SelectSize.toString(),
                              "quantity": quantitycontroller.text,
                            };
                            print(SendRequestLoader.toString());
                            await DataApiService.instance
                                .addToCart(body, context);
                            print('Hello');
                            print('Hello');
                            // GlobalSnackBar.show(context, LoginSnackMessage);
                            setState(() {
                              SendRequestLoader = false;
                            });
                            print(SendRequestLoader.toString());
                            StatusCode != '200'
                                ? AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.ERROR,
                                    animType: AnimType.BOTTOMSLIDE,
                                    title: Languages.of(context)!.ERROR,
                                    desc: SnackMessage,
                                    btnOkOnPress: () {
                                      Navigator.pop(context);
                                    },
                                  ).show()
                                : SnackMessage == 'Already added!'
                                    ? AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.INFO,
                                        animType: AnimType.BOTTOMSLIDE,
                                        title: '',
                                        desc: SnackMessage,
                                        btnOkOnPress: () {
                                          Navigator.pop(context);
                                        },
                                      ).show()
                                    : AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.SUCCES,
                                        animType: AnimType.BOTTOMSLIDE,
                                        title: Languages.of(context)!.SUCCESS,
                                        desc: SnackMessage,
                                        btnOkOnPress: () {
                                          if (SnackMessage.contains("Out")) {
                                          } else {
                                            Provider.of<MyCart>(context,
                                                    listen: false)
                                                .increment();
                                          }
                                          Navigator.pop(context);
                                        },
                                      ).show();
                          } else {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.ERROR,
                              animType: AnimType.BOTTOMSLIDE,
                              title: Languages.of(context)!.ERROR,
                              desc: 'Please fill all fields.',
                              btnOkOnPress: () {},
                            ).show();
                          }
                        },
                        child: SendRequestLoader == true
                            ? SendRequestspinkit
                            : Text(Languages.of(context)!.ADD_TO_CART),
                      ),
                    ),
                  ],
                ),
              ],
            );
          });
        });
  }

  ConvertName(String name) {
    var regex = RegExp(r'[a-zA-Z]');
    String hello = name;
    String temp =
        hello[0] + hello.replaceAll(regex, '*') + hello[hello.length - 1];
    return temp;
  }

  ConvertMessage(String message) {
    var regex = RegExp(r'[a-zA-Z]');
    String hello = message;
    String temp = hello.replaceAll(regex, '*');
    return temp;
  }

  delay() async {
    cron.schedule(Schedule.parse('*/5 * * * * *'), () async {
      await DataApiService.instance
          .getSecretComments(productDetails!.id.toString());
      setState(() {
        TotalComments = secretMessages.length;
        print(TotalComments);
      });
    });
  }

  final Screenspinkit = SpinKitSpinningLines(
    size: 5.h,
    color: Colors.black,
  );
  final SendRequestspinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.white,
  );
  final Chatspinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.white,
  );
  final Followspinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.black,
  );
  final Secretpinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.black,
  );
  late List<String> disc2 = [];
  late List<String> detail2 = [];

  initializeData() {
    disc2 = [
      productDetails!.brand.name.toString(),
      productDetails!.name.toString(),
      productDetails!.subName.toString(),
      '21FW'
    ];
    detail2 = [
      productDetails!.subName.toString(),
      productDetails!.size.toString(),
      'Shopping bag + Dust + Case + tag',
      'World Warranty-Availability of all Louis Vuitton stores worldwide',
      'Todays department store only sells genuine department store.',
      'Cost:20000 won',
      'If there is no sign of use, and the value of the box,componenets or product is not damaged, the product can be changed or returned.',
    ];
  }

  fun() async {
    setState(() {
      Screenloader = true;
      FollowLoader = true;
      SecretLoader = true;
    });
    await DataApiService.instance.getProductDetails(widget.index);
    initializeData();
    setState(() {
      Screenloader = false;
    });
    favourite = productDetails!.wishlisted;
    TotalComments = productDetails!.comments;
    setState(() {
      ShowsWishIcon = true;
      ShowsCommentsIcon = true;
    });
    if (Guest == 1) {
      setState(() {
        FollowLoader = false;
        SecretLoader = false;
      });
    } else {
      await DataApiService.instance
          .getSellerFollowList(sellerinfo!.id.toString());
      setState(() {
        FollowLoader = false;
      });
      await DataApiService.instance
          .getSecretComments(productDetails!.id.toString());
      setState(() {
        SecretLoader = false;
        TotalComments = secretMessages.length;
        ShowsCommentsIcon = true;
        print(productDetails!.wishlisted);
        print(productDetails!.wishlisted);
        print(favourite);
        print(favourite);
      });
      delay();
      await DataApiService.instance.getCartCount(sellerinfo!.id!.toInt());
      setState(() {});
    }
  }

  bool moredescription = false;
  int commentNumber = 3;
  var document;
  var containerKey = GlobalKey();
  bool chat = false;
  final List<String> disc1 = ['Brand', 'Product Name', 'Sub Name', 'Session'];

  final List<String> detail1 = [
    '',
    '[Size]',
    '[Colors]',
    '[A/S]',
    '[Proof that its genuine]',
    '[Exchange/Return Cost and Deadlines]',
    '[Exchange,return]',
  ];

  final controller1 = CarouselController();
  int count = 3;
  int activeIndex = 0;
  int _counter = 0;
  int _counter2 = 0;
  bool loader = false;
  bool buttonloader = false;

  _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final spinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.white,
  );
  final buttonspinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.white,
  );
  ScrollController scrollController = ScrollController();

  Close() async {
    await cron.close();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Close();
  }

  @override
  initState() {
    // TODO: implement initState
    moredescription = false;
    chat = false;
    favourite = false;
    secretComment = false;
    ShowsCommentsIcon = false;
    ShowsWishIcon = false;
    fun();
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await cron.close();
        if (secretComment == true) {
          Get.off(() => newBar(index: 0));
        } else {
          Get.back();
        }
        return shouldPop ?? false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          titleSpacing: 0,
          elevation: 0,
          leading: InkWell(
            onTap: () async {
              await cron.close();
              if (secretComment == true) {
                Get.off(() => newBar(index: 0));
              } else {
                Get.back();
              }
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
          actions: [
            InkWell(
              onTap: () async {
                await Close();
                Get.to(() => Carts());
              },
              child: Consumer<MyCart>(builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image.asset(
                        'assets/icons/Seller app icon (6).png',
                        height: 3.7.h,
                      ),
                      Container(
                        height: 1.5.h,
                        padding: EdgeInsets.only(left: 1.5, right: 1),
                        decoration: BoxDecoration(
                            color: Colors.orange[700],
                            borderRadius: BorderRadius.circular(100)),
                        //color: Colors.blue,
                        child: Text(
                          value.getCartLength().toString(),
                          style: TextStyle(color: Colors.black, fontSize: 8),
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
        body: Screenloader == true
            ? Screenspinkit
            : SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: <Widget>[
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  CarouselSlider(
                                    carouselController: controller1,
                                    items: [
                                      for (int i = 0;
                                          i < productDetails!.images.length;
                                          i++)
                                        //1st Image of Slider
                                        CachedNetworkImage(
                                          imageUrl:
                                              'https://becknowledge.com/af24/public/storage/product/' +
                                                  productDetails!.images[i],
                                          fit: BoxFit.fill,
                                          placeholder: (context, url) =>
                                              shimmerCategoryLoader(),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                            'assets/images/NoPic.jpg',
                                            height: 15.h,
                                            width: 40.h,
                                          ),
                                        ),
                                      // Container(
                                      //   margin: EdgeInsets.all(0.0),
                                      //   decoration: BoxDecoration(
                                      //     borderRadius: BorderRadius.circular(0.0),
                                      //     image:
                                      //     DecorationImage(
                                      //       image:
                                      //       NetworkImage('https://becknowledge.com/af24/public/storage/product/'+productDetails!.images[i] ),
                                      //       fit: BoxFit.contain,
                                      //     ),
                                      //   ),
                                      // ),
                                    ],

                                    //Slider Container properties
                                    options: CarouselOptions(
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          activeIndex = index;
                                        });
                                      },
                                      height: 230.0,
                                      enlargeCenterPage: true,
                                      autoPlay: false,
                                      aspectRatio: 16 / 9,
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enableInfiniteScroll: productDetails!
                                                      .images.length ==
                                                  0 ||
                                              productDetails!.images.length == 1
                                          ? false
                                          : true,
                                      autoPlayAnimationDuration:
                                          Duration(milliseconds: 800),
                                      viewportFraction: 1.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: ShowsCommentsIcon == false
                                            ? Container()
                                            : Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 2.0),
                                                    child: Text(
                                                      TotalComments >= 100
                                                          ? "99+"
                                                          : TotalComments
                                                              .toString(),
                                                      style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.4),
                                                        fontSize: 18.sp,
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                      onTap: () {
                                                        // _incrementCounter();
                                                        Scrollable
                                                            .ensureVisible(
                                                          containerKey
                                                              .currentContext!,
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      400),
                                                          curve:
                                                              Curves.easeInOut,
                                                        );
                                                      },
                                                      child: Image.asset(
                                                        "assets/icons/Seller app icon (12).png",
                                                        height: 17.sp,
                                                        color: Colors.grey[500],
                                                      )),
                                                ],
                                              ),
                                      ),
                                      Row(
                                        children: [
                                          // Text(
                                          //   '0',
                                          //   style: TextStyle(
                                          //     color:
                                          //         Colors.black.withOpacity(0.4),
                                          //     fontSize: 18.sp,
                                          //   ),
                                          // ),
                                          ShowsWishIcon == true
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 2.0),
                                                  child: Container(
                                                    child: InkWell(
                                                        onTap: () async {
                                                          if (Guest == 1) {
                                                            AwesomeDialog(
                                                              context: context,
                                                              dialogType:
                                                                  DialogType
                                                                      .INFO,
                                                              animType: AnimType
                                                                  .BOTTOMSLIDE,
                                                              title: Languages.of(
                                                                      context)!
                                                                  .LOGIN,
                                                              desc: Languages.of(
                                                                      context)!
                                                                  .LOGIN_FIRST,
                                                              btnCancelOnPress:
                                                                  () {},
                                                              btnCancelText:
                                                                  Languages.of(
                                                                          context)!
                                                                      .CANCEL,
                                                              btnOkText:
                                                                  Languages.of(
                                                                          context)!
                                                                      .LOGIN,
                                                              btnOkOnPress: () {
                                                                Get.to(() =>
                                                                    Login());
                                                              },
                                                            ).show();
                                                            setState(() {
                                                              buttonloader =
                                                                  false;
                                                            });
                                                          } else {
                                                            // _incrementCounter();
                                                            Map<String, dynamic>
                                                                addWishList = {
                                                              // 'id': widget.index.toString(),
                                                              'product_id':
                                                                  productDetails!
                                                                      .id
                                                                      .toString(),
                                                            };
                                                            setState(() {
                                                              favourite = true;
                                                            });
                                                            await DataApiService
                                                                .instance
                                                                .addToWishList(
                                                                    addWishList,
                                                                    context);
                                                            // AwesomeDialog(
                                                            //   context: context,
                                                            //   dialogType:
                                                            //       DialogType.SUCCES,
                                                            //   animType: AnimType
                                                            //       .BOTTOMSLIDE,
                                                            //   title: 'WishList',
                                                            //   desc:
                                                            //       'Added to WishList Successfully',
                                                            //   btnOkOnPress: () {},
                                                            // ).show();
                                                            setState(() {
                                                              buttonloader =
                                                                  false;
                                                            });
                                                          }
                                                        },
                                                        child: favourite ==
                                                                false
                                                            ? Icon(
                                                                Icons
                                                                    .favorite_border_rounded,
                                                                color: Colors
                                                                    .grey[500],
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .favorite_rounded,
                                                                color:
                                                                    Colors.red,
                                                              )),
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ],
                                  ),
                                  AnimatedSmoothIndicator(
                                    activeIndex: activeIndex,
                                    count: productDetails!.images.length,
                                    curve: Curves.bounceInOut,
                                    effect: SlideEffect(
                                      radius: 2,
                                      dotHeight: 3,
                                      dotWidth: 15,
                                      activeDotColor:
                                          Colors.black.withOpacity(0.7),
                                      paintStyle: PaintingStyle.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Text(
                                    productDetails!.brand.name.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30),
                                    textDirection: TextDirection.ltr),
                              ),
                              alignment: AlignmentDirectional.topStart,
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(productDetails!.name.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20),
                                    textDirection: TextDirection.ltr),
                              ),
                              alignment: AlignmentDirectional.topStart,
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                // child: Html(
                                //     data:
                                //     productDetails!.details.toString().toUpperCase(),
                                // ),
                              ),
                              alignment: AlignmentDirectional.topStart,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Row(
                                  children: [
                                    Text(Languages.of(context)!.PRICE + ": ",
                                        style: TextStyle(fontSize: 20.sp)),
                                    // Text(productDetails!.unitPrice.toString() + "\$",
                                    //     style: TextStyle(
                                    //       fontSize: 14.sp,
                                    //       fontWeight: FontWeight.bold,
                                    //       decoration: TextDecoration.lineThrough,
                                    //       color: Colors.grey,
                                    //     ),
                                    //     textDirection: TextDirection.ltr),
                                    // SizedBox(
                                    //   width: 2.w,
                                    // ),
                                    // Text(
                                    //   "\$",
                                    //   style: TextStyle(
                                    //       fontSize: 18.sp,
                                    //       fontWeight: FontWeight.w300,
                                    //       decoration: TextDecoration.lineThrough,
                                    //       ),
                                    // )
                                    Text(
                                        productDetails!.unitPrice.toString() +
                                            '€',
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                        textDirection: TextDirection.ltr),
                                  ],
                                ),
                              ),
                              alignment: AlignmentDirectional.topStart,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    // Image.asset(
                                    //   'assets/icons/Seller app icon (20).png',
                                    //   height: 23.sp,
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Text("No Exchange No refuns",
                                    //       style: TextStyle(
                                    //           color:
                                    //               Color.fromARGB(255, 248, 133, 66))),
                                    // )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Scrollable.ensureVisible(
                                      containerKey.currentContext!,
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                          color: Colors.black.withOpacity(0.5),
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/icons/Seller app icon (12).png',
                                        height: 23.sp,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //   children: [
                            //     productDetails!.secretPayment == 0
                            //         ? Container(
                            //             height: 50,
                            //             width:
                            //                 MediaQuery.of(context).size.width /
                            //                     2.5,
                            //             child: FlatButton(
                            //               child: buttonloader
                            //                   ? buttonspinkit
                            //                   : Text(
                            //                 Languages.of(context)!.ADD_TO_CART,
                            //                       style:
                            //                           TextStyle(fontSize: 15.0),
                            //                     ),
                            //               color: Color.fromARGB(255, 0, 0, 0),
                            //               textColor: Colors.white,
                            //               onPressed: () async {
                            //                 // Map<String, dynamic> addcart = {
                            //                 //   // 'id': widget.index.toString(),
                            //                 //   'id': productDetails!.id.toString(),
                            //                 //   'quantity': '1'
                            //                 // };
                            //                 setState(() {
                            //                   buttonloader = true;
                            //                 });
                            //                 if (Guest == 1) {
                            //                   AwesomeDialog(
                            //                     context: context,
                            //                     dialogType: DialogType.INFO,
                            //                     animType: AnimType.BOTTOMSLIDE,
                            //                     title: Languages.of(context)!.LOGIN,
                            //                     desc: Languages.of(context)!.LOGIN_FIRST,
                            //                     btnCancelOnPress: () {},
                            //                     btnCancelText: Languages.of(context)!.CANCEL,
                            //                     btnOkText: Languages.of(context)!.LOGIN,
                            //                     btnOkOnPress: () {
                            //                       Get.to(() => Login());
                            //                     },
                            //                   ).show();
                            //                   setState(() {
                            //                     buttonloader = false;
                            //                   });
                            //                 } else {
                            //                   productDetails!.currentStock! <
                            //                               1 ||
                            //                           productDetails!
                            //                                   .currentStock ==
                            //                               null
                            //                       ? AwesomeDialog(
                            //                           context: context,
                            //                           dialogType:
                            //                               DialogType.INFO,
                            //                           animType:
                            //                               AnimType.BOTTOMSLIDE,
                            //                           title: 'Out of Stock',
                            //                           desc:
                            //                               'Current Product is out of stock',
                            //                           btnOkOnPress: () {},
                            //                         ).show()
                            //                       : AddToCartAlertDialog(
                            //                           context);
                            //                   // await DataApiService.instance
                            //                   //     .addToCart(addcart, context);
                            //                   setState(() {
                            //                     buttonloader = false;
                            //                   });
                            //                   // GlobalSnackBar.show(context, SnackMessage);
                            //                   await DataApiService.instance
                            //                       .getCartCount(
                            //                           sellerinfo!.id!.toInt());
                            //                   setState(() {});
                            //                 }
                            //               },
                            //             ),
                            //           )
                            //         :
                            //         // Padding(
                            //         //   padding: const EdgeInsets.only(right: 25.0),
                            //         //   child: Container(
                            //         //     height: 50,
                            //         //     width: MediaQuery.of(context).size.width / 2.5,
                            //         //     child: ElevatedButton(
                            //         //       onPressed: () {
                            //         //         showAlertDialog(context);
                            //         //       },
                            //         //       child: Text("Request Now"),
                            //         //       style: ButtonStyle(
                            //         //           backgroundColor:
                            //         //           MaterialStateProperty.all(Colors.black)),
                            //         //     ),
                            //         //   ),
                            //         // ),
                            //         Container(
                            //             height: 50,
                            //             width:
                            //                 MediaQuery.of(context).size.width /
                            //                     2.5,
                            //             child: FlatButton(
                            //               child: Text(
                            //                 Languages.of(context)!.BUY_REQUEST,
                            //                 style: TextStyle(fontSize: 15.0),
                            //               ),
                            //               color: Color.fromARGB(255, 0, 0, 0),
                            //               textColor: Colors.white,
                            //               onPressed: () async {
                            //                 Guest == 1
                            //                     ? AwesomeDialog(
                            //                         context: context,
                            //                         dialogType: DialogType.INFO,
                            //                         animType:
                            //                             AnimType.BOTTOMSLIDE,
                            //                         title: Languages.of(context)!.LOGIN,
                            //                         desc:
                            //                         Languages.of(context)!.LOGIN_FIRST,
                            //                         btnCancelOnPress: () {},
                            //                         btnCancelText: Languages.of(context)!.CANCEL,
                            //                         btnOkText: Languages.of(context)!.LOGIN,
                            //                         btnOkOnPress: () {
                            //                           Get.to(() => Login());
                            //                         },
                            //                       ).show()
                            //                     : productDetails!
                            //                                     .currentStock! <
                            //                                 1 ||
                            //                             productDetails!
                            //                                     .currentStock ==
                            //                                 null
                            //                         ? AwesomeDialog(
                            //                             context: context,
                            //                             dialogType:
                            //                                 DialogType.INFO,
                            //                             animType: AnimType
                            //                                 .BOTTOMSLIDE,
                            //                             title: 'Out of Stock',
                            //                             desc:
                            //                                 'Current Product is out of stock',
                            //                             btnOkOnPress: () {},
                            //                           ).show()
                            //                         : MakeOffer();
                            //               },
                            //             ),
                            //           ),
                            //     Container(
                            //       height: 50,
                            //       width:
                            //           MediaQuery.of(context).size.width / 2.5,
                            //       child: FlatButton(
                            //         child: ChatLoader == true
                            //             ? Chatspinkit
                            //             : Text(
                            //           Languages.of(context)!.CONTACT_SELLER,
                            //                 style: TextStyle(fontSize: 15.0),
                            //               ),
                            //         color: Color.fromARGB(255, 0, 0, 0),
                            //         textColor: Colors.white,
                            //         onPressed: () async {
                            //           Close();
                            //           if (Guest == 1) {
                            //             AwesomeDialog(
                            //               context: context,
                            //               dialogType: DialogType.INFO,
                            //               animType: AnimType.BOTTOMSLIDE,
                            //               title: Languages.of(context)!.LOGIN,
                            //               desc: Languages.of(context)!.LOGIN_FIRST,
                            //               btnCancelOnPress: () {},
                            //               btnCancelText: Languages.of(context)!.CANCEL,
                            //               btnOkText: Languages.of(context)!.LOGIN,
                            //               btnOkOnPress: () {
                            //                 Get.to(() => Login());
                            //               },
                            //             ).show();
                            //           } else {
                            //             setState(() {
                            //               ChatLoader = true;
                            //               chat_id =
                            //                   productDetails!.userId.toString();
                            //             });
                            //             // await DataApiService.instance.getChatMessages(productDetails!.userId.toString());
                            //             setState(() {
                            //               ChatLoader = false;
                            //             });
                            //             Get.to(chatBox(
                            //                 productDetails!.shopName,
                            //                 productDetails!.image,
                            //                 productDetails!.userId.toString()));
                            //           }
                            //         },
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              //height: 500,
                              alignment: Alignment.topLeft,
                              //color: Colors.red,
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  //color: Colors.blue,
                                  width: 60.w,
                                  child: Text(
                                    productDetails!.details.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.8)),
                                  )),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(2)),
                              height: 50,
                              // child: FlatButton(
                              //   onPressed: () {
                              //     setState(() {
                              //       moredescription = !moredescription;
                              //     });
                              //   },
                              //   child: Text(
                              //     "+ " + Languages.of(context)!.MORE_DESCRIPTION,
                              //     style: TextStyle(
                              //         color:
                              //             Color.fromARGB(255, 124, 123, 123)),
                              //   ),
                              // ),
                              width: MediaQuery.of(context).size.width,
                            ),
                            moredescription == true
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Container(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 1.h),
                                          alignment: Alignment.topLeft,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text(
                                            Languages.of(context)!
                                                .MORE_DESCRIPTION,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500),
                                          )),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                top: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(0.5)))),
                                        child: Column(
                                          children: [
                                            for (int i = 0;
                                                i < disc1.length;
                                                i++)
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 110,
                                                    height: 4.h,
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(0.1),
                                                        border: Border(
                                                            top: BorderSide(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.5)))),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          10, 10, 0, 0),
                                                      //discription 1
                                                      child: Text(disc1[i],
                                                          style: TextStyle(
                                                              fontSize: 10.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.8))),
                                                    ),
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                    //padding: EdgeInsets.fromLTRB(0, 9, 0, 0),
                                                    height: 4.h,
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            top: BorderSide(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.5)))),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          20, 12, 0, 0),
                                                      child: Text(
                                                        //discription 2
                                                        disc2[i],
                                                        style: TextStyle(
                                                          fontSize: 9.sp,
                                                          color: Colors.black
                                                              .withOpacity(0.8),
                                                        ),
                                                      ),
                                                    ),
                                                  ))
                                                ],
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(),
                            for (int i = 0; i < detail1.length; i++)
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 17),
                                child: Column(
                                  children: [
                                    i == 1 &&
                                            (productDetails!.size == "" ||
                                                productDetails!.size == null ||
                                                productDetails!.size.isEmpty)
                                        ? Container()
                                        : Container(
                                            alignment: Alignment.center,
                                            width: 50.h,
                                            child: Text(
                                              detail1[i],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black
                                                      .withOpacity(0.8)),
                                            )),
                                    i != 2
                                        ? i == 1 &&
                                                (productDetails!.size == "" ||
                                                    productDetails!.size ==
                                                        null ||
                                                    productDetails!
                                                        .size.isEmpty)
                                            ? Container()
                                            : Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 5, 0, 0),
                                                alignment: Alignment.center,
                                                width: 50.h,
                                                child: Text(
                                                  detail2[i],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: i == 0
                                                          ? 12.sp
                                                          : 10.sp,
                                                      color: i == 0
                                                          ? Colors.black
                                                              .withOpacity(1)
                                                          : Colors.black
                                                              .withOpacity(
                                                                  0.6)),
                                                ),
                                              )
                                        : Container(
                                            height: 5.h,
                                            width: 100.w,
                                            alignment: Alignment.center,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemCount:
                                                  productDetails!.colors.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    height: 3.h,
                                                    width: 3.h,
                                                    color: HexColor(
                                                        productDetails!
                                                            .colors[index]
                                                            .code),
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              color: Colors.grey.withOpacity(0.1),
                              height: 6.h,
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Row(
                                  children: [
                                    Text(
                                      Languages.of(context)!.QUALITY_CONTROL,
                                      style: TextStyle(
                                          fontSize: 13.25.sp,
                                          color: Colors.black.withOpacity(0.4)),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                    ),
                                    Icon(Icons.arrow_forward_ios_outlined,
                                        color: Colors.black.withOpacity(0.4))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Text(Languages.of(context)!.SELLER,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30),
                                    textDirection: TextDirection.ltr),
                              ),
                              alignment: AlignmentDirectional.topStart,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      ClipOval(
                                        child: Container(
                                          height: 9.h,
                                          width: 9.h,
                                          child: productDetails!.image
                                                          .toString() ==
                                                      "def.png" ||
                                                  productDetails!.image
                                                          .toString() ==
                                                      ""
                                              ? Image.asset(
                                                  'assets/icons/My Page.png',
                                                  height: 9.h,
                                                  fit: BoxFit.fill,
                                                )
                                              : CachedNetworkImage(
                                                  imageUrl:
                                                      'https://becknowledge.com/af24/public/storage/shop/' +
                                                          productDetails!.image,
                                                  fit: BoxFit.fill,
                                                  placeholder: (context, url) =>
                                                      shimmerCategoryLoader(),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Image.asset(
                                                    'assets/images/NoPic.jpg',
                                                  ),
                                                ),
                                          // Image.network(
                                          //   'https://becknowledge.com/af24/public/storage/shop/'+productDetails!.image,
                                          //   height: 9.h,
                                          //   fit: BoxFit.fill,
                                          // ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 0.1.w),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Container(
                                                width: 40.w,
                                                child: Text(
                                                  productDetails!.shopName
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                      fontSize: 1.7.h),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            // Padding(
                                            //   padding: const EdgeInsets.only(right: 20),
                                            //   child: Row(
                                            //     mainAxisAlignment:
                                            //         MainAxisAlignment.start,
                                            //     crossAxisAlignment:
                                            //         CrossAxisAlignment.start,
                                            //     children: [
                                            //       SizedBox(
                                            //         width: 1.w,
                                            //       ),
                                            //       Image.asset(
                                            //         'assets/icons/Seller app icon (15).png',
                                            //         height: 1.7.h,
                                            //       ),
                                            //       SizedBox(
                                            //         width: 0.3.h,
                                            //       ),
                                            //       Text("Czech Republic    ",
                                            //           style: TextStyle(fontSize: 1.7.h))
                                            //     ],
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: Container(
                                    width: 25.w,
                                    child: FollowLoader == true
                                        ? Followspinkit
                                        : ElevatedButton(
                                            onPressed: () async {
                                              if (Guest == 1) {
                                                AwesomeDialog(
                                                  context: context,
                                                  dialogType: DialogType.INFO,
                                                  animType:
                                                      AnimType.BOTTOMSLIDE,
                                                  title: Languages.of(context)!
                                                      .LOGIN,
                                                  desc: Languages.of(context)!
                                                      .LOGIN_FIRST,
                                                  btnCancelOnPress: () {},
                                                  btnCancelText:
                                                      Languages.of(context)!
                                                          .CANCEL,
                                                  btnOkText:
                                                      Languages.of(context)!
                                                          .LOGIN,
                                                  btnOkOnPress: () {
                                                    Get.to(() => Login());
                                                  },
                                                ).show();
                                              } else {
                                                setState(() {
                                                  loader = true;
                                                });
                                                await DataApiService.instance
                                                    .requestFollowSeller(
                                                        productDetails!.userId
                                                            .toString(),
                                                        sellerinfo!.id
                                                            .toString());
                                                await DataApiService.instance
                                                    .getSellerFollowList(
                                                        sellerinfo!.id
                                                            .toString());
                                                setState(() {
                                                  loader = false;
                                                });
                                                StatusCode != '200'
                                                    ? AwesomeDialog(
                                                        context: context,
                                                        dialogType:
                                                            DialogType.ERROR,
                                                        animType: AnimType
                                                            .BOTTOMSLIDE,
                                                        title: Languages.of(
                                                                context)!
                                                            .ERROR,
                                                        desc: Languages.of(
                                                                context)!
                                                            .ERROR,
                                                        btnOkOnPress: () {},
                                                      ).show()
                                                    : AwesomeDialog(
                                                        context: context,
                                                        dialogType:
                                                            DialogType.SUCCES,
                                                        animType: AnimType
                                                            .BOTTOMSLIDE,
                                                        title: Languages.of(
                                                                context)!
                                                            .SUCCESS,
                                                        desc: Languages.of(
                                                                context)!
                                                            .REQUEST_COMPLETED,
                                                        btnOkOnPress: () {},
                                                      ).show();
                                              }
                                            },
                                            child: loader == true
                                                ? spinkit
                                                : Guest == 1
                                                    ? Text(
                                                        Languages.of(context)!
                                                            .FOLLOW)
                                                    : CheckFollow()
                                                        ? Text(Languages.of(
                                                                context)!
                                                            .UN_FOLLOW)
                                                        : Text(Languages.of(
                                                                context)!
                                                            .FOLLOW),
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.black)),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Text(Languages.of(context)!.COMMENT,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30),
                                    textDirection: TextDirection.ltr),
                              ),
                              alignment: AlignmentDirectional.topStart,
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Divider(
                            //   color: Colors.black.withOpacity(0.5),
                            //   height: 10,
                            // ),
                            // Container(
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Row(
                            //         children: [
                            //           Container(
                            //             child: Padding(
                            //               padding:
                            //                   const EdgeInsets.fromLTRB(10, 7, 0, 0),
                            //               child: Text(
                            //                   // sellerinfo!.fName!,
                            //                 ' ',
                            //                   style: TextStyle(
                            //                       fontWeight: FontWeight.w500,
                            //                       fontSize: 20),
                            //                   textDirection: TextDirection.ltr),
                            //             ),
                            //             alignment: AlignmentDirectional.topStart,
                            //           ),
                            //           SizedBox(
                            //             width: 10,
                            //           ),
                            //           Container(
                            //             height: 25,
                            //             alignment: Alignment.bottomCenter,
                            //             child: Text(
                            //               // "06-15-2022",
                            //               ' ',
                            //               style: TextStyle(fontSize: 10),
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //       Container(
                            //         height: 32,
                            //         alignment: Alignment.bottomRight,
                            //         child: InkWell(
                            //           onTap: () async {
                            //
                            //           },
                            //           child: SizedBox(
                            //             width: 60,
                            //             child: Row(
                            //               children: [
                            //                 InkWell(
                            //                   child: Stack(
                            //                     alignment: Alignment.center,
                            //                     children: [
                            //                       Image.asset(
                            //                         'assets/icons/Seller app icon (16).png',
                            //                         height: 3.5.h,
                            //                         color: Colors.grey[700],
                            //                       ),
                            //                       Container(
                            //                         key: containerKey,
                            //                         height: 20,
                            //                         width: 8,
                            //                         child: Text(
                            //                           '$commentNumber',
                            //                           style:
                            //                               TextStyle(color: Colors.white),
                            //                         ),
                            //                       ),
                            //                     ],
                            //                   ),
                            //                 ),
                            //                 Icon(
                            //                   Icons.arrow_drop_down,
                            //                   color: Colors.black.withOpacity(0.4),
                            //                   size: 3.5.h,
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SecretLoader == true
                        ? Secretpinkit
                        : Container(
                            key: containerKey,
                            color: Colors.grey.withOpacity(0.1),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Guest == 1
                                    ? Container()
                                    : secretMessages.length == 0
                                        ? Container()
                                        : Container(
                                            height: 20.h,
                                            child: ListView.builder(
                                              reverse: true,
                                              itemCount: secretMessages.length,
                                              physics: BouncingScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                String str;
                                                String replaced = '';
                                                if (secretMessages[index]
                                                    .message
                                                    .startsWith("http://")) {
                                                  str = secretMessages[index]
                                                      .message;
                                                  String ss = str.split(":")[1];
                                                  print(ss);
                                                  replaced = "https:" + ss;
                                                  print(replaced);
                                                }
                                                return secretMessages[index]
                                                            .userId ==
                                                        sellerinfo!.id
                                                    ? Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width: 2.w,
                                                            ),
                                                            secretMessages[index]
                                                                        .sendBy ==
                                                                    'customer'
                                                                ? SizedBox(
                                                                    width: 35.w,
                                                                    child: Text(
                                                                      secretMessages[
                                                                              index]
                                                                          .userName,
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ))
                                                                : SizedBox(
                                                                    width: 35.w,
                                                                    child: Text(
                                                                      secretMessages[
                                                                              index]
                                                                          .shopName
                                                                          .toString(),
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    )),
                                                            Text(":  "),
                                                            // Container(
                                                            //   height: 35,
                                                            //   width: 95,
                                                            //   child: FlatButton(
                                                            //     child: Text(
                                                            //       'Link',
                                                            //       style: TextStyle(
                                                            //           fontSize:
                                                            //               15.0),
                                                            //     ),
                                                            //     color: Color
                                                            //         .fromARGB(
                                                            //             255,
                                                            //             0,
                                                            //             0,
                                                            //             0),
                                                            //     textColor:
                                                            //         Colors
                                                            //             .white,
                                                            //     onPressed:
                                                            //         () async {
                                                            //       if (secretMessages[
                                                            //                   index]
                                                            //               .message
                                                            //               .toString()
                                                            //               .startsWith(
                                                            //                   'https://') ||
                                                            //           secretMessages[
                                                            //                   index]
                                                            //               .message
                                                            //               .toString()
                                                            //               .startsWith(
                                                            //                   'http://')) {
                                                            //         await cron
                                                            //             .close();
                                                            //         Get.to(WebViewContainer(
                                                            //             replaced));
                                                            //       }
                                                            //     },
                                                            //   ),
                                                            // ),
                                                            secretMessages[index]
                                                                        .message
                                                                        .toString()
                                                                        .startsWith(
                                                                            'https://') ||
                                                                    secretMessages[
                                                                            index]
                                                                        .message
                                                                        .toString()
                                                                        .startsWith(
                                                                            'http://')
                                                                ? Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            130.0),
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          20.w,
                                                                      // child: FlatButton(
                                                                      //   child: Text(
                                                                      //     'Link',
                                                                      //     style: TextStyle(
                                                                      //         fontSize:
                                                                      //         15.0),
                                                                      //   ),
                                                                      //   color: Color
                                                                      //       .fromARGB(
                                                                      //       255,
                                                                      //       0,
                                                                      //       0,
                                                                      //       0),
                                                                      //   textColor:
                                                                      //   Colors
                                                                      //       .white,
                                                                      //   onPressed:
                                                                      //       () async {
                                                                      //     if (secretMessages[
                                                                      //     index]
                                                                      //         .message
                                                                      //         .toString()
                                                                      //         .startsWith(
                                                                      //         'https://') ||
                                                                      //         secretMessages[
                                                                      //         index]
                                                                      //             .message
                                                                      //             .toString()
                                                                      //             .startsWith(
                                                                      //             'http://')) {
                                                                      //       await cron
                                                                      //           .close();
                                                                      //       Get.to(WebViewContainer(
                                                                      //           replaced));
                                                                      //     }
                                                                      //   },
                                                                      // )
                                                                    ),
                                                                  )
                                                                : SizedBox(
                                                                    width: 55.w,
                                                                    child: InkWell(
                                                                        onTap: () async {
                                                                          if (secretMessages[index].message.toString().startsWith('https://') ||
                                                                              secretMessages[index].message.toString().startsWith('http://')) {
                                                                            await cron.close();
                                                                            Get.to(WebViewContainer(replaced));
                                                                          }
                                                                        },
                                                                        child: Text(secretMessages[index].message, maxLines: 2, overflow: TextOverflow.ellipsis))),
                                                          ],
                                                        ),
                                                      )
                                                    : Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width: 2.w,
                                                            ),
                                                            secretMessages[index]
                                                                        .sendBy ==
                                                                    'customer'
                                                                ? SizedBox(
                                                                    width: 35.w,
                                                                    child: Text(
                                                                      ConvertName(
                                                                          secretMessages[index]
                                                                              .userName),
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ))
                                                                : SizedBox(
                                                                    width: 35.w,
                                                                    child: Text(
                                                                      ConvertName(secretMessages[
                                                                              index]
                                                                          .shopName
                                                                          .toString()),
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    )),
                                                            Text(":  "),
                                                            InkWell(
                                                                onTap: () {},
                                                                child: SizedBox(
                                                                    width: 55.w,
                                                                    child: Text(
                                                                        ConvertMessage(secretMessages[index]
                                                                            .message),
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow.ellipsis))),
                                                          ],
                                                        ),
                                                      );
                                              },
                                            ),
                                          ),
                                productDetails!.secretPayment == 1
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 37.0),
                                        child: Container(
                                          height: 35,
                                          width: 95,
                                          // child: FlatButton(
                                          //   child: Text(
                                          //     'Buy Now',
                                          //     style: TextStyle(fontSize: 15.0),
                                          //   ),
                                          //   color: Color.fromARGB(255, 0, 0, 0),
                                          //   textColor: Colors.white,
                                          //   onPressed: () async {
                                          //     Guest == 1
                                          //         ? AwesomeDialog(
                                          //             context: context,
                                          //             dialogType: DialogType.INFO,
                                          //             animType:
                                          //                 AnimType.BOTTOMSLIDE,
                                          //             title: Languages.of(context)!.LOGIN,
                                          //             desc:
                                          //             Languages.of(context)!.LOGIN_FIRST,
                                          //             btnCancelOnPress: () {},
                                          //             btnCancelText: Languages.of(context)!.CANCEL,
                                          //             btnOkText: Languages.of(context)!.LOGIN,
                                          //             btnOkOnPress: () {
                                          //               Get.to(() => Login());
                                          //             },
                                          //           ).show()
                                          //         : productDetails!
                                          //                         .currentStock! <
                                          //                     1 ||
                                          //                 productDetails!
                                          //                         .currentStock ==
                                          //                     null
                                          //             ? AwesomeDialog(
                                          //                 context: context,
                                          //                 dialogType:
                                          //                     DialogType.INFO,
                                          //                 animType: AnimType
                                          //                     .BOTTOMSLIDE,
                                          //                 title: 'Out of Stock',
                                          //                 desc:
                                          //                     'Current Product is out of stock',
                                          //                 btnOkOnPress: () {},
                                          //               ).show()
                                          //             : MakeOffer();
                                          //   },
                                          // ),
                                        ),
                                      )
                                    : Container(),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.only(
                                      top: 5, left: 5, right: 5),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                  child: TextField(
                                    controller: messagecontroller,
                                    decoration: InputDecoration(
                                      suffixIcon: InkWell(
                                          onTap: () async {
                                            if (Guest == 1) {
                                              AwesomeDialog(
                                                context: context,
                                                dialogType: DialogType.INFO,
                                                animType: AnimType.BOTTOMSLIDE,
                                                title: Languages.of(context)!
                                                    .LOGIN,
                                                desc: Languages.of(context)!
                                                    .LOGIN_FIRST,
                                                btnCancelOnPress: () {},
                                                btnCancelText:
                                                    Languages.of(context)!
                                                        .CANCEL,
                                                btnOkText:
                                                    Languages.of(context)!
                                                        .LOGIN,
                                                btnOkOnPress: () {
                                                  Get.to(() => Login());
                                                },
                                              ).show();
                                            } else {
                                              secretMessages.insert(
                                                  0,
                                                  ListElement(
                                                    userId: sellerinfo!.id!,
                                                    sendBy: "customer",
                                                    userName:
                                                        sellerinfo!.fName! +
                                                            " " +
                                                            sellerinfo!.lName!,
                                                    message:
                                                        messagecontroller.text,
                                                  ));
                                              setState(() {});
                                              DataApiService.instance
                                                  .sendSecretMessage(
                                                      messagecontroller.text,
                                                      productDetails!.userId
                                                          .toString(),
                                                      productDetails!.id
                                                          .toString());
                                              messagecontroller.clear();
                                              setState(() {
                                                secretComment = true;
                                              });
                                              print("sent");
                                              Scrollable.ensureVisible(
                                                containerKey.currentContext!,
                                                duration: const Duration(
                                                    milliseconds: 400),
                                                curve: Curves.easeInOut,
                                              );
                                            }
                                          },
                                          child: Icon(Icons.send)),
                                      hintText: Languages.of(context)!
                                          .LEAVE_FIRST_COMMENT,
                                      focusedBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          )
                  ],
                ),
              ),
        bottomNavigationBar: newNavBar(index: 1),
      ),
    );
  }
}
