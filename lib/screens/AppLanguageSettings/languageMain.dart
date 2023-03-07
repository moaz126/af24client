import 'package:af24client/Api/Auth_af24.dart';
import 'package:af24client/screens/Cart/cart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sizer/sizer.dart';
import '../../Provider/cartProvider.dart';
import '../../localization/languages/languages.dart';
import '../../Api/globalVariables.dart';
import '../../navBar.dart';
import 'languageOptions.dart';

class languageMain extends StatefulWidget {
  @override
  State<languageMain> createState() => _languageMainState();
}

class _languageMainState extends State<languageMain> {
  int yourActiveIndex = 0;

  final List<String> images = [
    'assets/images/11.jpg',
    'assets/images/11.jpg',
    'assets/images/11.jpg',
    'assets/images/11.jpg',
    'assets/images/11.jpg',
    'assets/images/11.jpg',
  ];
  fun() async {
    await DataApiService.instance.getCartCount(sellerinfo!.id!.toInt());
    setState(() {

    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fun();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: false,
        backgroundColor: Colors.grey.withOpacity(0.1),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(
              left: 10.0, top: 7.0, right: 0, bottom: 7.0),
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: Colors.grey.withOpacity(0.3))),
              child: Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: Icon(
                  Icons.search,
                  color: Colors.black.withOpacity(0.6),
                ),
              )),
        ),
        actions: [
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
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
          child: Container(
            height: 5.5.h,
            width: 90.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0,top: 20.0),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: Languages.of(context)!.SEARCH,
                    hintMaxLines: 1,
                    hintStyle: TextStyle(overflow: TextOverflow.ellipsis)),
                textAlignVertical: TextAlignVertical.center,maxLines: 1,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider(
                  items: [
                    for (int i = 0; i < banners.length; i++)
                      CachedNetworkImage(
                        imageUrl:
                        banners[i].photo.toString(),
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
                      //   banners[i].photo.toString(),
                      //   fit: BoxFit.fill,
                      // ),
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
                Positioned(
                  top: 1.h,
                  left: 7.w,
                  child: InkWell(
                    onTap: ()
                    {
                      Get.back();
                    },
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),
              ],
            ),
            // Stack(
            //   alignment: Alignment.bottomCenter,
            //   children: [
            //     CarouselSlider(
            //       items: [
            //         for (int i = 0; i < images.length; i++)
            //           Image.asset(
            //             images[i],
            //             fit: BoxFit.cover,
            //           ),
            //       ],
            //       options: CarouselOptions(
            //         onPageChanged: (index, reason) {
            //           setState(() {
            //             yourActiveIndex = index;
            //           });
            //         },
            //         height: 60.h,
            //         aspectRatio: 16 / 9,
            //         viewportFraction: 1,
            //         initialPage: 0,
            //         enableInfiniteScroll: true,
            //         reverse: false,
            //         autoPlay: false,
            //         autoPlayInterval: Duration(seconds: 3),
            //         autoPlayAnimationDuration: Duration(milliseconds: 800),
            //         autoPlayCurve: Curves.fastOutSlowIn,
            //         enlargeCenterPage: true,
            //         //onPageChanged: callbackFunction,
            //         scrollDirection: Axis.horizontal,
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
            //       child: AnimatedSmoothIndicator(
            //           activeIndex: yourActiveIndex,
            //           count: images.length,
            //           effect: SlideEffect(
            //             activeDotColor: Colors.black,
            //             radius: 2,
            //             dotHeight: 3,
            //             dotWidth: 18,
            //           )),
            //     ),
            //
            //     Positioned(
            //       top: 1.h,
            //       left: 7.w,
            //       child: InkWell(
            //         onTap: ()
            //         {
            //           Get.back();
            //         },
            //         child: Container(
            //           alignment: Alignment.topLeft,
            //           child: Icon(Icons.arrow_back_ios),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Container(
              height: 10.h,
              width: 100.h,
              color: Colors.grey.withOpacity(0.13),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Languages.of(context)!.APP_LANGUAGE_SETTING,
                        style: TextStyle(fontSize: 16,color: Colors.black.withOpacity(0.7)),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        Languages.of(context)!.KOREAN,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  Languages.of(context)!.AREA_SETUP,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 40.w,
                    height: 35,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        Languages.of(context)!.CHANGE,
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                          backgroundColor:
                          MaterialStateProperty.all(Colors.white)),
                    ),
                  ),
                  Container(
                    width: 40.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const languageOptions()),
                        );
                      },
                      child: Text(
                          Languages.of(context)!.SELECT),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
