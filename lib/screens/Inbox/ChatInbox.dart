import 'package:af24client/Api/Auth_af24.dart';
import 'package:af24client/Api/globalVariables.dart';
import 'package:af24client/screens/Chat%20Screen/chatBox.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Provider/cartProvider.dart';
import '../../localization/languages/languages.dart';
import '../Cart/cart.dart';


class ChatInbox extends StatefulWidget {
  const ChatInbox({Key? key}) : super(key: key);

  @override
  State<ChatInbox> createState() => _ChatInboxState();
}

class _ChatInboxState extends State<ChatInbox> {
  bool loader = false;
  final cron = Cron();
  Close() async {
    await cron.close();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Close();
  }
  delay() async {
    cron.schedule(Schedule.parse('*/3 * * * * *'), () async {
      await DataApiService.instance.getCompleteChatList(sellerinfo!.id.toString());
      print(chatMessages.length);
      setState(() {});
    });
  }
  fun() async {
    setState(() {
      loader = true;
    });
    await DataApiService.instance.getCompleteChatList(sellerinfo!.id.toString());
    setState(() {
      loader = false;
    });
    delay();
    await DataApiService.instance.getCartCount(sellerinfo!.id!.toInt());
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    Guest == 1 ? Container() :
    fun();
    super.initState();
  }
  final spinkit = SpinKitSpinningLines(
    size: 5.h,
    color: Colors.black,
  );
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        final shouldPop = await cron.close();
        Get.back();
        return shouldPop ?? false;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            titleSpacing: 0,
            elevation: 0,
            leading: InkWell(
              onTap: () async {
                cron.close();
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
              child: Text(Languages.of(context)!.CHATS,
                  style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            actions: [
              SizedBox(
                width: 3.w,
              ),
              InkWell(
                onTap: () async {
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
              Guest == 1 ?
                  Container(
                    child:
                    Center(child: Text(Languages.of(context)!.GUEST_MODE,style: TextStyle(fontSize: 15.sp),)),
                  )
                  :
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: Column(
              children: [
                completechatlist.length > 0
                    ?
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.only(top: 8),
                      itemCount: completechatlist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () async {
                            setState(() {
                              cron.close();
                              chat_id = completechatlist[index].sellerInfo!.id.toString();
                            });
                            // await DataApiService.instance.getChatMessages(completechatlist[index].sellerId.toString());
                            Get.to(chatBox(completechatlist[index].shopName,completechatlist[index].shopImage,completechatlist[index].sellerInfo!.id.toString()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: 100,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            color: Colors.white,
                            child: Row(
                              children: [
                                completechatlist[index].seenByCustomer == 0 && completechatlist[index].sentBySeller == 1 ?
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                      color: Colors.orange[700],
                                      borderRadius:
                                      BorderRadius.circular(10)),
                                )
                                :
                                    Container(),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      ClipOval(
                                        child: Container(
                                          height: 6.9.h,
                                          width: 6.9.h,
                                          child:
                                          CachedNetworkImage(
                                            imageUrl:
                                            'https://becknowledge.com/af24/public/storage/shop/'+completechatlist[index].shopImage,
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) =>
                                                shimmerCategoryLoader(),
                                            errorWidget:
                                                (context, url, error) =>
                                                Image.asset(
                                                  'assets/images/NoPic.jpg',
                                                ),
                                          ),
                                          // completechatlist[index].shopImage.toString() == "def.png" || completechatlist[index].shopImage.toString() == "" ?
                                          // Image.asset('assets/icons/Seller app icon (8).png',height: 9.h,fit: BoxFit.fill,)
                                          //     :
                                          // Image.network(
                                          //   'https://becknowledge.com/af24/public/storage/shop/'+completechatlist[index].shopImage,
                                          //   height: 6.9.h,
                                          //   fit: BoxFit.fill,
                                          // ),
                                        ),
                                      ),
                                      // CircleAvatar(
                                      //   maxRadius: 10,
                                      //   backgroundColor: Colors.white,
                                      //   child: Image.asset(
                                      //     'assets/icons/Seller app icon (18).png',
                                      //     height: 2.2.h,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),

                                /*  Icon(
                                        Icons.account_circle_outlined,
                                        color: Colors.grey,
                                        size: 50,
                                      ), */
                                SizedBox(
                                  width: 7,
                                ),
                                Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 0.1.h,
                                        ),
                                        Container(
                                          width: 65.w,
                                          child: Text(
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            '${completechatlist[index].shopName}',
                                            style: TextStyle(
                                                height: 0.2.h,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.sp
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.1.h,
                                        ),
                                        Container(
                                          width: 65.w,
                                          child: Text(
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            '${completechatlist[index].lastMessage}',
                                            style: TextStyle(
                                                height: 0.2.h,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                                fontSize: 10.sp
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 0.1.h,),
                                        Text(
                                          completechatlist[index].createdAt.toString().substring(0,16),
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 10.sp),
                                        )
                                        // GestureDetector(onTap: ,)
                                      ],
                                    )),
                                SizedBox(
                                  width: 9,
                                ),
                                // Image.asset('assets/images/Bag$index.jpg',
                                //     width: 50),
                              ],
                            ),
                          ),
                        );
                      }),
                )
                    :
                Expanded(
                  child: Container(
                      height: 100.h,
                      width: 100.w,
                      margin: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      color: Colors.grey[100],
                      child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/Seller app icon (21).png',
                              height: 6.h,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0, 10, 0, 5),
                              child: Text(
                                Languages.of(context)!.NO_NOTIFICATIONS,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Text(
                              Languages.of(context)!.CONGRATULATIONS_UP_TO_DATE,
                              style: TextStyle(
                                color: Colors.black
                                    .withOpacity(0.8),
                                fontSize: 12,
                              ),
                            )
                          ])),
                )
              ],
            ),
          )),
    );
  }
}
