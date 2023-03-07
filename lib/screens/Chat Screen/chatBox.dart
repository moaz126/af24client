import 'package:af24client/Api/Auth_af24.dart';
import 'package:af24client/Api/globalVariables.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cron/cron.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '';

import 'package:sizer/sizer.dart';

import '../../Models/chatNotificationList.dart';
import '../../Provider/cartProvider.dart';
import '../../localization/languages/languages.dart';
import '../../models/ChatMessagesModel.dart';
import '../Cart/cart.dart';

class chatBox extends StatefulWidget {
  String shopName;
  String image;
  String seller_id;
  chatBox(this.shopName,this.image,this.seller_id);


  @override
  State<chatBox> createState() => _chatBoxState();
}



class _chatBoxState extends State<chatBox> {
  var containerKey = GlobalKey();
  bool chatloader = false;
  final cron = Cron();
  final spinkit = SpinKitSpinningLines(
    size: 5.h,
    color: Colors.black,
  );

  delay() async {
    cron.schedule(Schedule.parse('*/5 * * * * *'), () async {
       await DataApiService.instance.getChatMessages(widget.seller_id.toString());
      print(chatMessages.length);
      setState(() {});
    });
  }
  bool loader = false;
  fun() async {
    setState(() {
      loader = true;
    });
    await DataApiService.instance.getChatMessages(widget.seller_id.toString());
    setState(() {
      loader = false;
    });
    await DataApiService.instance.getCartCount(sellerinfo!.id!.toInt());
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    fun();
    // _scrollDown();
    super.initState();
    delay();
  }

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
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Future.delayed(Duration(milliseconds: 100), () {
        Scrollable.ensureVisible(
          containerKey.currentContext!,
          duration: const Duration(milliseconds: 0),
          curve: Curves.easeInOut,
        );
    });
  }


  final MessageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
        onWillPop: () async{
          final shouldPop = await cron.close();
          Get.back();
          return shouldPop ?? false;
        },
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
              onTap: () async {
                await cron.close();
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          titleSpacing: 0,
          title: Text(widget.shopName,style: TextStyle(color: Colors.black,fontSize: 15.sp),),
          actions: [
            InkWell(
              onTap: (){
                cron.close();
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
        SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 25.h,
                  child: Card(
                    elevation: 1,
                    child: Column(
                      children: [
                        ClipOval(
                          child: Container(
                            height: 10.h,
                            width: 10.h,
                            child:
                            CachedNetworkImage(
                              imageUrl:
                              'https://becknowledge.com/af24/public/storage/shop/'+widget.image,
                              fit: BoxFit.fill,
                              placeholder: (context, url) =>
                                  shimmerCategoryLoader(),
                              errorWidget:
                                  (context, url, error) =>
                                  Image.asset(
                                    'assets/icons/My Page.png',
                                  ),
                            ),
                            // widget.image.toString() == "def.png" || widget.image.toString() == "" ?
                            // Image.asset('assets/icons/Seller app icon (8).png',height: 7.h,width: 7.h,fit: BoxFit.cover,)
                            //     :
                            // Image.network(
                            //   'https://becknowledge.com/af24/public/storage/shop/'+widget.image,
                            //   fit: BoxFit.fill,
                            // ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          child: Text(widget.shopName,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            Languages.of(context)!.QUICK_ANS,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                      ],
                    ),
                  ),
                ),
                // Container(
                //   alignment: Alignment.topCenter,
                //   child: Text(
                //     "AM 09:09",
                //     style: TextStyle(color: Colors.grey),
                //   ),
                // ),
                loader == true ? spinkit :
                  SizedBox(
                    height: 55.5.h,
                    child:
                    ListView.builder(
                      itemCount:  chatMessages.length,
                        reverse: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context,index){

                      return Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        alignment: chatMessages[index].sentBySeller == 1
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child:
                        Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                chatMessages[index].sentBySeller == 1
                                    ? MainAxisAlignment.start
                                    : MainAxisAlignment.end,
                                children: chatMessages[index].sentBySeller == 1
                                    ? [
                                  ClipOval(
                                    child: Container(
                                      height: 5.h,
                                      width: 5.h,
                                      child:
                                      CachedNetworkImage(
                                        imageUrl:
                                        'https://becknowledge.com/af24/public/storage/shop/'+widget.image,
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
                                        color: chatMessages[index].sentBySeller == 1
                                            ? Colors.grey[300]
                                            : Colors.blue,
                                      ),
                                      child: Text(
                                        '${chatMessages[index].message}',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 10,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: chatMessages[index].sentBySeller == 1
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                                    : [
                                  Flexible(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 3),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(30),
                                        color: chatMessages[index].sentBySeller == 1
                                            ? Colors.grey[300]
                                            : Colors.blue,
                                      ),
                                      child: Text(
                                        '${chatMessages[index].message}',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 10,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: chatMessages[index].sentBySeller == 1
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
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
                                      ]),
                            Container(
                                padding: EdgeInsets.only(
                                    left: chatMessages[index]
                                        .sentByCustomer ==
                                        0
                                        ? 7.h
                                        : 0,
                                    right: chatMessages[index]
                                        .sentByCustomer ==
                                        0
                                        ? 0
                                        : 7.h),
                                alignment: chatMessages[index]
                                    .sentByCustomer ==
                                    0
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                child: Text(
                                    chatMessages[index].sentTime.toString()))
                          ],
                        ),
                      );
                    }),
                  ),
                loader == true ? spinkit :

                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0,bottom: 5.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 7.h,
                    child: TextField(
                      cursorColor: Colors.black,
                      controller: MessageController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        filled: true,
                        fillColor: Colors.black26.withOpacity(0.04),
                        suffixIcon: InkWell(
                            onTap: () async {
                              chatMessages.insert(0, ChatMessagesModel(
                                userId: sellerinfo!.id!.toInt(),
                                sellerId: widget.seller_id,
                                sentByCustomer: 1,
                                sentBySeller: 0,
                                sentTime: DateFormat("h:mma")
                                    .format(DateTime.now()),
                                message: MessageController.text,
                              ));
                              print(chatMessages.length);
                              setState(() {

                              });
                              DataApiService.instance.sendMessage(MessageController.text,widget.seller_id.toString());
                              MessageController.clear();
                            },
                            child: Icon(Icons.send, size: 20)),
                        hintText: Languages.of(context)!.WRITE_MESSAGE,
                        hintStyle: TextStyle(
                          color: Colors.black26,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    ),
      );
  }
}





















