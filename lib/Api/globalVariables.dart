import 'package:af24client/models/AddressListModel.dart';
import 'package:af24client/models/AllSellersList.dart';
import 'package:af24client/models/BannersModel.dart';
import 'package:af24client/models/BestSellingModel.dart';
import 'package:af24client/models/BrandList.dart';
import 'package:af24client/models/BrandProductModel.dart';
import 'package:af24client/models/CategoriesListModel.dart';
import 'package:af24client/models/CategoryProductModel.dart';
import 'package:af24client/models/ChatListModel.dart';
import 'package:af24client/models/ChatListingModel.dart';
import 'package:af24client/models/ChatMessagesModel.dart';
import 'package:af24client/models/FavouritesList.dart';
import 'package:af24client/models/LatesProductsModel.dart';
import 'package:af24client/models/MakeOffersListModel.dart';
import 'package:af24client/models/NotificationModel.dart';
import 'package:af24client/models/OrderDetailsModel.dart';
import 'package:af24client/models/OrderListModel.dart';
import 'package:af24client/models/ProductDetails.dart';
import 'package:af24client/models/SearchProductsModel.dart';
import 'package:af24client/models/SecretMessagesModel.dart';
import 'package:af24client/models/SellerInfoModel.dart';
import 'package:af24client/models/SellerProducts.dart';
import 'package:af24client/models/TopSellersList.dart';
import 'package:af24client/models/WishListModel.dart';
import 'package:af24client/models/getCartModel.dart';
import 'package:af24client/models/topRated.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../models/Footer_Links.dart';

final Customer_Token = ValueNotifier("");
String? FName;
bool GoogleSignUp = false;
bool LoginSuccess = false;
int notificationCount = 0;
String? LName;
String? Email;
String? Phone;
String? token;
String? title;
String? DOB;
String TermConditions = '';
String? Password;
String? SignUpCode;
String SnackMessage = "";
String LoginSnackMessage = "Failed";
String AddAddressSnackMessage = 'Failed';
String? Emaillogin;
String? PassLogin;
String StatusCode = '403';
String EditProfileStatusCode = '403';
String LoginStatusCode = '403';
String Notification_slug = '';
String Notification_title = '';
String Notification_type = '';
String Notification_sellerid = "";
String Notification_shopImage = '';
String Notification_shopName = '';
String Notification_OrderID = "";
int cartCount = 0;
int Guest = 0;
String tempToken = "";
String? temporary_token;
SellerInfoModel? sellerinfo;
String? EmailVerficationMessage;
String? ForgotPasswordMessage;
List<BrandList> brandList = [];
List<TopSellersList> topSellers = [];
List<AllSellersList> allSellers = [];
List<SellerProducts> sellerProducts = [];
List<CartModel> getCartlist = [];
List<AddressListModel> addressList = [];
List<TopRatedModel> topRatedList = [];
List<OrderListModel> orderList = [];
List<OrderDeatilsModel> orderDetails = [];
ProductDetailsModel? productDetails;
FooterLinks? termsConditions;
FooterLinks? privacy;
MakeOffersListModel? makeOffersList;
List<BannerModel> banners = [];
List<CategoriesListModel> categoriesList = [];
List<BrandProductModel> brandProduct = [];
List<double> productSubtotal = [];
List<LatestProductsModel> latestProducts = [];
List<NotificationsModel> notifications = [];
List<WishListModel> wishList = [];
List<CategoryProductModel> categoryProduct = [];
List<BestSellingModel> bestSellings = [];
List<ChatListingModel> chatList = [];
List<ChatListModel> completechatlist = [];
List<ListElement> secretMessages = [];
List<ChatMessagesModel> chatMessages = [];
List<SearchProductsModel> searchProducts = [];
List<FavouriteSellersList> favouritesList = [];
List<dynamic> FollowBrands = [];
List<dynamic> FollowSellers = [];
List<dynamic> AddToFavouriteSellersButton = [];
String AddToFavouriteResponse = '';
List<String>? size = [];
final LANG_CODE = ValueNotifier("en");
final PAYMENT_METHOD = ValueNotifier("");
String chat_id = '';
var notificationAppLaunchDetails;

void setUserLoggedIn(bool key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("isLoggedIn", key);
}

Future getUserLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var log = prefs.getBool("isLoggedIn") ?? false;
  return log;
}

void saveUserDataToken({@required token}) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString("token", token);
}

Future getUserDataToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? result = pref.getString("token");
  return result;
}

shimmerCategoryLoader() {
  return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        decoration: const BoxDecoration(shape: BoxShape.rectangle),
        width: 75,
        height: 75,
      ));
}

void saveCredsList(List<String> list) async {
  print("save creds");
  print(list);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList("creds", list);
}

Future getCredsList() async {
  print("get creds");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var log = prefs.getStringList("creds") ?? [];
  return log;
}

void setUserFirstTime(bool key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("isFirstTime", key);
}

Future getUserFirstTime() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var log = prefs.getBool("isFirstTime") ?? true;
  return log;
}
