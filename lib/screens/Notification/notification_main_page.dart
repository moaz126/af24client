import 'package:af24client/localization/languages/languages.dart';
import 'package:af24client/Api/globalVariables.dart';
import 'package:af24client/screens/Chat%20Screen/chatBox.dart';
import 'package:af24client/screens/Inbox/ChatInbox.dart';
import 'package:af24client/screens/MakeAnOffer/offer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Api/Auth_af24.dart';
import '../../Provider/NotificationProvider.dart';
import '../../Provider/cartProvider.dart';
import '../../navBar.dart';
import '../../newBar.dart';
import '../Cart/cart.dart';
import '../Home/Home.dart';
import '../OrderHistory/OrderDetails.dart';
import '../Product Detail/ProductDetailsScreen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool buttonstatus1 = false;
  bool buttonstatus2 = true;
  bool buttonstatus3 = false;
  bool buttonstatus4 = false;
  bool MainScreenStatus = true;
  bool secondScreen = false;
  bool loader = false;
  bool Chatloader = false;
  bool thiredScreen = false;
  bool forthScreen = false;
  final cron = Cron();
  Close() async {
    await cron.close();
  }

  ProductNav(String ProductSlug)
  async {
    Get.to(()=>ProductDetailsScreen(ProductSlug));
  }

  OrderNav(String OrderId)
  async {
    Get.to(()=>OrderDetails(OrderId));
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
      Chatloader = true;
    });
    print(sellerinfo!.id.toString());
    await DataApiService.instance.getnotification(sellerinfo!.id.toString());
    setState(() {
      loader = false;
      Chatloader = false;
    });
    await DataApiService.instance.getCompleteChatList(sellerinfo!.id.toString());
    if(Guest == 1)
      {

      }
    else
      {
        await DataApiService.instance.getCartCount(sellerinfo!.id!.toInt());
        setState(() {

        });
      }
  }
  @override
  void initState() {
    // TODO: implement initState
    Guest == 1 ?
        Container()
        :
    fun();
    super.initState();
  }
  final List<String> Entries = <String>[
    'The Seller is ready to drop their price to W930984. Make an offer now!',
    'The Price of the item Mach & Mach Mules has just been reduced.',
    'The price of the item Mach & Mach Mules has just been reduced.',
    'The price of the item Mach & Mach Mules has just been reduced.',
    'The price of the item Mach & Mach Mules has just been reduced.',
    'The price of the item Mach & Mach Mules has just been reduced.',
    'The price of the item Mach & Mach Mules has just been reduced.',
    'The price of the item Mach & Mach Mules has just been reduced.',
    'The price of the item Mach & Mach Mules has just been reduced.',
    'The price of the item Mach & Mach Mules has just been reduced.',
  ];
  final List<Image> Images = <Image>[
    Image.asset("assets/images/1.PNG"),
    Image.asset("assets/images/2.PNG"),
    Image.asset("assets/images/3.PNG")
  ];

  final spinkit = SpinKitSpinningLines(
    size: 5.h,
    color: Colors.black,
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          titleSpacing: 0,
          elevation: 0,
          leading: InkWell(
            onTap: (){
              // Get.back();
              Get.offAll(() => newBar(index: 0));
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
            child: Text(Languages.of(context)!.NOTIFICATIONS_TITLE,
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          actions: [
            SizedBox(
              width: 3.w,
            ),
            InkWell(
              onTap: () async {
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
            Guest == 1 ?
        Center(
          child: Container(
            child: Text(Languages.of(context)!.GUEST_MODE),
          ),
        )
            :
        loader == true ? spinkit :
            Guest == 1 ?
            Expanded(
              child: Container(
                  height: 100,
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
            :
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Column(
            children: [
              /*  SizedBox(
                height: 10,
              ), */
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                color: Colors.white,
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      /* child: Icon(Icons.chat,
                          color: (buttonstatus1 == false)
                              ? Colors.grey
                              : Colors.green), */

                      child: (buttonstatus1 == false)
                          ? Image.asset('assets/icons/Seller app icon (2).png',
                              height: 15)
                          : Image.asset('assets/icons/Seller app icon (1).png',
                              height: 15),
                      onPressed: () {
                        // Get.to(ChatInbox());
                        setState(() {
                          buttonstatus2 = false;
                          buttonstatus1 = true;
                          buttonstatus3 = false;
                          buttonstatus4 = false;
                          MainScreenStatus = false;
                          secondScreen = true;
                          thiredScreen = false;
                          forthScreen = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        //elevation: 0,
                        fixedSize: Size(23.w, 50),
                        primary: (buttonstatus1 == false)
                            ? Colors.grey[100]
                            : Colors.white,
                        shadowColor: Colors.white,
                        padding: EdgeInsets.symmetric(),
                        textStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      /* child: Icon(
                        Icons.notifications_outlined,
                        color: (buttonstatus2 == false)
                            ? Colors.grey
                            : Colors.blue,
                      ), */
                      child: (buttonstatus2 == true)
                          ? Image.asset('assets/icons/Seller app icon (3).png',
                              height: 15)
                          : Image.asset('assets/icons/Seller app icon (4).png',
                              height: 15),
                      onPressed: () {
                        setState(() {
                          buttonstatus2 = true;
                          buttonstatus1 = false;
                          buttonstatus3 = false;
                          buttonstatus4 = false;
                          MainScreenStatus = true;
                          secondScreen = false;
                          thiredScreen = false;
                          forthScreen = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(23.w, 50),
                          //elevation: 0,
                          primary: (buttonstatus2 == false)
                              ? Colors.grey[100]
                              : Colors.white,
                          padding: EdgeInsets.symmetric(),
                          shadowColor: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    ElevatedButton(
                      child: Icon(
                        Icons.people,
                        color: (buttonstatus3 == false)
                            ? Colors.grey
                            : Colors.indigoAccent,
                        size: 18,
                      ),
                      onPressed: () {
                        setState(() {
                          buttonstatus2 = false;
                          buttonstatus1 = false;
                          buttonstatus3 = true;
                          buttonstatus4 = false;
                          MainScreenStatus = false;
                          secondScreen = false;
                          thiredScreen = true;
                          forthScreen = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          //elevation: 0,

                          fixedSize: Size(23.w, 50),
                          primary: (buttonstatus3 == false)
                              ? Colors.grey[100]
                              : Colors.white,
                          padding: EdgeInsets.symmetric(),
                          shadowColor: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    ElevatedButton(
                      child: Icon(
                        Icons.favorite_rounded,
                        size: 18,
                        color: (buttonstatus4 == false)
                            ? Colors.grey
                            : Colors.pink.withOpacity(0.7),
                      ),
                      onPressed: () {
                        setState(() {
                          buttonstatus2 = false;
                          buttonstatus1 = false;
                          buttonstatus3 = false;
                          buttonstatus4 = true;
                          MainScreenStatus = false;
                          secondScreen = false;
                          thiredScreen = false;
                          forthScreen = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          //elevation: 0,
                          fixedSize: Size(23.w, 50),
                          primary: (buttonstatus4 == false)
                              ? Colors.grey[100]
                              : Colors.white,
                          padding: EdgeInsets.symmetric(),
                          shadowColor: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ),
              MainScreenStatus == true ? notifications.length >0
                  ? Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.only(top: 8),
                          itemCount: notifications.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Consumer<MyNotification>(
                                builder: (context, value, child) {
                                  return
                                  InkWell(
                                    onTap: () {
                                      DataApiService.instance.Seennotification(
                                          notifications[index].id.toString());
                                      DataApiService.instance.getnotification(sellerinfo!.id.toString());
                                      setState(() {

                                      });
                                      notifications[index].seen == 0 ?
                                      value.decrement()
                                      :
                                          Container();
                                          notifications[index].data.data
                                              .notifyType == 2 ||
                                          notifications[index].data.data
                                              .notifyType == 3 ||
                                          notifications[index].data.data
                                              .notifyType == 8 ?
                                      ProductNav(
                                          notifications[index].data.productSlug
                                              .toString())
                                          :
                                      notifications[index].title == "Order" ?
                                      OrderNav(notifications[index].orderId
                                          .toString())
                                          :
                                      notifications[index].data.data
                                          .notifyType == 1 ?
                                          Get.to(offers(notifications[index].data.productSlug.toString()))
                                          :
                                      Get.to(() => newBar(index: 0));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      height: 100,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 3),
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          notifications[index].seen == 0 ?
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
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Stack(
                                              alignment: Alignment.topRight,
                                              children: [
                                                Image.asset(
                                                  'assets/icons/My Page.png',
                                                  height: 6.9.h,
                                                ),
                                                CircleAvatar(
                                                  maxRadius: 10,
                                                  backgroundColor: Colors.white,
                                                  child: Image.asset(
                                                    'assets/icons/Seller app icon (18).png',
                                                    height: 2.2.h,
                                                  ),
                                                ),
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
                                                  Text(
                                                    maxLines: 1,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                    '${notifications[index]
                                                        .title}',
                                                    style: TextStyle(
                                                        height: 0.2.h,
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        fontSize: 10.sp
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 0.1.h,
                                                  ),
                                                  Text(
                                                    maxLines: 2,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                    '${notifications[index]
                                                        .description}',
                                                    style: TextStyle(
                                                        height: 0.2.h,
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        fontSize: 10.sp
                                                    ),
                                                  ),
                                                  notifications[index].data.data.notifyType == 4 ?
                                                      Row()
                                                      :
                                                  Row(
                                                    children: [
                                                      Text(
                                                        Languages.of(context)!
                                                            .SIZE + ": " +
                                                            notifications[index]
                                                                .data.data.size
                                                                .toString(),
                                                        style: TextStyle(
                                                            fontSize: 10.sp),
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Row(
                                                        children: [
                                                          Text(Languages.of(
                                                              context)!.COLOR +
                                                              ": ",
                                                            style: TextStyle(
                                                                fontSize: 10
                                                                    .sp),),
                                                          Container(
                                                            height: 15,
                                                            width: 15,
                                                            color: HexColor(
                                                                notifications[index]
                                                                    .data.data
                                                                    .color
                                                                    .toString()),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Text(
                                                        Languages.of(context)!
                                                            .QUANTITY + ": " +
                                                            notifications[index]
                                                                .data.data
                                                                .quantity
                                                                .toString(),
                                                        style: TextStyle(
                                                            fontSize: 10.sp),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 0.1.h,),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        notifications[index]
                                                            .createdAt
                                                            .toString()
                                                            .substring(0, 16),
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 10.sp),
                                                      ),
                                                    ],
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
                                }
                            );
                          }),
                    )
                  :
              Expanded(
                child: Container(
                    height: 100,
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
              :
              secondScreen == true
                      ?
              Expanded(
                child: Container(
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
                                                completechatlist[index].shopImage.toString() == "def.png" || completechatlist[index].shopImage.toString() == "" ?
                                                Image.asset('assets/icons/My Page.png',height: 9.h,fit: BoxFit.fill,)
                                                    :
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
                                              Row(
                                                children: [
                                                  Text(
                                                    completechatlist[index].createdAt.toString().substring(0,16),
                                                    style: TextStyle(
                                                        color: Colors.grey, fontSize: 10.sp),
                                                  ),
                                                ],
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
                ),
              )
                      : thiredScreen == true
                          ? Expanded(
                              child: ListView.builder(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  itemCount: 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           chatBox(productDetails!.userId.toString())),
                                        // );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        height: 100,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 3),
                                        color: Colors.white,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 8,
                                              width: 8,
                                              decoration: BoxDecoration(
                                                  color: Colors.orange[700],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Stack(
                                                alignment: Alignment.topRight,
                                                children: [
                                                  Image.asset(
                                                    'assets/icons/Seller app icon (7).png',
                                                    height: 6.9.h,
                                                  ),
                                                  /*  CircleAvatar(
                                          maxRadius: 11,
                                          backgroundColor: Colors.white,
                                          child: Image.asset(
                                              'assets/icons/Seller app icon (18).png',
                                              height: 2.5.h,
                                              
                                          ),
                                        ), */
                                                ],
                                              ),
                                            ),
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
                                                  height: 2,
                                                ),
                                                Text(
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  'Olga_Dumont is your newest follower! Check out their profile and give them a follow back',
                                                  style: TextStyle(
                                                    height: 0.2.h,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10.sp,
                                                  ),
                                                ),
                                                SizedBox(height: 0.1.h,),
                                                Text(
                                                  "1w",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10.sp),
                                                )
                                                // GestureDetector(onTap: ,)
                                              ],
                                            )),
                                            /*   SizedBox(
                                              width: 9,
                                            ),
                                            Image.asset('assets/images/1.PNG',
                                                width: 50), */
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          : forthScreen == true
                              ?
              Expanded(
                                  child: Container(
                                      height: 100,
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
                              : Container()
            ],
          ),
        ));
  }
}
