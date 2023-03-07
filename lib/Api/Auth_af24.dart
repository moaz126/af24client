import 'dart:convert';
import 'dart:ffi';
import 'package:af24client/Api/Urls.dart';
import 'package:af24client/Api/globalVariables.dart';
import 'package:af24client/Models/ProductDetailsList.dart';
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
import 'package:af24client/models/Footer_Links.dart';
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
import 'package:af24client/models/topRated.dart';
import 'package:af24client/screens/SellerProfile.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../models/getCartModel.dart';

class DataApiService {
  DataApiService._();

  static final DataApiService _instance = DataApiService._();

  static DataApiService get instance => _instance;

  Future getHomeContent() async {
    String url = base_url + signup_url;
    print(url);
    // print(CUSTOMER_TOKEN.value);
    // try {
    //   http.Response response = await http.get(Uri.parse(url), headers: {
    //     "Authorization": "Bearer ${CUSTOMER_TOKEN.value}",
    //   });
    //   print(response.body);
    //   final result = jsonDecode(response.body);
    //   if (result['success']) {
    //     homePageContent = HomePageModel.fromJson(result['data']);
    //   }
    // } on Exception {
    //   rethrow;
    // } catch (e) {
    //   rethrow;
    // }
  }

  Future getlogintoken(Map<String, dynamic> body, context) async {
    String url = base_url + login_url;
    LoginStatusCode = '403';
    print(url);
    print(body['email']);
    print(body['password']);
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: body,
      );
      final result = jsonDecode(response.body);
      tempToken = '';
      if (result['success'] == true) {
        Customer_Token.value = (result['token']);
        SnackMessage = 'Login successfullly';
        setUserLoggedIn(true);
        saveUserDataToken(token: Customer_Token.value);
        print(Customer_Token.value);
        return true;
      } else {
        if (result['temporary_token'] != null) {
          print('temp token');
          print(result['temporary_token']);
          SnackMessage = result['message'];
          tempToken = result['temporary_token'];
        } else {
          SnackMessage = result['message'];
        }
        return false;
      }
      /*  if (response.statusCode == 200) {
        LoginSnackMessage = 'Login successfully';
        LoginSuccess = result['success'];
        print(LoginSuccess);
        print(LoginSuccess);
        if (LoginSuccess == true) {
          print("In if");
          print("In if");
          Customer_Token.value = (result['token']);
          setUserLoggedIn(true);
          saveUserDataToken(token: Customer_Token.value);
          print(Customer_Token.value);
        }
        return true;
      } else {
        print('sgvcznxfgfbvsvfcgfbvc');
        print(result['errors'][0]['message']);
        LoginSnackMessage = result['errors'][0]['message'];
        return false;
      } */
      // Customer_Token.value = (result['token']);
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getSignUptoken(Map<String, dynamic> body, context) async {
    String url = base_url + signup_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: body,
      );
      print(body);
      final result = jsonDecode(response.body);

      StatusCode = response.statusCode.toString();
      if (result['success'] == true) {
        Customer_Token.value = (result['token']);
        SnackMessage = 'Account created successfully';
        return true;
      } else {
        print(result['errors'][0]['message']);
        SnackMessage = result['errors'][0]['message'];
        return false;
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getFooterLinks() async {
    String url = base_url + footerLinks_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      });
      final result = jsonDecode(response.body);
      // SellerInfoModel sellerinfo = result;
      // SellerInfoModel sellerinfo = result[0].map;
      StatusCode = response.statusCode.toString();
      print(result);
      print(result["terms_condition"]);
      termsConditions = FooterLinks.fromJson(result["terms_condition"]);
      privacy = FooterLinks.fromJson(result["privacy_policy"]);
      // print('Hello');
      // print(result);
      // print(sellerinfo!.fName);
      // print('Hy');

      if (response.statusCode == 200) {
        print('Terms and Conditions');
        print(result);
        print(termsConditions);
        print('List');
      } else {
        print('List');
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getMakeOffersList(String product_id, String seller_id) async {
    String url = base_url + makeOffers_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.post(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      }, body: {
        "product_id": product_id,
        "seller_id": seller_id,
      });
      final result = jsonDecode(response.body);
      StatusCode = response.statusCode.toString();
      print(result);
      print(result["List"]);
      makeOffersList = MakeOffersListModel.fromJson(result);
      // print('Hello');
      // print(result);
      // print(sellerinfo!.fName);
      // print('Hy');

      if (response.statusCode == 200) {
        print('Make Offers');
        print(makeOffersList);
        print('List');
      } else {
        print('List');
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future addToFavourites(String seller_id) async {
    String url = base_url + addToFavourites_url + seller_id;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${Customer_Token.value}",
        },
      );
      final result = jsonDecode(response.body);
      StatusCode = response.statusCode.toString();
      AddToFavouriteResponse = result["message"];
      AddToFavouriteSellersButton = result["list"];
      if (response.statusCode == 200) {
        print('Add To Favourite');
        print(result);
        print(AddToFavouriteResponse);
        print('List');
      } else {
        print('List');
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getSellerInfo() async {
    String url = base_url + sellerinfo_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      });
      final result = jsonDecode(response.body);
      // SellerInfoModel sellerinfo = result;
      // SellerInfoModel sellerinfo = result[0].map;
      sellerinfo = SellerInfoModel.fromJson(result);
      // StatusCode = response.statusCode.toString();
      // print('Hello');
      // print(result);
      // print(sellerinfo!.fName);
      // print('Hy');

       
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getProductDetails(String? slug) async {
    String url;
    if (Guest == 1) {
      url = base_url + productDetails_url + slug! + '/0';
    } else {
      url = base_url +
          productDetails_url +
          slug! +
          '/' +
          sellerinfo!.id.toString();
    }
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      });
      final result = jsonDecode(response.body);
      // SellerInfoModel sellerinfo = result;
      // SellerInfoModel sellerinfo = result[0].map;
      print('Hello');
      productDetails = ProductDetailsModel.fromJson(result);
      StatusCode = response.statusCode.toString();
      print('Hy');
      // print('Hello');
      // print(result);
      // print(sellerinfo!.fName);
      // print('Hy');

       
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getBanners() async {
    String url = base_url + banners_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.post(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      }, body: {
        'banner_type': 'main_banner'
      });
      final result = jsonDecode(response.body);
      // SellerInfoModel sellerinfo = result;
      // SellerInfoModel sellerinfo = result[0].map;
      print('Hello');
      banners =
      List<BannerModel>.from(result.map((x) => BannerModel.fromJson(x)));
      StatusCode = response.statusCode.toString();
      print('Hy');
      // print('Hello');
      // print(result);
      // print(sellerinfo!.fName);
      // print('Hy');

       
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getbrandlist() async {
    String url = base_url + brandlist_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.get(
        Uri.parse(url),
      );
      final result = jsonDecode(response.body);
      // SellerInfoModel sellerinfo = result;
      // // SellerInfoModel sellerinfo = result[0].map;
      if (response.statusCode == 200) {
        brandList =
        List<BrandList>.from(result.map((x) => BrandList.fromJson(x)));
        StatusCode = '200';
      } else {
        StatusCode = '403';
      }

      // sellerinfo =  SellerInfoModel.fromJson(result);
      // StatusCode = response.statusCode.toString();

      print('Brand');
      print(brandList[0].id);
      // print(sellerinfo!.fName);
      print('List');

       
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getTopRated() async {
    String url = base_url + topRated_url;
    print(url);

    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      });
      print(response.body);
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Success');
        print(result["products"]);
        print("divider");
        topRatedList = List<TopRatedModel>.from(
            result["products"].map((x) => TopRatedModel.fromJson(x)));
        //print(catergorylist[0].subCategories[0].name);
      } else {
        print("unsuccess");
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getChatList() async {
    String url = base_url + chatListing_url;
    print(url);

    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      });
      print(response.body);
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Success');
        print(result["products"]);
        print("divider");
        chatList = List<ChatListingModel>.from(
            result.map((x) => ChatListingModel.fromJson(x)));
        //print(catergorylist[0].subCategories[0].name);
        print(chatList.length);
      } else {
        print("unsuccess");
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getCompleteChatList(String user_id) async {
    String url = base_url + completechatList_url;
    print(url);

    try {
      http.Response response = await http.post(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      }, body: {
        'user_id': user_id
      });
      print(response.body);
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Success');
        print("divider");
        completechatlist = List<ChatListModel>.from(
            result.map((x) => ChatListModel.fromJson(x)));
        //print(catergorylist[0].subCategories[0].name);
      } else {
        print("unsuccess");
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future sendMessage(String Message, String seller_id) async {
    String url = base_url + sendMessaeg_url;
    print(url);

    try {
      http.Response response = await http.post(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      }, body: {
        'seller_id': seller_id,
        'message': Message,
      });
      print(response.body);
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Success');
        print("divider");
      } else {
        print("unsuccess");
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future sendSecretMessage(
      String Message, String seller_id, String product_id) async {
    String url = base_url + sendSecretMessage_url;
    print(url);
    print(Message);
    print(seller_id);
    print(product_id);

    try {
      http.Response response = await http.post(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      }, body: {
        'user_id': seller_id,
        'message': Message,
        'product_id': product_id,
      });
      print(response.body);
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Success');
        print("divider");
      } else {
        print("unsuccess");
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future logout(int id) async {
    String url = base_url + id.toString() + "/logout";
    print(url);

    try {
      http.Response response = await http
          .post(Uri.parse(url), headers: {"Accept": "application/json"});
      print(response.body);
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getChatMessages(String shop_id) async {
    String url = base_url + chatMessages_url;
    print(url);
    print('Seller ');
    print(shop_id);
    print(shop_id);
    print(shop_id);
    print('List');
    try {
      http.Response response = await http.post(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      }, body: {
        'seller_id': shop_id,
      });
      print(response.body);
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('chat');
        print('chat');
        print(result);
        print("Messages");
        chatMessages = List<ChatMessagesModel>.from(
            result.map((x) => ChatMessagesModel.fromJson(x)));
        //print(catergorylist[0].subCategories[0].name);
        print(chatMessages.length);
      } else {
        print("unsuccess");
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getSecretComments(String product_id) async {
    String url = base_url + secretComments_url;
    print(url);

    try {
      http.Response response = await http.post(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      }, body: {
        'product_id': product_id,
      });
      print('');
      print(response.body);
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Secret');
        print(result);
        print("Comments");
        secretMessages = List<ListElement>.from(
            result['list']['comments'].map((x) => ListElement.fromJson(x)));
        //print(catergorylist[0].subCategories[0].name);
        print(secretMessages.length);
      } else {
        print("unsuccess");
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getBestSellings() async {
    String url = base_url + bestSelling_url;
    print(url);

    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      });
      print(response.body);
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Success');
        print(result["products"]);
        print("divider");
        bestSellings = List<BestSellingModel>.from(
            result["products"].map((x) => BestSellingModel.fromJson(x)));
        //print(catergorylist[0].subCategories[0].name);
      } else {
        print("unsuccess");
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  // Future UpdateCustomerInfo(Map<String, dynamic> body,String? imagepath) async {
  //   String url = base_url + customerUpdateInfo_url;
  //   StatusCode = '403';
  //   print(url);
  //   try {
  //     http.Response response = await http.post(
  //       Uri.parse(url),
  //       headers: {
  //         "Authorization": "Bearer ${Customer_Token.value}",
  //       },
  //       body: {
  //         body,
  //         var request = http.MultipartRequest('POST', Uri.parse(url));
  //         request.fields.addAll({
  //         "name": name,
  //         "contact": number,
  //         "address": address,
  //         });
  //         if (file != '') {
  //         request.files.add(await http.MultipartFile.fromPath('image', file));
  //         }
  //
  //         request.headers.addAll(headers);
  //
  //         http.StreamedResponse response = await request.send();
  //
  //         String ans = await response.stream.bytesToString();
  //         final result = jsonDecode(ans);
  //       }
  //     );
  //
  //     final result = jsonDecode(response.body);
  //     // SellerInfoModel sellerinfo = result;
  //     // SellerInfoModel sellerinfo = result[0].map;
  //     StatusCode = response.statusCode.toString();
  //     // print('Hello');
  //     // print(result);
  //     // print(sellerinfo!.fName);
  //     // print('Hy');
  //
  //     if (response.statusCode == 200) {
  //       EmailVerficationMessage = 'Information Updated Successfully';
  //     } else {
  //       print('sgvcznxfgfbvsvfcgfbvc');
  //       print(result['errors'][0]['message']);
  //       EmailVerficationMessage = result['errors'][0]['message'];
  //     }
  //   } on Exception {
  //     rethrow;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future UpdateCustomerInfo(String fname, String lname, String number,
      String file, String country_code, String country_name) async {
    String url = base_url + customerUpdateInfo_url;
    print(url);
    print(url);
    print(file);
    var headers = {
      "Authorization": "Bearer ${Customer_Token.value}",
    };
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll({
      "f_name": fname,
      "l_name": lname,
      "phone": number,
      "country_code": country_code,
      "country_name": country_name,
    });
    if (file != '') {
      request.files.add(await http.MultipartFile.fromPath('image', file));
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print('Muneeb');
    String ans = await response.stream.bytesToString();
    final result = jsonDecode(ans);
    print(result);
    EditProfileStatusCode = response.statusCode.toString();

    if (response.statusCode == 200) {
      EmailVerficationMessage = 'Information Updated Successfully';
      print("sssss");
      print(result);

      return result;
    } else if (response.statusCode == 401) {
      print("unsuccess");
    } else {
      EmailVerficationMessage = "Something went wrong.";
    }
  }

  Future sendProductRequest(Map<String, dynamic> body) async {
    String url = base_url + sendProductRequest_url;
    StatusCode = '403';
    print(url);
    print(body);
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${Customer_Token.value}",
        },
        body: body,
      );
      final result = jsonDecode(response.body);
      print(result);
      print(result);
      // SellerInfoModel sellerinfo = result;
      // SellerInfoModel sellerinfo = result[0].map;
      StatusCode = response.statusCode.toString();
      print(StatusCode);
      print(StatusCode);
      // print('Hello');
      // print(result);
      // print(sellerinfo!.fName);
      // print('Hy');

      if (response.statusCode == 200) {
        EmailVerficationMessage = result['message'];
        print('Request Send Successfully');
      } else {
        EmailVerficationMessage = result['message'];
        print('Something bad happened');
        print(result['message']);
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getOrderList() async {
    String url = base_url + orderList_url;
    print(url);

    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      });
      print(response.body);
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Order');
        print(result);
        print("List");
        orderList = List<OrderListModel>.from(
            result.map((x) => OrderListModel.fromJson(x)));
        print(orderList.length);
      } else {
        print("Seller Order List");
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future cancelOrder(Map<String, dynamic> body) async {
    String url = base_url + cancelOrder_url;
    print(url);

    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            "Authorization": "Bearer ${Customer_Token.value}",
          },
          body: body);
      print(response.body);
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('success');
      } else {
        print("unsccess");
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getOrderDetails(String id) async {
    String url = base_url + orderDetail_url;
    print(url);

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${Customer_Token.value}",
        },
        body: {
          'order_id': id.toString(),
        },
      );
      print(response.body);
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Order');
        print(result);
        print("Details");
        orderDetails = List<OrderDeatilsModel>.from(
            result.map((x) => OrderDeatilsModel.fromJson(x)));
        print(orderDetails.length);
      } else {
        print("Order Details");
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getSearchProducts(String name) async {
    String url = base_url + searchProduct_url;
    print(url);

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${Customer_Token.value}",
        },
        body: {
          'name': name.toString(),
        },
      );
      print(response.body);
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Search');
        print(result);
        print("Products");
        searchProducts = List<SearchProductsModel>.from(
            result["products"].map((x) => SearchProductsModel.fromJson(x)));
        print(searchProducts.length);
        return searchProducts;
      } else {
        print("Search Products");
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future addAddress(Map<String, dynamic> body, context) async {
    String url = base_url + addaddress_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${Customer_Token.value}",
        },
        body: body,
      );
      final result = jsonDecode(response.body);
      StatusCode = response.statusCode.toString();

      if (response.statusCode == 200) {
        AddAddressSnackMessage = 'Added successfully';
      } else {
        print('Add Address');
        print(result['errors'][0]['message']);
        AddAddressSnackMessage = result['errors'][0]['message'];
      }
      // Customer_Token.value = (result['token']);
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future editAddress(Map<String, dynamic> body, context) async {
    String url = base_url + editAddress_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${Customer_Token.value}",
        },
        body: body,
      );
      final result = jsonDecode(response.body);
      StatusCode = response.statusCode.toString();

      if (response.statusCode == 200) {
        AddAddressSnackMessage = 'Edit successfully';
      } else {
        print('Edit Address');
        print(result['errors'][0]['message']);
        AddAddressSnackMessage = result['errors'][0]['message'];
      }
      // Customer_Token.value = (result['token']);
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future applyVoucher(Map<String, dynamic> body) async {
    String url = base_url + applyCoupon_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${Customer_Token.value}",
        },
        body: body,
      );
      final result = jsonDecode(response.body);
      StatusCode = response.statusCode.toString();

      if (response.statusCode == 200) {
        AddAddressSnackMessage = 'Applied successfully';
      } else {
        print('Add Address');
        print(result['errors'][0]['message']);
        AddAddressSnackMessage = result['errors'][0]['message'];
      }
      // Customer_Token.value = (result['token']);
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future deletesingleCart(String cartid, context) async {
    String url = base_url + deleteCart_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.post(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      }, body: {
        'key': cartid,
      });
      final result = jsonDecode(response.body);
      // SellerInfoModel sellerinfo = result;
      // SellerInfoModel sellerinfo = result[0].map;
      StatusCode = response.statusCode.toString();
      // print('Hello');
      // print(result);
      // print(sellerinfo!.fName);
      // print('Hy');

      if (response.statusCode == 200) {
        print('Delete  Cart Successfully');
      } else {
        print('Someting bad happened');
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getBrandFollowList(String user_id) async {
    String url = base_url + brandFollowList_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.post(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      }, body: {
        'user_id': user_id,
      });
      final result = jsonDecode(response.body);
      // SellerInfoModel sellerinfo = result;
      // SellerInfoModel sellerinfo = result[0].map;
      StatusCode = response.statusCode.toString();
      FollowBrands = result;
      // print('Hello');
      // print(result);
      // print(sellerinfo!.fName);
      // print('Hy');

      if (response.statusCode == 200) {
        print('Follow Brand ');
        print(result);
        print(FollowBrands.length);
        print('List');
      } else {
        print('List');
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getSellerFollowList(String user_id) async {
    String url = base_url + SellerFollowList_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.post(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      }, body: {
        'user_id': user_id,
      });
      final result = jsonDecode(response.body);
      // SellerInfoModel sellerinfo = result;
      // SellerInfoModel sellerinfo = result[0].map;
      StatusCode = response.statusCode.toString();
      FollowSellers = result;
      // print('Hello');
      // print(result);
      // print(sellerinfo!.fName);
      // print('Hy');

      if (response.statusCode == 200) {
        print('Seller Brand ');
        print(result);
        print(FollowSellers.length);
        print('List');
      } else {
        print('List');
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getFavouritesSellersList() async {
    String url = base_url + favouritesList_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      });
      final result = jsonDecode(response.body);
      StatusCode = response.statusCode.toString();
      AddToFavouriteSellersButton = result['ids'];
      favouritesList = List<FavouriteSellersList>.from(
          result['list'].map((x) => FavouriteSellersList.fromJson(x)));

      if (response.statusCode == 200) {
        print('Favourite Sellers ');
        print(result);
        print(AddToFavouriteSellersButton.length);
        print('List');
      } else {
        print('List');
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getCartCount(int user_id) async {
    String url = base_url + cartCount_url + user_id.toString();
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${Customer_Token.value}",
        },
      );
      final result = jsonDecode(response.body);
      cartCount = result["count"];

      if (response.statusCode == 200) {
        print('Cart ');
        print(cartCount);
        print('Count');
      } else {
        print('Cart Count');
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getCategoriesProducts(int id) async {
    String url = base_url + categoryProduct_url + id.toString();
    print(url);

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${Customer_Token.value}",
        },
      );
      print(response.body);
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Categories');
        print(result);
        print("Products");
        categoryProduct = List<CategoryProductModel>.from(
            result.map((x) => CategoryProductModel.fromJson(x)));
      } else {
        print("Order Details");
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future updateFcmToken() async {
    String url = base_url + updateFcmToken_url;
    String fsmToken = '';
    StatusCode = '403';
    await FirebaseMessaging.instance.getToken().then((value) async {
      print(value);
      fsmToken = value.toString();
    });
    print('what the Hell');
    print(url);
    try {
      print('Hello');
      http.Response response = await http.post(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      }, body: {
        'cm_firebase_token': fsmToken,
      });
      // SellerInfoModel sellerinfo = result;
      // SellerInfoModel sellerinfo = result[0].map;
      StatusCode = response.statusCode.toString();
      // print('Hello');
      // print(result);
      // print(sellerinfo!.fName);
      // print('Hy');

      if (response.statusCode == 200) {
        print('Follow Brand ');
        print(fsmToken);
        print('List');
      } else {
        print('List');
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future updateCart(String cartid, String quantity, context) async {
    String url = base_url + updateCart_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.post(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      }, body: {
        'key': cartid,
        'quantity': quantity
      });
      final result = jsonDecode(response.body);

      StatusCode = response.statusCode.toString();

      if (response.statusCode == 200) {
        print('update Cart Successfully');
      } else {
        print('Someting bad happened');
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getnotification(String user_id) async {
    String url = base_url + notifications_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.post(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      }, body: {
        'user_id': user_id,
        'type': 'customer',
      });
      print(user_id);
      final result = jsonDecode(response.body);
      notifications = List<NotificationsModel>.from(
          result["Notifications"].map((x) => NotificationsModel.fromJson(x)));

      StatusCode = response.statusCode.toString();

      if (response.statusCode == 200) {
        print('Get Notifications');
        print(notifications.length);
      } else {
        print('Notifications Failed');
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future Seennotification(String notification_id) async {
    String url = base_url + seenNotifications_url + notification_id + "/seen";
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${Customer_Token.value}",
        },
      );

      if (response.statusCode == 200) {
        print('Get Notifications');
        print(notifications.length);
      } else {
        print('Notifications Failed');
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future addToCart(Map<String, dynamic> addcart, context) async {
    String url = base_url + addToCart_url;
    print(url);

    try {
      http.Response response =
      await http.post(Uri.parse(url), body: addcart, headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      });
      StatusCode = response.statusCode.toString();

      print(response.body);
      final result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print('Success3');
        SnackMessage = result['message'];
      } else {
        print("unsucess3");
        SnackMessage = result['message'];
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future addToWishList(Map<String, dynamic> addWishList, context) async {
    String url = base_url + addToWishList_url;
    print(url);

    try {
      http.Response response =
      await http.post(Uri.parse(url), body: addWishList, headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      });

      print(response.body);
      final result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print('Added Successfully');
        SnackMessage = result['message'];
      } else {
        print("Failed");
        SnackMessage = result['message'];
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future removeFromWishList(String product_id, context) async {
    String url = base_url + removefromwishList_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.post(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      }, body: {
        'product_id': product_id,
      });
      final result = jsonDecode(response.body);
      // SellerInfoModel sellerinfo = result;
      // SellerInfoModel sellerinfo = result[0].map;
      StatusCode = response.statusCode.toString();
      // print('Hello');
      // print(result);
      // print(sellerinfo!.fName);
      // print('Hy');

      if (response.statusCode == 200) {
        print('Remove from WishList Successfully');
      } else {
        print('Someting bad happened');
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  // Future OnlinePlaceOrder(String customer_id, String address_id, String billing_address_id) async {
  //   String url = OnlinePayment_url;
  //   StatusCode = '403';
  //   print(url);
  //   try {
  //     http.Response response = await http.post(Uri.parse(url), headers: {
  //       "Authorization": "Bearer ${Customer_Token.value}",
  //     }, : {
  //       'customer_id': customer_id,
  //       'address_id': address_id,
  //       'billing_address_id': billing_address_id,
  //     });
  //     final result = jsonDecode(response.body);
  //     // SellerInfoModel sellerinfo = result;
  //     // SellerInfoModel sellerinfo = result[0].map;
  //     StatusCode = response.statusCode.toString();
  //     // print('Hello');
  //     // print(result);
  //     // print(sellerinfo!.fName);
  //     // print('Hy');
  //
  //     if (response.statusCode == 200) {
  //       print('Remove from WishList Successfully');
  //     } else {
  //       print('Someting bad happened');
  //     }
  //   } on Exception {
  //     rethrow;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future placeOrder(String billing_address) async {
    String url = base_url +
        placeOrder_url +
        '?order_note=' +
        '&billing_address_id=' +
        billing_address;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      });
      final result = jsonDecode(response.body);
      print(result);
      // SellerInfoModel sellerinfo = result;
      // // SellerInfoModel sellerinfo = result[0].map;
      if (response.statusCode == 200) {
        StatusCode = '200';
        SnackMessage = result;
      } else {
        StatusCode = '403';
        SnackMessage = 'Something Bad happened';
      }

      print('List');
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  /* Future orderList() async {
    String url = base_url + orderList_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      });
      final result = jsonDecode(response.body);
      print(result);
      // SellerInfoModel sellerinfo = result;
      // // SellerInfoModel sellerinfo = result[0].map;
      if (response.statusCode == 200) {
        StatusCode = '200';
        SnackMessage = result;
      } else {
        StatusCode = '403';
        SnackMessage = 'Something Bad happened';
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
 */
  Future getAddressList() async {
    String url = base_url + getaddresslist_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      });
      final result = jsonDecode(response.body);
      // SellerInfoModel sellerinfo = result;
      // // SellerInfoModel sellerinfo = result[0].map;
      if (response.statusCode == 200) {
        addressList = List<AddressListModel>.from(
            result.map((x) => AddressListModel.fromJson(x)));
        StatusCode = '200';
      } else {
        StatusCode = '403';
      }

      // sellerinfo =  SellerInfoModel.fromJson(result);
      // StatusCode = response.statusCode.toString();

      print('Address');
      print(addressList.length);
      // print(sellerinfo!.fName);
      print('List');

       
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future deleteAddress(String? id, context) async {
    String url = base_url + deleteaddress_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.delete(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      }, body: {
        'address_id': id
      });
      final result = jsonDecode(response.body);
      StatusCode = response.statusCode.toString();

      if (response.statusCode == 200) {
      } else {
        print('sgvcznxfgfbvsvfcgfbvc');
      }
      // Customer_Token.value = (result['token']);
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future requestFollow(String? brand_id, String? user_id) async {
    String url = base_url + follow_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.post(Uri.parse(url), body: {
        'brand_id': brand_id,
        'user_id': user_id,
      });
      final result = jsonDecode(response.body);
      StatusCode = response.statusCode.toString();

      if (response.statusCode == 200) {
      } else {
        print('sgvcznxfgfbvsvfcgfbvc');
      }
      // Customer_Token.value = (result['token']);
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future requestFollowSeller(String? seller_id, String? user_id) async {
    String url = base_url + sellerFollow_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.post(Uri.parse(url), body: {
        'seller_id': seller_id,
        'user_id': user_id,
      });
      final result = jsonDecode(response.body);
      StatusCode = response.statusCode.toString();

      if (response.statusCode == 200) {
      } else {
        print('sgvcznxfgfbvsvfcgfbvc');
      }
      // Customer_Token.value = (result['token']);
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future deleteAllCart() async {
    String url = base_url + deleteAllCart_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.post(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      }, body: {
        'key': '1',
      });
      final result = jsonDecode(response.body);
      // SellerInfoModel sellerinfo = result;
      // SellerInfoModel sellerinfo = result[0].map;
      StatusCode = response.statusCode.toString();
      // print('Hello');
      // print(result);
      // print(sellerinfo!.fName);
      // print('Hy');

      if (response.statusCode == 200) {
        print('Delete All Cart Successfully');
      } else {
        print('Someting bad happened');
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getcategorylist() async {
    String url = base_url + getcart_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      });
      print(response.body);
      final result = jsonDecode(response.body);

      getCartlist =
      List<CartModel>.from(result.map((x) => CartModel.fromJson(x)));

      // SellerInfoModel sellerinfo = result;
      // // SellerInfoModel sellerinfo = result[0].map;
      if (response.statusCode == 200) {
        StatusCode = '200';
        // print(getCartlist[0].name);
        // print(getCartlist.length);
      } else {
        StatusCode = '403';
        print("unccess");
      }

      // sellerinfo =  SellerInfoModel.fromJson(result);
      // StatusCode = response.statusCode.toString();

       
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getWishList() async {
    String url = base_url + wishList_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      });
      print(response.body);
      final result = jsonDecode(response.body);

      wishList = List<WishListModel>.from(
          result.map((x) => WishListModel.fromJson(x)));

      // SellerInfoModel sellerinfo = result;
      // // SellerInfoModel sellerinfo = result[0].map;
      if (response.statusCode == 200) {
        print(wishList.length);
        StatusCode = '200';
        // print(getCartlist[0].name);
        // print(getCartlist.length);
      } else {
        StatusCode = '403';
        print("unccess");
      }

      // sellerinfo =  SellerInfoModel.fromJson(result);
      // StatusCode = response.statusCode.toString();

       
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getLatestProducts() async {
    String url = base_url + latestProducts_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      });
      print(response.body);
      final result = jsonDecode(response.body);

      latestProducts = List<LatestProductsModel>.from(
          result["products"].map((x) => LatestProductsModel.fromJson(x)));
      print(latestProducts.length);
      print(result["products"]);

      // SellerInfoModel sellerinfo = result;
      // // SellerInfoModel sellerinfo = result[0].map;
      if (response.statusCode == 200) {
        StatusCode = '200';
        // print(getCartlist[0].name);
        // print(getCartlist.length);
      } else {
        StatusCode = '403';
        print("unccess");
      }

      // sellerinfo =  SellerInfoModel.fromJson(result);
      // StatusCode = response.statusCode.toString();

       
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getTopSellersList() async {
    String url = base_url + topseller_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.get(
        Uri.parse(url),
      );
      final result = jsonDecode(response.body);
      // SellerInfoModel sellerinfo = result;
      // // SellerInfoModel sellerinfo = result[0].map;
      if (response.statusCode == 200) {
        topSellers = List<TopSellersList>.from(
            result.map((x) => TopSellersList.fromJson(x)));
        StatusCode = '200';
      } else {
        StatusCode = '403';
      }

      // sellerinfo =  SellerInfoModel.fromJson(result);
      // StatusCode = response.statusCode.toString();

      print('Top Sellers');
      // print(sellerinfo!.fName);
      print('List');

       
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getAllSellersList() async {
    String url = base_url + allsellers_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.get(
        Uri.parse(url),
      );
      final result = jsonDecode(response.body);
      // SellerInfoModel sellerinfo = result;
      // // SellerInfoModel sellerinfo = result[0].map;
      if (response.statusCode == 200) {
        allSellers = List<AllSellersList>.from(
            result.map((x) => AllSellersList.fromJson(x)));
        StatusCode = '200';
      } else {
        StatusCode = '403';
      }

      // sellerinfo =  SellerInfoModel.fromJson(result);
      // StatusCode = response.statusCode.toString();

      print('Top Sellers');
      // print(topSellers[0].id);
      // print(sellerinfo!.fName);
      print('List');

       
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getCategoriesList() async {
    String url = base_url + categoriesList_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.get(
        Uri.parse(url),
      );
      final result = jsonDecode(response.body);
      // SellerInfoModel sellerinfo = result;
      // // SellerInfoModel sellerinfo = result[0].map;
      if (response.statusCode == 200) {
        categoriesList = List<CategoriesListModel>.from(
            result.map((x) => CategoriesListModel.fromJson(x)));
        StatusCode = '200';
      } else {
        StatusCode = '403';
      }

      // sellerinfo =  SellerInfoModel.fromJson(result);
      // StatusCode = response.statusCode.toString();

      print('Get Categories');
      // print(topSellers[0].id);
      // print(sellerinfo!.fName);
      print('List');

       
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getBrandProduct(int id) async {
    String url = base_url + brandProduct_url + id.toString();
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.get(
        Uri.parse(url),
      );
      final result = jsonDecode(response.body);
      // SellerInfoModel sellerinfo = result;
      // // SellerInfoModel sellerinfo = result[0].map;
      if (response.statusCode == 200) {
        brandProduct = List<BrandProductModel>.from(
            result.map((x) => BrandProductModel.fromJson(x)));
        StatusCode = '200';
      } else {
        StatusCode = '403';
      }

      // sellerinfo =  SellerInfoModel.fromJson(result);
      // StatusCode = response.statusCode.toString();

      print('Get Brand Product');
      print(url);
      // print(topSellers[0].id);
      // print(sellerinfo!.fName);
      print('List');

       
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getSellerProductsList(int index) async {
    String url = base_url + 'seller/' + index.toString() + '/products';
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.get(
        Uri.parse(url),
      );
      final result = jsonDecode(response.body);
      // SellerInfoModel sellerinfo = result;
      // // SellerInfoModel sellerinfo = result[0].map;
      if (response.statusCode == 200) {
        sellerProducts = List<SellerProducts>.from(
            result['products'].map((x) => SellerProducts.fromJson(x)));
        StatusCode = '200';
      } else {
        StatusCode = '403';
      }

      // sellerinfo =  SellerInfoModel.fromJson(result);
      // StatusCode = response.statusCode.toString();

      print('Sellers Products');
      print(sellerProducts.length);
      // print(sellerinfo!.fName);
      print('List');

       
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future EmailVerification(Map<String, dynamic> body) async {
    String url = base_url + emailverification_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            "Authorization": "Bearer ${Customer_Token.value}",
          },
          body: body);
      final result = jsonDecode(response.body);
      print(result);

      if (result['success'] == true) {
        SnackMessage = 'Verification Email Sent';
        Fluttertoast.showToast(
            msg: SnackMessage,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        return true;
      } else {
        SnackMessage = result['message'];
        return false;
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future VerifyEmail() async {
    String url = base_url + emailverification_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.post(Uri.parse(url), headers: {
        "Authorization": "Bearer ${Customer_Token.value}",
      }, body: {
        'email': sellerinfo!.email,
        'temporary_token': sellerinfo!.temporaryToken,
        'token': token,
      });
      final result = jsonDecode(response.body);
      // SellerInfoModel sellerinfo = result;
      // SellerInfoModel sellerinfo = result[0].map;
      StatusCode = response.statusCode.toString();
      // print('Hello');
      // print(result);
      // print(sellerinfo!.fName);
      // print('Hy');

      if (response.statusCode == 200) {
        EmailVerficationMessage = 'Verified Successfuly';
      } else {
        print('sgvcznxfgfbvsvfcgfbvc');
        print(result['errors'][0]['message']);
        EmailVerficationMessage = result['errors'][0]['message'];
      }
      Customer_Token.value = (result['token']);
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future ForgotPassword(email) async {
    String url = base_url + forgotpassword_url;
    StatusCode = '403';
    print(url);
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${Customer_Token.value}",
        },
        body: {'identity': email},
      );
      final result = jsonDecode(response.body);
      // SellerInfoModel sellerinfo = result;
      // SellerInfoModel sellerinfo = result[0].map;
      StatusCode = response.statusCode.toString();
      // print('Hello');
      // print(result);
      // print(sellerinfo!.fName);
      // print('Hy');

      if (response.statusCode == 200) {
        ForgotPasswordMessage = 'Check your Email to Change Password';
      } else {
        print('sgvcznxfgfbvsvfcgfbvc');
        print(result['errors'][0]['message']);
        ForgotPasswordMessage = result['errors'][0]['message'];
      }
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future getSearchContent(String userName) async {
    String url = base_url + login_url;
    print(url);
    // print(userName);
    // print(CUSTOMER_TOKEN.value);
    try {
      http.Response response = await http.post(
        Uri.parse(url), body: {'value': userName},
        //     headers: {
        //   "Authorization": "Bearer ${CUSTOMER_TOKEN.value}",
        // });
        // print(response.body);
        // final result = jsonDecode(response.body);
        // if (result['success']) {
        //   searchModelContent = List<SearchPageModel>.from(
        //       result['data'].map((x) => SearchPageModel.fromJson(x)));
        // }
      );
    } on Exception {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
