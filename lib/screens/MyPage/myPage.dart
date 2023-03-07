import 'package:af24client/Api/Auth_af24.dart';
import 'package:af24client/localization/languages/languages.dart';
import 'package:af24client/screens/Chat%20Screen/chatBox.dart';
import 'package:af24client/screens/EditCustomerInfo/EditCustomerInfoScreen.dart';
import 'package:af24client/screens/FAQ/FAQScreen.dart';
import 'package:af24client/screens/Inbox/ChatInbox.dart';
import 'package:af24client/screens/LoginCreateAccount/login.dart';
import 'package:af24client/screens/Notification/notification_main_page.dart';
import 'package:af24client/screens/Privacy/PrivacyScreen.dart';
import 'package:af24client/screens/SelleWithUS/SellWithUsScreen.dart';
import 'package:af24client/screens/SellerProfile.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../Models/profile.dart';
import '../../Provider/cartProvider.dart';
import '../../Api/globalVariables.dart';
import '../../navBar.dart';
import '../AppLanguageSettings/languageMain.dart';
import '../Cart/cart.dart';
import '../LoginCreateAccount/homePage.dart';
import '../My Items/my_items.dart';
import '../OrderHistory/OrderList.dart';

class myPage extends StatefulWidget {
  const myPage({Key? key}) : super(key: key);

  @override
  _myPageState createState() => _myPageState();
}

class _myPageState extends State<myPage> {
  bool MyAf24 = false;
  bool Help = false;
  bool Setting = false;

  fun() async {
    await DataApiService.instance.getCartCount(sellerinfo!.id!.toInt());
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(Guest == 1)
      {

      }
    else
      {
        fun();
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        elevation: 0,
        leadingWidth: 50.w,
        leading: Padding(
          padding: const EdgeInsets.only(top: 9.0, left: 20.0),
          child: Text(Languages.of(context)!.MY_PAGE_TITLE,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
        ),
        // title: Padding(
        //   padding: const EdgeInsets.only(top: 9.0),
        //   child: Text("My page",
        //       style:
        //       TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 25)),
        // ),
        actions: [
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
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Guest == 1
                          ? Image.asset(Profile[0].imagePath)
                          : sellerinfo!.image == '' ||
                                  sellerinfo!.image == 'def.png' ||
                                  sellerinfo!.image == null
                              ? Image.asset(Profile[0].imagePath)
                              : ClipOval(
                                  child: CachedNetworkImage(
                                    height: 12.h,
                                    width: 12.h,
                                    imageUrl:
                                        'https://becknowledge.com/af24/public/storage/profile/' +
                                            sellerinfo!.image.toString(),
                                    fit: BoxFit.contain,
                                    placeholder: (context, url) =>
                                        shimmerCategoryLoader(),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      height: 12.h,
                                      width: 12.h,
                                      'assets/images/NoPic.jpg',
                                    ),
                                  ),
                                  //Image.network('https://becknowledge.com/af24/public/storage/profile/'+sellerinfo!.image.toString(),height: 12.0.h,width: 12.0.h,fit: BoxFit.fill)),
                                ),
                    ),
                    Guest == 1
                        ? Text(Languages.of(context)!.GUEST)
                        : Text(sellerinfo!.fName! +
                            ' ' +
                            sellerinfo!.lName.toString())
                  ],
                ),
              ),
            ),
            // Row(
            //   children: [
            //     Image.asset(Profile[0].imagePath),
            //     Text(Profile[0].userName)
            //   ],
            // ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    MyAf24 = !MyAf24;
                  });
                },
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        Text(
                          Languages.of(context)!.MY_AF24,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        MyAf24 == true
                            ? Icon(
                                Icons.arrow_drop_up,
                                size: 3.5.h,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.arrow_drop_down,
                                size: 3.5.h,
                                color: Colors.black,
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            MyAf24 == true
                ? Container(
                    decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1.0, color: Colors.grey),
                        ),
                        color: Colors.grey.withOpacity(0.2)),
                    child: InkWell(
                      onTap: () {
                        Get.to(category());
                      },
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text("- " + Languages.of(context)!.MY_ITEMS),
                        ),
                      ),
                    ),
                  )
                : Container(),
            MyAf24 == true
                ? InkWell(
                    onTap: () async {
                      Get.to(OrderList());
                      print('Order List Api Called');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1.0, color: Colors.grey),
                          ),
                          color: Colors.grey.withOpacity(0.2)),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text("- " + Languages.of(context)!.ORDER_HISTORY),
                        ),
                      ),
                    ),
                  )
                : Container(),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),
              child: ListTile(
                onTap: () {
                  Guest == 1
                      ? AwesomeDialog(
                          context: context,
                          dialogType: DialogType.INFO,
                          animType: AnimType.BOTTOMSLIDE,
                          title: Languages.of(context)!.LOGIN,
                          desc: Languages.of(context)!.LOGIN_FIRST,
                          btnCancelOnPress: () {},
                          btnCancelText: "Cancel",
                          btnOkText: "Login",
                          btnOkOnPress: () {
                            Get.to(() => Login());
                          },
                        ).show()
                      : Get.to(EditCustomerInfoScreen());
                  setState(() {});
                },
                title: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    Languages.of(context)!.EDIT_ACCOUNT_INFO,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),
              child: ListTile(
                onTap: () {
                  Get.to(languageMain());
                },
                title: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    Languages.of(context)!.SETTINGS,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),
              child: InkWell(
                onTap: () {
                  // Get.to(()=>chatBox());
                  Get.to(ChatInbox());
                },
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(Languages.of(context)!.INBOX),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  color: Colors.grey.withOpacity(0.2)),
              child: InkWell(
                onTap: () {
                  Get.to(() => MainPage());
                },
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text("- " + Languages.of(context)!.PUSH_NOTIFICATIONS),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                Get.to(()=>PrivacyScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    color: Colors.grey.withOpacity(0.2)),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text("- " + Languages.of(context)!.PRIVACY),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    Help = !Help;
                  });
                },
                child: ListTile(
                  title: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          Text(
                            Languages.of(context)!.HELP,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Help
                              ? Icon(
                                  Icons.arrow_drop_up,
                                  size: 3.5.h,
                                  color: Colors.black,
                                )
                              : Icon(
                                  Icons.arrow_drop_down,
                                  size: 3.5.h,
                                  color: Colors.black,
                                ),
                        ],
                      )),
                ),
              ),
            ),
            Help
                ? Container(
                    decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1.0, color: Colors.grey),
                        ),
                        color: Colors.grey.withOpacity(0.2)),
                    child: InkWell(
                      onTap: () async {
                        Get.to(()=>SellWithUsScreen());
                      },
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text("- " + Languages.of(context)!.SELL_WITH_US),
                        ),
                      ),
                    ),
                  )
                : Container(),
            Help
                ? Container(
                    decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1.0, color: Colors.grey),
                        ),
                        color: Colors.grey.withOpacity(0.2)),
                    child: InkWell(
                      onTap: () async {
                        Get.to(()=>FAQScreen());
                      },
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text("- " + Languages.of(context)!.FAQ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.grey),
                  bottom: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),
              child: InkWell(
                onTap: () {
                  if(GoogleSignUp == true)
                    {
                      DataApiService.instance.logout(sellerinfo!.id!);
                      GoogleSignIn _googleSignIn = GoogleSignIn();
                      _googleSignIn.signOut();
                      setState(() {
                        GoogleSignUp = false;
                      });
                    }
                  if(Guest == 1)
                    {
                    }
                  else
                  {
                    DataApiService.instance.logout(sellerinfo!.id!);
                  }
                  setUserLoggedIn(false);
                  Guest == 1 ? Get.offAll(Login()) : Get.offAll(mainpage());
                },
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Guest == 1
                        ? Text(
                            Languages.of(context)!.LOGIN,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        : Text(
                            Languages.of(context)!.LOGOUT,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
