import 'package:af24client/Api/Auth_af24.dart';
import 'package:af24client/Models/BoutiquesNews.dart';
import 'package:af24client/Models/Brand%20Category.dart';
import 'package:af24client/Models/HomeBrandList.dart';
import 'package:af24client/Models/HomeProductDetails.dart';
import 'package:af24client/localization/languages/languages.dart';
import 'package:af24client/models/CategoriesListModel.dart';
import 'package:af24client/models/ConstFunctions.dart';
import 'package:af24client/models/SearchProductsModel.dart';
import 'package:af24client/Api/globalVariables.dart';
import 'package:af24client/navBar.dart';
import 'package:af24client/screens/AddToFavouritesScreen/AddToFavouriteScreen.dart';
import 'package:af24client/screens/AllBrands/AllBrands.dart';
import 'package:af24client/screens/AllSellers/AllSellers.dart';
import 'package:af24client/screens/Best%20Products/BestProductsScreen.dart';
import 'package:af24client/screens/Brand/BrandProductDetails.dart';
import 'package:af24client/screens/Brand/brand.dart';
import 'package:af24client/screens/Cart/cart.dart';
import 'package:af24client/screens/LatestProducts/LatestProductsScreen.dart';
import 'package:af24client/screens/Product%20Detail/ProductDetailsScreen.dart';
import 'package:af24client/screens/SearchProducts/SearchProductsScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Models/ProductDetailsList.dart';
import '../../Provider/cartProvider.dart';
import '../../models/ProductDetails.dart';
import '../CategoryProduct/CategoryProduct.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  int iterations = 0;
  bool Check = false;
  SuggestionsBoxController _scrollBoxController = SuggestionsBoxController();
  WidgetBuilder? searchspinkit;
  final Searchcontroller = TextEditingController();
  int yourActiveIndex = 0;

  final List<String> images = [
    'assets/images/11.jpg',
    'assets/images/11.jpg',
    'assets/images/11.jpg',
    'assets/images/11.jpg',
    'assets/images/11.jpg',
    'assets/images/11.jpg',
  ];
  int _counter = 0;
  bool topSeller = true;

  _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int MatchName(String name) {
    for (int i = 0; i < categoriesList.length; i++) {
      if (name == categoriesList[i].name) {
        return categoriesList[i].id;
      }
    }
    return 0;
  }

  fun() async {
    setState(() {
      Categoryloader = true;
      Bannerloader = true;
      TopRatedloader = true;
      Brandsloader = true;
      Sellersloader = true;
      Bestloader = true;
    });
    if (Guest == 1) {
    } else {
      await DataApiService.instance.getCartCount(sellerinfo!.id!.toInt());
      setState(() {
        Provider.of<MyCart>(context, listen: false).setCartLength(cartCount);
      });
      setState(() {});
    }
    await DataApiService.instance.getCategoriesList();
    setState(() {
      Categoryloader = false;
    });
    await DataApiService.instance.getBanners();
    setState(() {
      Bannerloader = false;
    });
    await DataApiService.instance.getTopRated();
    setState(() {
      TopRatedloader = false;
    });
    await DataApiService.instance.getbrandlist();
    setState(() {
      Brandsloader = false;
    });
    await DataApiService.instance.getTopSellersList();
    setState(() {
      Sellersloader = false;
    });
    await DataApiService.instance.getAllSellersList();
    await DataApiService.instance.getBestSellings();
    setState(() {
      Bestloader = false;
    });
    print(topSellers.length);
    print(topSellers.length);
    print(topSellers.length);
  }

  bool Categoryloader = false;
  bool Bannerloader = false;
  bool TopRatedloader = false;
  bool Brandsloader = false;
  bool Sellersloader = false;
  bool Bestloader = false;
  final Categoryspinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.black,
  );
  // searchloader(){
  //   return searchspinkit = SpinKitSpinningLines(
  //     size: 3.h,
  //     color: Colors.black,
  //   );
  // }
  final Bannerspinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.black,
  );
  final TopRatedspinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.black,
  );
  final Brandsspinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.black,
  );
  final Bestspinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.black,
  );
  final Sellersspinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.black,
  );
  int TotalComments = 0;

  @override
  initState() {
    // TODO: implement initState
    fun();
    screens = [
      AllBrands(),
      AllBrands(),
      AllBrands(),
      AllBrands(),
      AllSellers(),
      AllSellers(),
    ];
    super.initState();
  }

  // Initial Selected Value
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  late var screens;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          centerTitle: false,
          backgroundColor: Colors.white.withOpacity(0.8),
          elevation: 0,
          leadingWidth: 19.w,
          leading: Categoryloader == true
              ? Categoryspinkit
              : Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 6.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(border: InputBorder.none),
                      hint: Container(
                          width: 12.w,
                          child: Text(
                            Languages.of(context)!.CATEGORY,
                            style: TextStyle(fontSize: 7.sp),
                          )),
                      elevation: 0,
                      // Initial Value
                      // value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 15,
                        color: Colors.black,
                      ),

                      // Array list of items
                      items: categoriesList.map((CategoriesListModel items) {
                        return DropdownMenuItem(
                          value: items.name,
                          child: Container(
                              width: 12.5.w,
                              child: Text(
                                items.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(fontSize: 7.sp),
                              )),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          Get.to(
                              CategoryProduct(MatchName(newValue!), newValue));
                          print(newValue);
                          // dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //       left: 10.0, top: 7.0, right: 0, bottom: 7.0),
          //   child: Container(
          //       alignment: Alignment.center,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.all(Radius.circular(8)),
          //           border: Border.all(color: Colors.grey.withOpacity(0.3))),
          //       child: Padding(
          //         padding: const EdgeInsets.only(left: 3.0),
          //         child: Icon(
          //           Icons.search,
          //           color: Colors.black.withOpacity(0.6),
          //         ),
          //       )),
          // ),
          actions: [
            InkWell(
              onTap: () async {
                // await Firebase.initializeApp();
                //
                // FirebaseMessaging.instance.getToken().then((value) async {
                //   print(value);
                // });
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
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Container(
                padding: EdgeInsets.only(left: 10),
                width: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: TypeAheadField(
                  // loadingBuilder: ,
                  hideKeyboardOnDrag: true,
                  hideSuggestionsOnKeyboardHide: false,
                  getImmediateSuggestions: debugInstrumentationEnabled,
                  debounceDuration: const Duration(milliseconds: 100),
                  suggestionsBoxController: _scrollBoxController,

                  textFieldConfiguration: TextFieldConfiguration(
                    autofocus: false,
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: Languages.of(context)!.SEARCH,
                      suffixIcon: Icon(
                        Icons.search_rounded,
                        size: 2.5.h,
                      ),
                      hintMaxLines: 1,
                      hintStyle: TextStyle(
                          overflow: TextOverflow.ellipsis, fontSize: 12.sp),
                    ),
                  ),
                  suggestionsCallback: (pattern) async {
                    print("pattern");
                    print(pattern);
                    if(Check == true)
                      {
                        pattern = '';
                      }
                    if (pattern.isNotEmpty) {
                      setState(() {
                        iterations = 0;
                      });
                      return await DataApiService.instance
                          .getSearchProducts(pattern);
                    }
                    return [];
                  },
                  suggestionsBoxDecoration: SuggestionsBoxDecoration(constraints: BoxConstraints(maxHeight: 48.5.h,maxWidth: 65.w)),


                  itemBuilder: (
                      context,
                    suggestion,
                  ) {
                    SearchProductsModel model =
                        suggestion as SearchProductsModel;
                    iterations++;
                    return iterations <= 3 ? Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: CachedNetworkImage(
                                    imageUrl: model.images[0].isNotEmpty ||
                                            model.images[0] != "" ||
                                            model.images != null
                                        ? "http://becknowledge.com/af24/storage/app/public/product/" +
                                            model.images[0]
                                        : " ",
                                    placeholder: (context, url) =>
                                        shimmerCategoryLoader(),
                                    fit: BoxFit.contain,
                                    errorWidget: (context, url, error) =>
                                        Image.asset("assets/images/NoPic.jpg")),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    model.name!,
                                    style: TextStyle(fontSize: 10),
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: model.unitPrice.toString(),
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.red,
                                                  )),
                                              TextSpan(
                                                  text: '€ ',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    )
                    :
                        iterations == 4 ?
                        Center(child: Padding(
                          padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                          child: InkWell(
                              onTap: (){
                                FocusScope.of(context).requestFocus(FocusNode());
                                Get.to(()=>SearchProductScreen());
                              },
                              child: Text(Languages.of(context)!.VIEW_ALL,style: TextStyle(fontSize: 13.sp),)),
                        ))
                            :
                    Container();
                  },
                  hideOnLoading: true,
                  onSuggestionSelected: (suggestion) {
                    SearchProductsModel model =
                    suggestion as SearchProductsModel;
                    FocusScope.of(context).requestFocus(FocusNode());
                    Get.to(() => ProductDetailsScreen(model.slug!));
                  },
                )
                // TypeAheadField(
                //   textFieldConfiguration: TextFieldConfiguration(
                //     controller: Searchcontroller,
                //     autofocus: false,
                //     style: DefaultTextStyle.of(context)
                //         .style
                //         .copyWith(fontStyle: FontStyle.italic),
                //     decoration: InputDecoration(
                //       focusedBorder: InputBorder.none,
                //       border: InputBorder.none,
                //       enabledBorder: InputBorder.none,
                //       hintText: Languages.of(context)!.SEARCH,
                //       suffixIcon: Icon(
                //         Icons.search_rounded,
                //         size: 2.5.h,
                //       ),
                //       hintMaxLines: 1,
                //       hintStyle: TextStyle(
                //           overflow: TextOverflow.ellipsis, fontSize: 12.sp),
                //     ),
                //     maxLines: 1,
                //   ),
                //   suggestionsCallback: (pattern) async {
                //     print("ok1m");
                //     if(pattern.isNotEmpty){
                //       print("okm");
                //       return await DataApiService.instance.getSearchProducts(pattern);
                //     }
                //     return [];
                //   },
                //   itemBuilder: (context, suggestion) {
                //     return ListTile(
                //       leading: Icon(Icons.shopping_cart),
                //       title: Text("Hello"),
                //       subtitle: Text("Hy"),
                //     );
                //   },
                //   onSuggestionSelected: (suggestion) {
                //     Get.to(() => ProductDetailsScreen("white-shirt-6kwEuD"));
                //   },
                // )
                // TextField(
                //   decoration: InputDecoration(
                //     focusedBorder: InputBorder.none,
                //     border: InputBorder.none,
                //     enabledBorder: InputBorder.none,
                //     hintText: Languages.of(context)!.SEARCH,
                //     suffixIcon: Icon(Icons.search_rounded,size: 2.5.h,),
                //     hintMaxLines: 1,
                //     hintStyle: TextStyle(
                //         overflow: TextOverflow.ellipsis, fontSize: 12.sp),
                //   ),
                //   maxLines: 1,
                // ),
                ),
          ),
        ),
        body:
            // loader == true ? spinkit :
            ListView(children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider(
                items: [
                  for (int i = 0; i < banners.length; i++)
                    CachedNetworkImage(
                      imageUrl: banners[i].photo.toString(),
                      fit: BoxFit.contain,
                      placeholder: (context, url) => shimmerCategoryLoader(),
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/images/NoPic.jpg',
                        height: 15.h,
                        width: 40.h,
                      ),
                    )
                ],
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      yourActiveIndex = index;
                    });
                  },
                  height: 50.h,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: banners.length == 0 || banners.length == 1 ? false : true,
                  reverse: false,
                  autoPlay: banners.length == 0 || banners.length == 1 ? false : true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  //onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: AnimatedSmoothIndicator(
                    activeIndex: yourActiveIndex,
                    count: banners.length,
                    effect: SlideEffect(
                      activeDotColor: Colors.black,
                      radius: 2,
                      dotHeight: 3,
                      dotWidth: 18,
                    )),
              ),
            ],
          ),
          homeBrandList.length > 0
              ? Container(
                  height: 20.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeBrandList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Get.to(screens[index]);
                          },
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: ClipOval(
                                    child: Image.asset(
                                      fit: BoxFit.cover,
                                      '${homeBrandList[index].Logo}',
                                      height: 10.h,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 13.0),
                                  child: Container(
                                      width: 20.w,
                                      child: Text(
                                        '${homeBrandList[index].Details}',
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            height: 0.15.h,
                                            fontSize: 8.sp),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 11.0),
            child: Text(
              Languages.of(context)!.NEW_IN_BOUTIQUE,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp),
              maxLines: 1,
            ),
          ),
          Divider(
            height: 1.h,
            thickness: 0.2.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: RichText(
                            text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                              TextSpan(
                                text: 'NEWS!',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    decoration: TextDecoration.none),
                              ),
                              TextSpan(
                                text:
                                Languages.of(context)!.NEW_IN_BOUTIQUE_DETAILS,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.black,
                                    fontSize: 15,
                                    decoration: TextDecoration.none),
                              ),
                            ])),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(AddToFavouritesScreen());
                  },
                  child: Text(
                    Languages.of(context)!.ADD_MY_OUTLET,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey[300]),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 2.h,
            thickness: 0.2.h,
          ),
          TopRatedloader == true
              ? TopRatedspinkit
              : topRatedList.length > 0
                  ? GridView.builder(
                      itemCount: topRatedList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () async {
                            // await DataApiService.instance.getProductDetails(topRatedList[index].slug);
                            Get.to(ProductDetailsScreen(
                                topRatedList[index].slug.toString()));
                          },
                          child: Container(
                            height: 30.h,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(1.h)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 3.h,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Container(
                                            width: 25.w,
                                            child: Text(
                                              topRatedList[index].sellerName,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                child:
                                                topRatedList[index]
                                                    .secretComment == 0 ?
                                                    Container()
                                                    :
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 2.0),
                                                      child: Text(
                                                        topRatedList[index]
                                                            .secretComment >= 100 ?
                                                        "99+"
                                                            :
                                                        topRatedList[index]
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
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            CachedNetworkImage(
                                              height: 15.h,
                                              width: 40.w,
                                              imageUrl:
                                                  'http://becknowledge.com/af24/storage/app/public/product/' +
                                                      topRatedList[index]
                                                          .images[0],
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
                                            // Image.network('http://becknowledge.com/af24/storage/app/public/product/'+ topRatedList[index].images[0],
                                            //   height: 15.h,
                                            //   width: 40.w,
                                            //   fit: BoxFit.scaleDown,
                                            // ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.0.h,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 40.w,
                                              child: Text(
                                                topRatedList[index].brand.name,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 0.4.h,),
                                        Row(
                                          children: [
                                            Container(
                                              width: 40.w,
                                              child: Text(
                                                topRatedList[index].name,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.0.h,
                                        ),
                                        // Row(
                                        //   children: [
                                        //     Container(
                                        //       width: 40.w,
                                        //       child: Text(
                                        //         topRatedList[index].details,
                                        //         overflow: TextOverflow.ellipsis,
                                        //         style: TextStyle(color: Colors.black.withOpacity(0.5)),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                        SizedBox(
                                          height: 0.7.h,
                                        ),
                                        // Column(
                                        //   crossAxisAlignment: CrossAxisAlignment.start,
                                        //   mainAxisAlignment: MainAxisAlignment.start,
                                        //   children: [
                                        //     Text(topRatedList[index].details,
                                        //         style: TextStyle(height: 0.16.h),
                                        //         maxLines: 2,
                                        //         overflow: TextOverflow.ellipsis),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                topRatedList[index]
                                                    .unitPrice
                                                    .toString(),
                                                style: TextStyle(
                                                    height: 0.2.h,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                color: Colors.red
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
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
                                        (topRatedList[index].currentStock! > 0)
                                            ? Container(
                                                height: 3.h,
                                                width: 15.w,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.blue),
                                                child: Text(
                                                  'InStock',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp),
                                                ),
                                              )
                                            : Container(
                                                height: 3.h,
                                                width: 17.w,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.black),
                                                child: Text(
                                                  'Out of Stock',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 8.sp),
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    height: 1.h,
                                    thickness: 0.2.h,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/BritishFlag.png',
                                        height: 2.h,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text('UK'),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        mainAxisExtent: 43.h,
                      ),
                      padding: EdgeInsets.all(5),
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                    )
                  : Container(
                      child: Center(child: Text(Languages.of(context)!.NO_TOP_RATED_PRODUCTS))),
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 13.0, bottom: 20.0),
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        Languages.of(context)!.BRAND_CATEGORY,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // GlobalSnackBar(message: 'Hide Super Seller');
                  // setState(() {
                  //   topSeller = !topSeller;
                  // }
                  // );
                  Get.to(AllBrands());
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        Languages.of(context)!.VIEW_ALL,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_forward_ios_outlined, size: 2.5.h),
                      SizedBox(
                        width: 3.w,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Brandsloader == true
              ? Brandsspinkit
              : brandList.length > 3
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: GridView.builder(
                        // itemCount: brandList.length,
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          // await DataApiService.instance.getBrandProduct(brandList[index].id);
                                          Get.to(BrandProductDetails(index));
                                        },
                                        child: ClipOval(
                                          child: CachedNetworkImage(
                                            height: 9.h,
                                            width: 9.h,
                                            imageUrl:
                                                'https://becknowledge.com/af24/public/storage/brand/' +
                                                    brandList[index].image,
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
                                          // brandList[index].image.toString() == "def.png" || brandList[index].image.toString() == "" ?
                                          // Image.asset('assets/icons/Seller app icon (8).png',height: 9.h,width: 9.h,fit: BoxFit.cover,)
                                          //     :
                                          // Image.network(
                                          //     height: 9.h,
                                          //     width: 9.h,
                                          //     fit: BoxFit.cover,
                                          //     'https://becknowledge.com/af24/public/storage/brand/' +
                                          //         brandList[index].image),
                                        ),
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
                                              // '${brandCategory[index].Name}',
                                              '${brandList[index].name}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12.sp),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
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
                    )
                  : Container(
                      child: Center(child: Text(Languages.of(context)!.NO_BRAND_PRODUCTS)),
                    ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 13.0, bottom: 20.0),
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        Languages.of(context)!.SUPER_SELLER,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // GlobalSnackBar(message: 'Hide Super Seller');
                  Get.to(AllSellers());
                  setState(() {
                    topSeller = !topSeller;
                  });
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        Languages.of(context)!.VIEW_ALL,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_forward_ios_outlined, size: 2.5.h),
                      SizedBox(
                        width: 3.w,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Sellersloader == true
              ? Sellersspinkit
              : topSellers.length > 0 && topSellers.length < 3
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: GridView.builder(
                        // itemCount: topSellers.length,
                        itemCount: topSellers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    // await DataApiService.instance
                                    //     .getSellerProductsList(topSellers[index].sellerId);
                                    Get.to(brand(index));
                                  },
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipOval(
                                          child: CachedNetworkImage(
                                            height: 9.h,
                                            width: 9.h,
                                            imageUrl:
                                                'https://becknowledge.com/af24/public/storage/shop/' +
                                                    topSellers[index].image,
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
                                          // topSellers[index].image.toString() == "def.png" || topSellers[index].image.toString() == "" ?
                                          // Image.asset('assets/icons/Seller app icon (8).png',height: 9.h,width: 9.h,fit: BoxFit.cover,)
                                          //     :
                                          // Image.network(
                                          //     height: 9.h,
                                          //     width: 9.h,
                                          //     fit: BoxFit.cover,
                                          //     'https://becknowledge.com/af24/public/storage/shop/' +
                                          //         topSellers[index].image),
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
                                                '${topSellers[index].name}',
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
                    )
                  : topSellers.length > 3
                      ? Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: GridView.builder(
                            // itemCount: topSellers.length,
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        // await DataApiService.instance
                                        //     .getSellerProductsList(topSellers[index].sellerId);
                                        Get.to(brand(index));
                                      },
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ClipOval(
                                              child: CachedNetworkImage(
                                                height: 9.h,
                                                width: 9.h,
                                                imageUrl:
                                                    'https://becknowledge.com/af24/public/storage/shop/' +
                                                        topSellers[index].image,
                                                fit: BoxFit.fill,
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
                                              // topSellers[index].image.toString() == "def.png" || topSellers[index].image.toString() == "" ?
                                              // Image.asset('assets/icons/Seller app icon (8).png',height: 9.h,width: 9.h,fit: BoxFit.cover,)
                                              //     :
                                              // Image.network(
                                              //     height: 9.h,
                                              //     width: 9.h,
                                              //     fit: BoxFit.cover,
                                              //     'https://becknowledge.com/af24/public/storage/shop/' +
                                              //         topSellers[index].image),
                                            ),
                                            SizedBox(
                                              height: 1.0.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${topSellers[index].name}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 9.sp),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 1,
                              crossAxisSpacing: 1,
                              mainAxisExtent: 17.h,
                            ),
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                          ),
                        )
                      : Container(
                          child: Center(child: Text(Languages.of(context)!.NO_TOP_SELLERS)),
                        ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      Languages.of(context)!.BEST_PRODUCTS,
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // GlobalSnackBar(message: 'Hide Super Seller');
                      // setState(() {
                      //   topSeller = !topSeller;
                      // }
                      // );
                      Get.to(BestProductsScreen());
                    },
                    child: Container(
                      child: Row(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            Languages.of(context)!.VIEW_ALL,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.arrow_forward_ios_outlined, size: 2.5.h),
                          SizedBox(
                            width: 3.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Bestloader == true
                  ? Bestspinkit
                  : bestSellings.length > 0
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 14.0, right: 14.0, bottom: 12.0),
                          child: Container(
                            height: 42.h,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: bestSellings.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () async {
                                      // await DataApiService.instance.getProductDetails(topRatedList[index].slug);
                                      Get.to(() => ProductDetailsScreen(
                                          bestSellings[index].slug.toString()));
                                    },
                                    child: Container(
                                      height: 30.h,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade200),
                                          borderRadius:
                                              BorderRadius.circular(1.h)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                      bestSellings[index]
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
                                                              bestSellings[index]
                                                                  .secretComment >= 100 ?
                                                              "99+"
                                                                  :
                                                              bestSellings[index]
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                // Padding(
                                                //   padding:
                                                //       const EdgeInsets.only(
                                                //           right: 5.0),
                                                //   child: Row(
                                                //     children: [
                                                //       Padding(
                                                //         padding:
                                                //             const EdgeInsets
                                                //                     .only(
                                                //                 right: 2.0),
                                                //         child: Text(
                                                //           bestSellings[index]
                                                //               .secret_comment
                                                //               .toString(),
                                                //           style: TextStyle(
                                                //             color: Colors
                                                //                 .black
                                                //                 .withOpacity(
                                                //                     0.4),
                                                //             fontSize: 10.sp,
                                                //           ),
                                                //         ),
                                                //       ),
                                                //       InkWell(
                                                //           onTap: () {
                                                //             // _incrementCounter();
                                                //           },
                                                //           child: Image.asset(
                                                //             "assets/icons/Seller app icon (12).png",
                                                //             height: 11.sp,
                                                //             color: Colors
                                                //                 .grey[500],
                                                //           )),
                                                //     ],
                                                //   ),
                                                // ),
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
                                                //           const EdgeInsets
                                                //                   .only(
                                                //               left: 2.0),
                                                //       child: Container(
                                                //         child: InkWell(
                                                //             onTap: () {
                                                //               // _incrementCounter();
                                                //             },
                                                //             child:
                                                //                 Image.asset(
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
                                            Row(
                                              children: [
                                                ClipOval(
                                                  child: CachedNetworkImage(
                                                    height: 7.h,
                                                    width: 7.h,
                                                    imageUrl:
                                                        'https://becknowledge.com/af24/public/storage/shop/' +
                                                            bestSellings[index]
                                                                .sellerImage
                                                                .toString(),
                                                    fit: BoxFit.scaleDown,
                                                    placeholder: (context,
                                                            url) =>
                                                        shimmerCategoryLoader(),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Image.asset(
                                                      'assets/images/NoPic.jpg',
                                                      height: 7.h,
                                                      width: 7.h,
                                                    ),
                                                  ),
                                                  //   bestSellings[index].sellerImage.toString() == "def.png" || bestSellings[index].sellerImage.toString() == "" ?
                                                  //   Image.asset('assets/icons/Seller app icon (8).png',height: 7.h,width: 7.h,fit: BoxFit.cover,)
                                                  //       :
                                                  //   Image.network(
                                                  //     'https://becknowledge.com/af24/public/storage/shop/'+ bestSellings[index].sellerImage.toString(),
                                                  //     height: 7.h,
                                                  //     width: 7.h,
                                                  //     fit: BoxFit.cover,),
                                                  // ),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width: 25.w,
                                                        child: Text(
                                                            '${bestSellings[index].sellerName}',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 9.sp,
                                                            ),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 1.0.h,
                                            ),
                                            Container(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      CachedNetworkImage(
                                                        height: 15.h,
                                                        width: 45.w,
                                                        imageUrl:
                                                            'http://becknowledge.com/af24/storage/app/public/product/' +
                                                                bestSellings[
                                                                        index]
                                                                    .images[0],
                                                        fit: BoxFit.contain,
                                                        placeholder: (context,
                                                                url) =>
                                                            shimmerCategoryLoader(),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.asset(
                                                          'assets/images/NoPic.jpg',
                                                          height: 15.h,
                                                          width: 45.h,
                                                        ),
                                                      )
                                                      // Image.network(
                                                      //   'http://becknowledge.com/af24/storage/app/public/product/'+ bestSellings[index].images[0],
                                                      //   height: 15.h,
                                                      //   width: 45.w,
                                                      //   fit: BoxFit.scaleDown,
                                                      // ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 1.5.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width: 45.w,
                                                        child: Text(
                                                          '${bestSellings[index].brand.name}',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 0.4.h,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 50.w,
                                                        child: Text(
                                                            '${bestSellings[index].name}',
                                                            style: TextStyle(
                                                                height: 0.2.h,
                                                            fontSize: 10.sp,
                                                            ),
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2.3.h,
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          '${bestSellings[index].unitPrice}',
                                                          style: TextStyle(
                                                              height: 0.2.h,
                                                              color: Colors.red,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
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
                                                  bestSellings[index]
                                                              .currentStock !=
                                                          null
                                                      ? (bestSellings[index]
                                                                  .currentStock >
                                                              0)
                                                          ? Container(
                                                              width: 15.w,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: Colors
                                                                      .blue),
                                                              child: Text(
                                                                'InStock',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        10.sp),
                                                              ),
                                                            )
                                                          : Container(
                                                              height: 3.h,
                                                              width: 17.w,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: Colors
                                                                      .black),
                                                              child: Text(
                                                                'Out of Stock',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        8.sp),
                                                              ),
                                                            )
                                                      : Container(
                                                          height: 3.h,
                                                          width: 17.w,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color:
                                                                  Colors.black),
                                                          child: Text(
                                                            'Out of Stock',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 8.sp),
                                                          ),
                                                        )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.0.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        )
                      : Container(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            bestSellings.length == 0
                                ? Container()
                                : Text(
                              Languages.of(context)!.BEST_PRODUCT + ": ",
                                    style: TextStyle(fontSize: 15.sp),
                                  ),
                            Center(child: Text(Languages.of(context)!.NO_BEST_PRODUCT)),
                          ],
                        )),
            ],
          )
        ]));
  }
}
