// // ignore_for_file: non_constant_identifier_names
// import 'package:flutter/material.dart';
//
//
// abstract class Languages {
//   static Languages? of(BuildContext context) {
//     return Localizations.of<Languages>(context, Languages);
//   }
//
//   //general
//   String get NO_ADDS_FOUND;
//   String get NO_NOTIFICATIONS;
//   String get SAVE;
//   String get SEND;//
//   String get SUBMIT;
//   String get VIEW_ALL;
//   String get OK;
//   String get ZERO_SAR;
//   String get SAR;
//   String get TO;
//   String get EMAIL;//
//   String get PASSWORD;//
//
//   //mainpage
//   String get CONTINUE_AS_GUEST;//
//   String get CREATE_ACCOUNT;//
//   String get SIGNIN;//
//
//   //LOGIN
//   String get SIGNIN_EMAIL_HINT;//
//   String get SIGNIN_PASSWORD_HINT;//
//   String get LOGIN;//
//   String get FORGOTPASSWORD;//
//   String get DONT_HAVE_AN_ACCOUNT;//
//   String get CONTINUE_WITH_FACEBOOK;//
//   String get CONTINUE_WITH_GOOGLE;//
//
//   //SIGNUP
//   String get SIGNUP_EMAIL_HINT;
//   String get SIGNUP_PASSWORD_HINT;
//   String get SIGNUP_PASSWORD_EXTRA;
//   String get CONFIRM_PASSWORD;
//   String get TITLE;
//   String get TITLE_MR;
//   String get TITLE_MS;
//   String get FIRST_NAME;
//   String get LAST_NAME;
//   String get USERNAME;
//   String get BIRTHDAY;
//   String get MOBILE_NUMBER;
//   String get MOBILE_NUMBER_HINT;
//   String get MOBILE_NUMBER_EXTRA;
//   String get NEWS_LETTER;
//   String get NEWS_LETTER_EXTRA;
//   String get NEWS_LETTER_YES;
//   String get NEWS_LETTER_NO;
//   String get TERMS;
//   String get REGISTER;
//   String get BACK_TO_LOGIN;
//   String get REQUIRED_FIELDS;
//
//
//   //HOME
//   String get SEARCH;
//   String get NEW_IN_BOUTIQUE;
//   String get NEW_IN_BOUTIQUE_DETAILS;
//   String get ADD_MY_OUTLET;
//   String get BRAND_CATEGORY;
//   String get SUPER_SELLER;
//   String get BEST_PRODUCTS;
//   String get CATEGORY;
//
//   //Latest Products
//   String get LATEST_PRODUCTS_TITLE;
//   String get NEW_PRODUCTS_COUNT;
//
//
//   //NOTIFICATIONS
//   String get NOTIFICATIONS_TITLE;
//
//   //MY_PAGE
//   String get MY_PAGE_TITLE;
//   String get MY_AF24;
//   String get MY_ITEMS;
//   String get ORDER_HISTORY;
//   String get EDIT_ACCOUNT_INFO;
//   String get SETTINGS;
//   String get INBOX;
//   String get PUSH_NOTIFICATIONS;
//   String get PRIVACY;
//   String get HELP;
//   String get SELL_WITH_US;
//   String get FAQ;
//   String get LOGOUT;
//
//   //winners page
//   String get NO_WINNERS_FOUND;
//   String get GROUP;
//   String get WINNING_DATE;
//   String get SELECT_DATE;
//   String get ALL_WINNERS;
//   String get PRIZE_MONEY;
//
//   //profile page
//   String get PROFILE_UPDATED;
//
//   //dashboard
//   String get TOTAL_APP_DOWNLOADS;
//   String get TODAY_LOTTERY_VALUE;
//   String get TODAY_LOTTERY_PRIZE;
//   String get NUMBER_OF_WINNERS;
//   String get VALUE;
//   String get NO_LOTTERY;
//
// }



// ignore_for_file: non_constant_identifier_names




// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';


abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  //general
  String get NO_ADDS_FOUND;
  String get NO_NOTIFICATIONS;
  String get SAVE;
  String get SEND;//
  String get SUBMIT;
  String get VIEW_ALL;
  String get OK;
  String get ZERO_SAR;
  String get SAR;
  String get TO;
  String get EMAIL;//
  String get PASSWORD;//
  String get SUCCESS;
  String get ERROR;
  String get ADDRESS;
  String get CANCEL;
  String get Orders;

  //mainpage
  String get CONTINUE_AS_GUEST;//
  String get CREATE_ACCOUNT;//
  String get SIGNIN;//

  //LOGIN
  String get SIGNIN_EMAIL_HINT;//
  String get SIGNIN_PASSWORD_HINT;//
  String get LOGIN;//
  String get FORGOTPASSWORD;//
  String get DONT_HAVE_AN_ACCOUNT;//
  String get CONTINUE_WITH_FACEBOOK;//
  String get CONTINUE_WITH_GOOGLE;//
  String get LOGIN_FAILED;//

  //SIGNUP
  String get SIGNUP_EMAIL_HINT;
  String get SIGNUP_PASSWORD_HINT;
  String get SIGNUP_PASSWORD_EXTRA;
  String get CONFIRM_PASSWORD;
  String get TITLE;
  String get TITLE_MR;
  String get TITLE_MS;
  String get FIRST_NAME;
  String get LAST_NAME;
  String get USERNAME;
  String get BIRTHDAY;
  String get MOBILE_NUMBER;
  String get MOBILE_NUMBER_HINT;
  String get MOBILE_NUMBER_EXTRA;
  String get NEWS_LETTER;
  String get NEWS_LETTER_EXTRA;
  String get NEWS_LETTER_YES;
  String get NEWS_LETTER_NO;
  String get TERMS;
  String get REGISTER;
  String get BACK_TO_LOGIN;
  String get REQUIRED_FIELDS;
  String get REQUIRED;
  String get CONFIRM_PASSWORD_MATCH;
  String get PASSWORD_CONDITION;
  String get DOB_CONDITION;
  String get EMAIL_CONDITION;
  String get MOBILE_CONDITION;
  String get TERMS_CONDITION;
  String get COUNTRY_CONDITION;


  //HOME
  String get SEARCH;
  String get NEW_IN_BOUTIQUE;
  String get NEW_IN_BOUTIQUE_DETAILS;
  String get ADD_MY_OUTLET;
  String get BRAND_CATEGORY;
  String get SUPER_SELLER;
  String get BEST_PRODUCTS;
  String get CATEGORY;
  String get NO_TOP_RATED_PRODUCTS;
  String get NO_BRAND_PRODUCTS;
  String get NO_TOP_SELLERS;
  String get BEST_PRODUCT;
  String get NO_BEST_PRODUCT;

  //Latest Products
  String get LATEST_PRODUCTS_TITLE;
  String get NEW_PRODUCTS_COUNT;


  //NOTIFICATIONS
  String get NOTIFICATIONS_TITLE;
  String get SIZE;
  String get COLOR;
  String get QUANTITY;

  //MY_PAGE
  String get MY_PAGE_TITLE;
  String get MY_AF24;
  String get MY_ITEMS;
  String get ORDER_HISTORY;
  String get EDIT_ACCOUNT_INFO;
  String get SETTINGS;
  String get INBOX;
  String get PUSH_NOTIFICATIONS;
  String get PRIVACY;
  String get HELP;
  String get SELL_WITH_US;
  String get FAQ;
  String get LOGOUT;


  //profile page
  String get PROFILE_UPDATED;

  //dashboard
  String get TOTAL_APP_DOWNLOADS;
  String get TODAY_LOTTERY_VALUE;
  String get TODAY_LOTTERY_PRIZE;
  String get NUMBER_OF_WINNERS;
  String get VALUE;
  String get NO_LOTTERY;

  //Address
  String get GUEST;
  String get NAME;
  String get ADDRESS_TYPE;
  String get TEMPORARY_PERMANENT;
  String get CITY;
  String get ZIP_CODE;
  String get PHONE_NO;
  String get HINT_NO;
  String get ORDER_PROBLEM_NO;
  String get ADDRESS_DETAILS;
  String get LOGIN_BACK;
  String get FIELDS_REQ;
  //AddressList
  String get LOGIN_FIRST;
  String get EMPTY_ADDRESS;
  //Select_Address_CheckOut
  String get SELECT_ADDRESS;
  //Favourites_List_screens
  String get FAVOURITE_SELLERS;
  String get REMOVE_FAVOURITES;
  String get GUEST_MODE;
  //Add_favourite_screens
  String get ADD_FAVOURITE;
  String get VIEW_FAVOURITES;
  String get ALL_SELLERS;
  //AllBrands
  String get ALL_BRANDS;
  //AllSellers
  //Language_main
  String get SEARCH_ITEM;
  String get APP_LANGUAGE_SETTING;
  String get KOREAN;
  String get AREA_SETUP;
  String get CHANGE;
  String get SELECT;
//Language_OPTION
  String get SELECT_REGION;
  String get SELECT_LOCATION;
  String get LANGUAGE_WHERE_YOU;
  String get USING_APP;
  String get VALIDATE;
//BEST_PRODUCT
  String get PRODUCT_FOUND;
//BRAND
  String get REQUEST_COMPLETED;
  String get FOLLOW;
  String get UN_FOLLOW;
  String get PRODUCT;
//CART
  String get VOUCHER_CODE;
  String get APPLY_VOUCHER;
  String get YOUR_CART;
  String get EMPTY_CART;
  String get ADD_VOUCHER_CODE;
  String get TOTAL;
  String get CHECK_OUT;
//CATEGORY_PRODUCT
//CHAT_SCREEN
  String get QUICK_ANS;
  String get WRITE_MESSAGE;
//CHECK_OUT
  String get CHECKOUT;
  String get ADD_ADDRESS;
  String get PAYMENT_METHOD;
  String get SUB_TOTAL;
  String get PLACE_ORDER;
  String get ORDER_PLACED;
  //Edit_Customer_info
  String get EDIT_CUSTOMER_INFO;
  String get PHONE_LENGTH;
  String get SELECT_COUNTRY_FIRST;
  //FAQ_SCREEN
  String get NO_UPDATES_YET;
  //FORGOT_PASSWORD
  String get EMAIL_ADDRESS;
  String get CONFIRM;
  String get CHECK_EMAIL;
  //INBOX
  String get CHATS;
  String get CONGRATULATIONS_UP_TO_DATE;
  //My_item
  String get CART;
  String get WISHLIST;
  String get ALL_CATEGORY;
  //ORDER_DETAILS
  String get ORDERS_DETAILS;
  String get ORDER_NO;
  String get METHOD;
  String get CASH_ON_DELIVERY;
  String get TIME_DATE;
  String get PAYMENT_STATUS;
  String get TAX;
  String get DISCOUNT;
  String get COUPON;
  String get SHIPPING_FEE;
  String get TOTAL_AMOUNT;
  String get CUSTOMER_CONTACT_DETAILS;
  String get CONTACT;
  String get CANCEL_ORDER;
  //ORDER_LIST
  String get MY_ORDER;
  String get NO_ORDER_FOUND;
  String get SEARCH_DATE;
  String get BLACK;
  String get DETAILS;
  String get TRACKING_ID;
  String get DELIVERY_COMPANY;
  String get CONFIRMED;
  //PAYMENT_METHOD
  String get ONLINE_PAYMENT;
  String get CONFIRM_PAYMENT_METHOD;
  //PRIVACY_SCREEN
  String get PRIVACY_POLICES;
  String get  PRIVACY_POLICES_UPDATES;
  //PRODUCT_DETAILS_SCREEN
  String get SELECT_SIZE;
  String get SELECT_COLOR;
  String get ENTER_QUANTITY;
  String get SEND_REQUEST;
  String get ADD_TO_CART;
  String get PRICE;
  String get BUY_REQUEST;
  String get CONTACT_SELLER;
  String get MORE_DESCRIPTION;
  String get QUALITY_CONTROL;
  String get SELLER;
  String get COMMENT;
  String get LEAVE_FIRST_COMMENT;
  //SELL_WITH_US_SCREEN
  //WEB_VIEW
  String get PAYMENT;
  //MY_PAGE
  String get MY_ACCOUNT;
  String get CHAT_WITH_US;
  //SELLER_PROFILE
  String get BANK_NAME;
  String get BRANCH;
  String get ACCOUNT_ID;
  String get HOLDER_NAME;
  String get PHONE_NUMBER;



  //New Screens
//
  String get ContinuewithGoogle;
  String get ContinuewithAppleID;
  String get ContinuewithEmail;
  String get Consent;
  String get Close;
  String get TermsandConditionse;
  String get PrivacyPolicy;
  String get MarketingandProfiling;
  String get Continue;
  String get Signup;
  String get Login;
  String get Firstname;
  String get Lastname;
  String get EmailAddress;
  String get CreatePassword;
  String get ConfirmPassword;
  String get Passwordneedstobeatleast8characters;
  String get Register;
  String get Almostdone;
  String get Forgotpassword;
  String get Verified;
  String get Appsetting;
  String get Cookies;
  String get WeusecookiesimproveyourexperienceonAf24;
  String get Customize;
  String get Accept;
  String get Chooseyourshippingcountry;
  String get Turnonmylocation;
  String get Next;
  String get Notification;
  String get NotificationCategorieA;
  String get NotificationCategorieB;
  String get SkipIwillsetuplater;
  String get Newsletter;
  String get Done;
  String get Hot;
  String get Boutiques;
  String get Activities;
  String get Favourites;
  String get Setting;
  String get Areyouinterestedinthisproduct;
  String get Leaveacommenttotheseller;
  String get Aboutseller;
  String get Followthisseller;
  String get Locatoin;
  String get Shippingto;
  String get Comment;
  String get Availablelanguage;
  String get Since;
  String get Superseller;
  String get follwers;
  String get Activeonlist;
  String get Sold;
  String get Sellerreview;
  String get addcomment;
  String get AboutBoutique;
  String get FollowthisBoutique;
  String get boutiquereview;
  String get Support;
  String get Commentdetails;
  String get Ordernow;
  String get Cancel;
  String get Ihaveanissuewithmyproduct;
  String get Imageupload;
  String get Orderdetails;
  String get Shipping;
  String get Arrived;
  String get WaitforFeedback;
  String get Commenthistory;
  String get Reportmyissue;
  String get DoyouhaveanyQuestion;
  String get Ihaveaquestion;
  String get Title;
  String get Description;
  String get Writingsomething;
  String get Send;
  String get Supportmessage;
  String get Feedback;
  String get AllgoodThanks;
  String get Products;
  String get Brands;
  String get Sellers;
  String get Boutigues;
  String get Account;
  String get Logout;
  String get Personalinfo;
  String get Passwordchange;
  String get Shippinginformation;
  String get Postcode;
  String get City;
  String get Country;
  String get Billingaddressissameasshipping;
  String get SignuporLogin;
  String get Search;
  String get Women;
  String get Men;
  String get Kids;
  String get Lifestyle;
  String get Seller;
  String get Category;
  String get Filter;
  String get Reset;
  String get Addtomyfilter;



}
