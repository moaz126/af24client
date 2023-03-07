import 'package:af24client/Api/Auth_af24.dart';
import 'package:af24client/screens/New_Screens/home_screen/product_detail_page.dart';
import 'package:af24client/screens/New_Screens/search_screen/search_screen.dart';
import 'package:af24client/screens/Widgets/bottom_bar.dart';
import 'package:af24client/screens/Widgets/common_app_bar_container.dart';
import 'package:af24client/screens/Widgets/common_elevated_button.dart';
import 'package:af24client/screens/Widgets/common_widgets.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:numeral/numeral.dart';
import 'package:sizer/sizer.dart';

import '../../../Api/globalVariables.dart';
import '../../../constant/constant.dart';
import '../../Widgets/cachednetwork.dart';
import '../../Widgets/colors.dart';
import '../../Widgets/colors.dart';
import '../../Widgets/common_textfield.dart';
import '../../Widgets/page_transition.dart';
import '../auth_screens/shipping_country_screen.dart';
import '../chat.dart';
import '../activity/comment_detail_screen.dart';
import '../filter_screen/filter_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool gridview = true;
  bool listview = false;
  Future<dynamic> _onBackPressed(context) async {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Exit',
      desc: 'Do you want to exit app',
      btnCancelOnPress: () {},
      btnCancelText: 'No',
      btnOkText: 'Yes',
      btnOkOnPress: () async {
        SystemNavigator.pop();
      },
    ).show();
  }

  bool loader = false;
  callApi() async {
    setState(() {
      loader = true;
    });
    await DataApiService.instance.getLatestProducts();
    setState(() {
      loader = false;
    });
  }

  @override
  void initState() {
    super.initState();
    callApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          bool? result = await _onBackPressed(context);
          if (result == null) {
            result = false;
          }
          return result;
        },
        child: Scaffold(
// backgroundColor: Colors.black ,
          body: loader
              ? Center(
                  child: spinkit,
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 48,
                        child: Stack(children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 1.3,
                                width: 100.w,
                                color: Colors.black,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      PageTransition.fadeInNavigation(
                                          page: SearchScreen());
                                      // Get.to(()=>SearchScreen());
                                    },
                                    child: Image.asset(
                                      'assets/images/searchicon.png',
                                      height: 23,
                                      width: 23,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      PageTransition.fadeInNavigation(
                                          page: FilterScreen());
                                      // Get.to(()=>FilterScreen());
                                    },
                                    child: Image.asset(
                                      'assets/images/filtericon.png',
                                      height: 20,
                                      width: 25,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => ShippingCountryScreen());
                                    },
                                    child: Container(
                                        height: 22,
                                        width: 22,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: Center(
                                            child: Text(
                                          '+',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ))),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 25,
                                      child: Center(
                                        child: TextField(
                                          maxLines: 1,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            isDense: true,
                                            // disabledBorder: InputBorder.none
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          gridview = true;
                                          listview = false;
                                        });
                                      },
                                      child: gridview == true
                                          ? Image.asset(
                                              'assets/images/gridviewselected.png',
                                              height: 20,
                                              width: 20,
                                            )
                                          : Image.asset(
                                              'assets/images/gridview.png',
                                              height: 20,
                                              width: 20,
                                            )),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          gridview = false;
                                          listview = true;
                                        });
                                      },
                                      child: listview == true
                                          ? Image.asset(
                                              'assets/images/listview_selected.png',
                                              height: 20,
                                              width: 20,
                                            )
                                          : Image.asset(
                                              'assets/images/listview.png',
                                              height: 20,
                                              width: 20,
                                            )),
                                  SizedBox(
                                    width: 15,
                                  )
                                ],
                              ),
                            ],
                          ),
                          gridview == true
                              ? Positioned(
                                  bottom: 0,
                                  right: 50,
                                  child: Container(
                                    height: 3,
                                    width: 15,
                                    color: Colors.black,
                                  ),
                                )
                              : Positioned(
                                  right: 17,
                                  bottom: 0,
                                  child: Container(
                                    height: 3,
                                    width: 15,
                                    color: Colors.black,
                                  ),
                                ),
                          Positioned(
                            top: 5,
                            left: 40,
                            child: Container(
                              height: 44,
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 75,
                            child: Container(
                              height: 44,
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: 1.3,
                              width: 100.w,
                              color: Colors.black,
                            ),
                          )
                        ]),
                      ),
                      gridview == true
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                children: [
                                  GridView.builder(
                                    physics: ScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: latestProducts.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () {
                                          PageTransition.fadeInNavigation(
                                              page: ProductDetailScreen(
                                            product: latestProducts[index],
                                          ));
                                          // Get.to(()=>ProductDetailScreen());
                                        },
                                        child: Container(
                                          height: 340,
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                    color: Colors.black,
                                                  ),
                                                  left: BorderSide(
                                                    color: index % 2 == 0
                                                        ? Colors.transparent
                                                        : Colors.black,
                                                  ))),
                                          // color: Colors.grey,
                                          child: Padding(
                                            padding: index % 2 == 1
                                                ? EdgeInsets.only(left: 10)
                                                : EdgeInsets.only(right: 3),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 6,
                                                          top: 7,
                                                          right: 7),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        '30min ago',
                                                        style: TextStyles
                                                            .TitleTexStyle10(),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 181,
                                                  child: ThumbnailImage(
                                                      thumbnail:
                                                          latestProducts[index]
                                                              .images[0]
                                                              .toString()),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/images/flag.png',
                                                          height: 15,
                                                          width: 15,
                                                        ),
                                                        SizedBox(
                                                          width: 4,
                                                        ),
                                                        Container(
                                                          height: 17,
                                                          width: 21,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: AppColors
                                                                      .redContainer,
                                                                  // color: Colors.black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                          child: Center(
                                                              child: Text(
                                                            'Hot',
                                                            style: TextStyles
                                                                    .TitleTexStyle10()
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        7),
                                                          )),
                                                        ),
                                                        SizedBox(
                                                          width: 4,
                                                        ),
                                                        Container(
                                                          height: 17,
                                                          width: 14,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: AppColors
                                                                      .redContainer,
                                                                  // color: Colors.black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                          child: Center(
                                                              child: Text(
                                                            '%',
                                                            style: TextStyles
                                                                    .TitleTexStyle10()
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        9),
                                                          )),
                                                        ),
                                                        SizedBox(
                                                          width: 3,
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 4),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            child: Row(
                                                              children: [
                                                                Image.asset(
                                                                  'assets/images/favorite.png',
                                                                  height: 20,
                                                                  width: 15,
                                                                ),
                                                                SizedBox(
                                                                  width: 3,
                                                                ),
                                                                Text(
                                                                  numeral(12344,
                                                                      fractionDigits:
                                                                          1),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              children: [
                                                                Image.asset(
                                                                  'assets/images/comment.png',
                                                                  height: 20,
                                                                  width: 15,
                                                                ),
                                                                SizedBox(
                                                                  width: 3,
                                                                ),
                                                                Text(
                                                                  numeral(12344,
                                                                      fractionDigits:
                                                                          1),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                                SizedBox(
                                                                  width: 3,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      latestProducts[index]
                                                          .name,
                                                      style: TextStyles
                                                          .TitleTexStyle14(),
                                                    )),
                                                Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                            latestProducts[
                                                                        index]
                                                                    .first_price_down
                                                                    .toString() +
                                                                '€',
                                                            style: TextStyles
                                                                    .TitleTexStyle14()
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                        SizedBox(
                                                          width: 11,
                                                        ),
                                                        Text(
                                                          latestProducts[index]
                                                                  .purchasePrice
                                                                  .toString() +
                                                              '€',
                                                          style: TextStyles
                                                                  .TitleTexStyle12()
                                                              .copyWith(
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                          ),
                                                        ),
                                                      ],
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 0,
                                            crossAxisSpacing: 0,
                                            mainAxisExtent: 287),
                                  ),
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                for (int index = 0;
                                    index < latestProducts.length;
                                    index++)
                                  InkWell(
                                    onTap: () {
                                      PageTransition.fadeInNavigation(
                                          page: ProductDetailScreen(
                                        product: latestProducts[index],
                                      ));
                                      // Get.to(()=>ProductDetailScreen());
                                    },
                                    child: Container(
                                        height: 165,
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.black))),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                    height: 135,
                                                    width: 140,
                                                    child: ThumbnailImage(
                                                        thumbnail:
                                                            latestProducts[
                                                                    index]
                                                                .images[0]
                                                                .toString())),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Image.asset(
                                                                'assets/images/flag.png',
                                                                height: 18,
                                                                width: 18,
                                                              ),
                                                              SizedBox(
                                                                width: 3,
                                                              ),
                                                              Container(
                                                                height: 18,
                                                                width: 25,
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: AppColors
                                                                            .redContainer,
                                                                        // color: Colors.black,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5)),
                                                                child: Center(
                                                                    child: Text(
                                                                  'Hot',
                                                                  style: TextStyles
                                                                          .TitleTexStyle10()
                                                                      .copyWith(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              9),
                                                                )),
                                                              ),
                                                              SizedBox(
                                                                width: 3,
                                                              ),
                                                              Container(
                                                                height: 18,
                                                                width: 17,
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: AppColors
                                                                            .redContainer,
                                                                        // color: Colors.black,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5)),
                                                                child: Center(
                                                                    child: Text(
                                                                  '%',
                                                                  style: TextStyles
                                                                          .TitleTexStyle10()
                                                                      .copyWith(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                )),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                '30min ago',
                                                                style: TextStyles
                                                                    .TitleTexStyle10(),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 7,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            latestProducts[
                                                                    index]
                                                                .name,
                                                            style: TextStyles
                                                                .TitleTexStyle14(),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          latestProducts[index]
                                                              .details
                                                              .toString(),
                                                          style: TextStyles
                                                                  .TitleTexStyle12()
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                '${latestProducts[
                                                                            index]
                                                                        .first_price_down}€',
                                                                style: TextStyles
                                                                    .TitleTexStyle13(),
                                                              ),
                                                              const SizedBox(
                                                                width: 13,
                                                              ),
                                                              Text(
                                                                '${latestProducts[
                                                                            index]
                                                                        .purchasePrice}€',
                                                                style: TextStyles
                                                                        .TitleTexStyle13()
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .grey,
                                                                        decoration:
                                                                            TextDecoration.lineThrough),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Image.asset(
                                                                'assets/images/favorite.png',
                                                                height: 22,
                                                                width: 17,
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              // Numeral(520).format();
                                                              Text(
                                                                numeral(12344,
                                                                    fractionDigits:
                                                                        1),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 8,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Image.asset(
                                                                'assets/images/comment.png',
                                                                height: 21,
                                                                width: 16,
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                numeral(123,
                                                                    fractionDigits:
                                                                        1),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                  )
                              ],
                            )
                    ],
                  ),
                ),
          bottomNavigationBar: CommonNavigationBar(index: 0),
        ),
      ),
    );
  }
}
