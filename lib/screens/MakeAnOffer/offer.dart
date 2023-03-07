import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../Api/Auth_af24.dart';
import '../../localization/languages/languages.dart';
import '../../Api/globalVariables.dart';
import '../Chat Screen/chatBox.dart';
import '../LoginCreateAccount/login.dart';
import '../WebView/WebView.dart';




class offers extends StatefulWidget {
  String slug;
  offers(this.slug);

  @override
  State<offers> createState() => _offersState();
}

class _offersState extends State<offers> {
  bool SendRequestLoader = false;
  bool loader = false;
  bool showHistory = true;
  bool showOtherOffer = false;
  final SendRequestspinkit = SpinKitSpinningLines(
    size: 3.h,
    color: Colors.white,
  );
  final spinkit = SpinKitSpinningLines(
    size: 5.h,
    color: Colors.black,
  );
  String SelectColor = '';
  String SelectSize = '';
  bool MakeOffer = false;
  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  Future<void> _pullRefresh() async {
    fun();
    _refreshController.refreshCompleted();
  }
  fun() async {
    setState(() {
      showHistory = true;
      showOtherOffer = false;
      loader = true;
    });
    await DataApiService.instance.getProductDetails(widget.slug);
    await DataApiService.instance.getMakeOffersList(productDetails!.id.toString(), productDetails!.userId.toString());
    setState(() {
      loader = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    showHistory = true;
    showOtherOffer = false;
    fun();
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  TextEditingController quantitycontroller = TextEditingController();
  TextEditingController Amountcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          titleSpacing: 0,
          elevation: 0,
          leading: InkWell(
            onTap: () {
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
            child: Text('Your Offers',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ),
        ),
        body:
        loader == true ? spinkit :
        SmartRefresher(
          enablePullDown: true,
          enablePullUp: false,
          controller: _refreshController,
          onRefresh: _pullRefresh,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10, right: 15),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 11.h,
                        width: 11.h,
                        child: CachedNetworkImage(
                          imageUrl:
                          'https://becknowledge.com/af24/public/storage/product/' +
                              productDetails!.images[0],
                          fit: BoxFit.fill,
                          placeholder: (context, url) =>
                              shimmerCategoryLoader(),
                          errorWidget: (context, url, error) =>
                              Image.asset(
                                'assets/images/NoPic.jpg',
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 65.w,
                              child: Text(
                                productDetails!.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20,overflow: TextOverflow.ellipsis),maxLines: 1,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 65.w,
                              child: Text(
                                productDetails!.details.toString(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 67.w,
                              child: Row(
                                children: [
                                  Container(
                                    child: Text(
                                      'Starting Price : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Container(
                                    width: 28.w,
                                    child: Text(
                                      productDetails!.unitPrice.toString() + "€" ,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        color: Colors.red
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  makeOffersList!.list.isEmpty ?
                  Container(
                    width: 70.w,
                    child: Text(
                      'You want to make an offer to the seller for the following item :',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                  :
                      makeOffersList!.latest!.requestStatus == 1 ?
                  Container(
                    width: 70.w,
                    child: Text(
                      'Your offer has been sent.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                      :
                          Container(),
                  makeOffersList!.list.isNotEmpty?
                      Divider(height: 0.5.h,color: Colors.grey,thickness: 0.2.h,)
                      // InkWell(
                      //   onTap: (){
                      //     setState(() {
                      //       showHistory = !showHistory;
                      //     });
                      //   },
                      //   child: Container(
                      //     width: 100.w,
                      //     height: 5.h,
                      //     color: Colors.black,
                      //     child: Center(child: Text("History",style: TextStyle(color: Colors.white),)),
                      //   ),
                      // )
                      :
                  Container(
                    width: 70.w,
                    alignment: Alignment.center,
                    child: Text(
                      'Your Offer :',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  makeOffersList!.list.isNotEmpty ?
                      showHistory == true ?
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      height:
                    //   makeOffersList!.list.length == 1 ?
                    //       makeOffersList!.latest!.requestStatus == 1 ?
                    //           120
                    //           :
                    //       makeOffersList!.latest!.requestStatus == 2 ?
                    //       470
                    // :
                    //     300
                    //       :
                      makeOffersList!.latest!.requestStatus == 2 && makeOffersList!.latest!.status == 1 || makeOffersList!.latest!.requestStatus == 3 ?
                      55.h
                      :
                          65.h,
                      child: ListView.builder(
                          itemCount:  makeOffersList!.list.length,
                          reverse: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context,index){

                            return Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              alignment: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                  ? Alignment.centerLeft
                                  : Alignment.centerLeft,
                              child:
                              Column(
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                      makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                          ? MainAxisAlignment.end
                                          : MainAxisAlignment.end,
                                      children: true
                                          ?
                                      [
                                      Flexible(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 3),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(30),
                                            color: Colors.blue,
                                          ),
                                          child:
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  '${makeOffersList!.list[index].createdAt.toString().substring(0,16)}',
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 10,
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              Text(
                                                'Offer Sent',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 10,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: Colors.white,
                                                ),
                                              ),
                                                Text(
                                                  '${makeOffersList!.list[index].price}€',
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 10,
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ),
                                      ),
                                  sellerinfo!.image == '' || sellerinfo!.image == 'def.png' || sellerinfo!.image == null ?
                                  Image.asset(
                                    'assets/icons/My Page.png',
                                    height: 5.h,
                                  )
                                      :
                                  ClipOval(
                                    child:
                                    CachedNetworkImage(
                                      height: 5.h,
                                      width: 5.h,
                                      imageUrl:
                                      'https://becknowledge.com/af24/public/storage/profile/'+sellerinfo!.image.toString(),
                                      fit: BoxFit.fill,
                                      placeholder: (context, url) =>
                                          shimmerCategoryLoader(),
                                      errorWidget:
                                          (context, url, error) =>
                                          Image.asset(
                                            'assets/images/NoPic.jpg',
                                            height: 5.h,
                                            width: 5.h,
                                          ),
                                    ),
                                    //Image.network('https://becknowledge.com/af24/public/storage/profile/'+sellerinfo!.image.toString(),height: 5.0.h,width: 5.0.h,fit: BoxFit.fill)),
                                  ),
                                  ]
                                          :
                                      [
                                        ClipOval(
                                          child: Container(
                                            height: 5.h,
                                            width: 5.h,
                                            child:
                                            CachedNetworkImage(
                                              imageUrl:
                                              'https://becknowledge.com/af24/public/storage/shop/'+productDetails!.image,
                                              fit: BoxFit.fill,
                                              placeholder: (context, url) =>
                                                  shimmerCategoryLoader(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                  Image.asset(
                                                    'assets/images/NoPic.jpg',
                                                  ),
                                            ),
                                            // widget.image.toString() == "def.png" || widget.image.toString() == "" ?
                                            // Image.asset('assets/icons/Seller app icon (8).png',height: 7.h,width: 7.h,fit: BoxFit.cover,)
                                            //     :
                                            // Image.network(
                                            //   'https://becknowledge.com/af24/public/storage/shop/'+widget.image,
                                            //   fit: BoxFit.fill,
                                            //   height: 5.h,
                                            // ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(

                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 5),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                              color: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                                  ? Colors.grey[300]
                                                  : Colors.blue,
                                            ),
                                            child: Text(
                                              '${makeOffersList!.list[index].productId}',//Change Here
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 10,
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                color: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                                    ? Colors.black
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                              ? 7.h
                                              : 0,
                                          right: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                              ? 7.h
                                              : 7.h),
                                      alignment: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                          ? Alignment.centerRight
                                          : Alignment.centerRight,
                                      child: Text(
                                          makeOffersList!.list[index].createdAt.toString().substring(0,16))),
                                  makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                  ?
                                  Row(
                                      mainAxisAlignment:
                                      makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                          ? MainAxisAlignment.start
                                          : MainAxisAlignment.end,
                                      children: true
                                          ?
                                      [
                                      ClipOval(
                                        child: Container(
                                          height: 5.h,
                                          width: 5.h,
                                          child:
                                          CachedNetworkImage(
                                            imageUrl:
                                            'https://becknowledge.com/af24/public/storage/shop/'+productDetails!.image,
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) =>
                                                shimmerCategoryLoader(),
                                            errorWidget:
                                                (context, url, error) =>
                                                Image.asset(
                                                  'assets/images/NoPic.jpg',
                                                ),
                                          ),
                                          // widget.image.toString() == "def.png" || widget.image.toString() == "" ?
                                          // Image.asset('assets/icons/Seller app icon (8).png',height: 7.h,width: 7.h,fit: BoxFit.cover,)
                                          //     :
                                          // Image.network(
                                          //   'https://becknowledge.com/af24/public/storage/shop/'+widget.image,
                                          //   fit: BoxFit.fill,
                                          //   height: 5.h,
                                          // ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(

                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 5),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 3),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(30),
                                            color: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                                ? Colors.grey[300]
                                                : Colors.blue,
                                          ),
                                          child:
                                          Text(
                                            makeOffersList!.list[index].requestStatus == 2 ?
                                            'Offer Accepted'
                                            : 'Offer Rejected',//Change Here
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 10,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                                  ? Colors.black
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      ]
                                      :
                                      [
                                        Flexible(
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 3),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(30),
                                                color: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                                    ? Colors.grey[300]
                                                    : Colors.blue,
                                              ),
                                              child:
                                              Column(
                                                children: [
                                                  Text(
                                                    '${makeOffersList!.list[index].createdAt.toString().substring(0,16)}',
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 10,
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                                          ? Colors.black
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Offer Sent',
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 10,
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                                          ? Colors.black
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    '\$${makeOffersList!.list[index].price}',
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 10,
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                                          ? Colors.red
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              )
                                          ),
                                        ),
                                        sellerinfo!.image == '' || sellerinfo!.image == 'def.png' || sellerinfo!.image == null ?
                                        Image.asset(
                                          'assets/icons/Seller app icon (8).png',
                                          height: 5.h,
                                        )
                                            :
                                        ClipOval(
                                          child:
                                          CachedNetworkImage(
                                            height: 5.h,
                                            width: 5.h,
                                            imageUrl:
                                            'https://becknowledge.com/af24/public/storage/profile/'+sellerinfo!.image.toString(),
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) =>
                                                shimmerCategoryLoader(),
                                            errorWidget:
                                                (context, url, error) =>
                                                Image.asset(
                                                  'assets/images/NoPic.jpg',
                                                  height: 5.h,
                                                  width: 5.h,
                                                ),
                                          ),
                                          //Image.network('https://becknowledge.com/af24/public/storage/profile/'+sellerinfo!.image.toString(),height: 5.0.h,width: 5.0.h,fit: BoxFit.fill)),
                                        ),
                                      ]

                                  )
                                  :
                                      Container(),
                                  makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                      ?
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                              ? 7.h
                                              : 0,
                                          right: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                              ? 0
                                              : 7.h),
                                      alignment: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                          ? Alignment.centerLeft
                                          : Alignment.centerRight,
                                      child: Text(
                                          makeOffersList!.list[index].createdAt.toString().substring(0,16)))
                                      :
                                      Container(),
                                  makeOffersList!.list[index].requestStatus == 2
                                      ?
                                  Row(
                                      mainAxisAlignment:
                                      makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                          ? MainAxisAlignment.start
                                          : MainAxisAlignment.end,
                                      children: true
                                          ?
                                      [
                                        ClipOval(
                                          child: Container(
                                            height: 5.h,
                                            width: 5.h,
                                            child:
                                            CachedNetworkImage(
                                              imageUrl:
                                              'https://becknowledge.com/af24/public/storage/shop/'+productDetails!.image,
                                              fit: BoxFit.fill,
                                              placeholder: (context, url) =>
                                                  shimmerCategoryLoader(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                  Image.asset(
                                                    'assets/images/NoPic.jpg',
                                                  ),
                                            ),
                                            // widget.image.toString() == "def.png" || widget.image.toString() == "" ?
                                            // Image.asset('assets/icons/Seller app icon (8).png',height: 7.h,width: 7.h,fit: BoxFit.cover,)
                                            //     :
                                            // Image.network(
                                            //   'https://becknowledge.com/af24/public/storage/shop/'+widget.image,
                                            //   fit: BoxFit.fill,
                                            //   height: 5.h,
                                            // ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(

                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 5),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                              color: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                                  ? Colors.grey[300]
                                                  : Colors.blue,
                                            ),
                                            child: InkWell(
                                              onTap: (){
                                                String ss = "https:" + makeOffersList!.list[index].generatedLink!.split(":")[1];
                                                Get.to(WebViewContainer(
                                                    ss  ));
                                              },
                                              child: Text(
                                                '${makeOffersList!.list[index].generatedLink}',//Change Here
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 10,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                                      ? Colors.blue.withOpacity(0.7)
                                                      : Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                          :
                                      [
                                        Flexible(
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 3),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(30),
                                                color: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                                    ? Colors.grey[300]
                                                    : Colors.blue,
                                              ),
                                              child:
                                              Column(
                                                children: [
                                                  Text(
                                                    '${makeOffersList!.list[index].createdAt.toString().substring(0,16)}',
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 10,
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                                          ? Colors.black
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Offer Sent',
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 10,
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                                          ? Colors.black
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    '\$${makeOffersList!.list[index].price}',
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 10,
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                                          ? Colors.red
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              )
                                          ),
                                        ),
                                        sellerinfo!.image == '' || sellerinfo!.image == 'def.png' || sellerinfo!.image == null ?
                                        Image.asset(
                                          'assets/icons/Seller app icon (8).png',
                                          height: 5.h,
                                        )
                                            :
                                        ClipOval(
                                          child:
                                          CachedNetworkImage(
                                            height: 5.h,
                                            width: 5.h,
                                            imageUrl:
                                            'https://becknowledge.com/af24/public/storage/profile/'+sellerinfo!.image.toString(),
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) =>
                                                shimmerCategoryLoader(),
                                            errorWidget:
                                                (context, url, error) =>
                                                Image.asset(
                                                  'assets/images/NoPic.jpg',
                                                  height: 5.h,
                                                  width: 5.h,
                                                ),
                                          ),
                                          //Image.network('https://becknowledge.com/af24/public/storage/profile/'+sellerinfo!.image.toString(),height: 5.0.h,width: 5.0.h,fit: BoxFit.fill)),
                                        ),
                                      ]

                                  )
                                      :
                                      makeOffersList!.list[index].requestStatus == 3
                                  ?
                                  Row(
                                      mainAxisAlignment:
                                      makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                          ? MainAxisAlignment.start
                                          : MainAxisAlignment.end,
                                      children: true
                                          ?
                                      [
                                        ClipOval(
                                          child: Container(
                                            height: 5.h,
                                            width: 5.h,
                                            child:
                                            CachedNetworkImage(
                                              imageUrl:
                                              'https://becknowledge.com/af24/public/storage/shop/'+productDetails!.image,
                                              fit: BoxFit.fill,
                                              placeholder: (context, url) =>
                                                  shimmerCategoryLoader(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                  Image.asset(
                                                    'assets/images/NoPic.jpg',
                                                  ),
                                            ),
                                            // widget.image.toString() == "def.png" || widget.image.toString() == "" ?
                                            // Image.asset('assets/icons/Seller app icon (8).png',height: 7.h,width: 7.h,fit: BoxFit.cover,)
                                            //     :
                                            // Image.network(
                                            //   'https://becknowledge.com/af24/public/storage/shop/'+widget.image,
                                            //   fit: BoxFit.fill,
                                            //   height: 5.h,
                                            // ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(

                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 5),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                              color: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                                  ? Colors.grey[300]
                                                  : Colors.blue,
                                            ),
                                            child: Text(
                                              '${makeOffersList!.list[index].rejectReason}',//Change Here
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 10,
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                color: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                                    ? Colors.black
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                          :
                                      [
                                        Flexible(
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 3),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(30),
                                                color: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                                    ? Colors.grey[300]
                                                    : Colors.blue,
                                              ),
                                              child:
                                              Column(
                                                children: [
                                                  Text(
                                                    '${makeOffersList!.list[index].createdAt.toString().substring(0,16)}',
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 10,
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                                          ? Colors.black
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Offer Sent',
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 10,
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                                          ? Colors.black
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    '\$${makeOffersList!.list[index].price}',
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 10,
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                                          ? Colors.red
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              )
                                          ),
                                        ),
                                        sellerinfo!.image == '' || sellerinfo!.image == 'def.png' || sellerinfo!.image == null ?
                                        Image.asset(
                                          'assets/icons/Seller app icon (8).png',
                                          height: 5.h,
                                        )
                                            :
                                        ClipOval(
                                          child:
                                          CachedNetworkImage(
                                            height: 5.h,
                                            width: 5.h,
                                            imageUrl:
                                            'https://becknowledge.com/af24/public/storage/profile/'+sellerinfo!.image.toString(),
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) =>
                                                shimmerCategoryLoader(),
                                            errorWidget:
                                                (context, url, error) =>
                                                Image.asset(
                                                  'assets/images/NoPic.jpg',
                                                  height: 5.h,
                                                  width: 5.h,
                                                ),
                                          ),
                                          //Image.network('https://becknowledge.com/af24/public/storage/profile/'+sellerinfo!.image.toString(),height: 5.0.h,width: 5.0.h,fit: BoxFit.fill)),
                                        ),
                                      ]

                                  )
                                      :
                                          Container(),
                                  makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                      ?
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                              ? 7.h
                                              : 0,
                                          right: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                              ? 0
                                              : 7.h),
                                      alignment: makeOffersList!.list[index].requestStatus == 2 || makeOffersList!.list[index].requestStatus == 3
                                          ? Alignment.centerLeft
                                          : Alignment.centerRight,
                                      child: Text(
                                          makeOffersList!.list[index].createdAt.toString().substring(0,16)))
                                      :
                                  Container(),

                                ],
                              ),
                            );
                          }),
                    ),
                  )
                      :
                          Container()
                      :
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
                                  height: 5.w,
                                  width: 5.w,
                                  child: Container(
                                    height: 5.w,
                                    width: 5.w,
                                    color: HexColor(items.code),
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
                        padding: const EdgeInsets.only(left: 8.0,bottom: 20.0,top: 10.0),
                        child: SizedBox(
                          height: 50,
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
                                filled: true,
                                focusColor: Colors.grey,
                                fillColor: Colors.grey.withOpacity(0.2),
                                labelText: Languages.of(context)!.QUANTITY,
                                labelStyle: TextStyle(color: Colors.black),
                                enabledBorder: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.grey),
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          height: 50,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field is required";
                              }
                            },
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            keyboardType: TextInputType.number,
                            controller: Amountcontroller,
                            decoration: InputDecoration(
                                filled: true,
                                focusColor: Colors.grey,
                                fillColor: Colors.grey.withOpacity(0.2),
                                labelText: 'Amount',
                                labelStyle: TextStyle(color: Colors.black),
                                enabledBorder: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.grey),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Divider(thickness: 0.2.h,color: Colors.grey,height: 30,),
                  makeOffersList!.list.isNotEmpty ?
                      Container()
                      :
                  SizedBox(
                    height: 15,
                  ),
                  makeOffersList!.latest == null ?
                      Container()
                      :
                  ((makeOffersList!.latest!.requestStatus == 2 && makeOffersList!.latest!.status == 1) || makeOffersList!.latest!.requestStatus == 3) && showOtherOffer == true ?
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
                                  height: 5.w,
                                  width: 5.w,
                                  child: Container(
                                    height: 5.w,
                                    width: 5.w,
                                    color: HexColor(items.code),
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
                        padding: const EdgeInsets.only(left: 8.0,bottom: 20.0,top: 10.0),
                        child: SizedBox(
                          height: 50,
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
                                filled: true,
                                focusColor: Colors.grey,
                                fillColor: Colors.grey.withOpacity(0.2),
                                labelText: Languages.of(context)!.QUANTITY,
                                labelStyle: TextStyle(color: Colors.black),
                                enabledBorder: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.grey),
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          height: 50,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field is required";
                              }
                            },
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            keyboardType: TextInputType.number,
                            controller: Amountcontroller,
                            decoration: InputDecoration(
                                filled: true,
                                focusColor: Colors.grey,
                                fillColor: Colors.grey.withOpacity(0.2),
                                labelText: 'Amount',
                                labelStyle: TextStyle(color: Colors.black),
                                enabledBorder: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.grey),
                                )),
                          ),
                        ),
                      ),
                    ],
                  )
                  :
                      Container(),
                  SizedBox(height: 10.0),
                  makeOffersList!.latest == null ?
                  Container()
                      :
                  ((makeOffersList!.latest!.requestStatus == 2 && makeOffersList!.latest!.status == 1) || makeOffersList!.latest!.requestStatus == 3) && showOtherOffer == true ?
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      onTap: () async {
                        print("Battameez");
                        print(double.parse(Amountcontroller.text));
                        print(double.parse(Amountcontroller.text));
                        if(double.parse(Amountcontroller.text) < (productDetails!.unitPrice/100)*70)
                          {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.ERROR,
                              animType: AnimType.BOTTOMSLIDE,
                              title: Languages.of(context)!.ERROR,
                              desc: 'Offer amount should be more than 70%.',
                              btnOkOnPress: () {},
                            ).show();
                          }
                        else
                        {
                          if (SelectColor != '' &&
                              quantitycontroller.text != '' &&
                              Amountcontroller.text != '' &&
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
                              "price": Amountcontroller.text,
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

                              },
                            ).show()
                                : AwesomeDialog(
                              context: context,
                              dialogType: DialogType.SUCCES,
                              animType: AnimType.BOTTOMSLIDE,
                              title: Languages.of(context)!.SUCCESS,
                              desc: EmailVerficationMessage,
                              btnOkOnPress: () {
                                Navigator.pushReplacement<void, void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) => offers(widget.slug),
                                  ),
                                );
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
                        }
                      },
                      child: Container(
                        height: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.black),
                        child:
                        SendRequestLoader == true ? SendRequestspinkit :
                        Text(
                          "Make another offer",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  )
                      :
                      Container(),
                  makeOffersList!.list.isEmpty ?
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      onTap: () async {
                        if(double.parse(Amountcontroller.text) < (productDetails!.unitPrice/100)*70 )
                          {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.ERROR,
                              animType: AnimType.BOTTOMSLIDE,
                              title: Languages.of(context)!.ERROR,
                              desc: 'Offer amount should be more than 70%.',
                              btnOkOnPress: () {},
                            ).show();
                          }
                        else
                        {
                          if (SelectColor != '' &&
                              quantitycontroller.text != '' &&
                              Amountcontroller.text != '' &&
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
                              "price": Amountcontroller.text,
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

                              },
                            ).show()
                                : AwesomeDialog(
                              context: context,
                              dialogType: DialogType.SUCCES,
                              animType: AnimType.BOTTOMSLIDE,
                              title: Languages.of(context)!.SUCCESS,
                              desc: EmailVerficationMessage,
                              btnOkOnPress: () {
                                Navigator.pushReplacement<void, void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) => offers(widget.slug),
                                  ),
                                );
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
                        }
                      },
                      child: Container(
                        height: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.black),
                        child:
                        SendRequestLoader == true ? SendRequestspinkit :
                        Text(
                          Languages.of(context)!.CONFIRM,
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  )
                      :
                      Container(),
                  makeOffersList!.latest != null ?
                  ((makeOffersList!.latest!.requestStatus == 2 && makeOffersList!.latest!.status == 1) || makeOffersList!.latest!.requestStatus == 3) && showOtherOffer == false ?
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          showOtherOffer = !showOtherOffer;
                        });
                      },
                      child: Container(
                        height: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.black),
                        child:
                        SendRequestLoader == true ? SendRequestspinkit :
                        Text(
                          "Make another offer",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  )
                      :
                      Container()
                  :
                      Container(),
                  SizedBox(height: 10.0,),
                ],
              ),
            ),
          ),
        ));
  }
}
