
import 'package:flutter/cupertino.dart';

class HomeProductDetailsList{
  final String ShopName;
  final String CompanyName;
  final String BagDetails;
  final String Price;
  final String image;
  final bool Reserve;
  HomeProductDetailsList({
    required this.CompanyName,
    required this.BagDetails,
    required this.Price,
    required this.image,
    required this.Reserve,
    required this.ShopName,
  });
}

List<HomeProductDetailsList> homeproductdetails = [
  HomeProductDetailsList(ShopName: 'Queen Shop',CompanyName: "Hermes", BagDetails: "Hermes Classic Crossbody Bag 20cm",Price: '650,900',image: 'assets/images/1.PNG',Reserve: true),
  HomeProductDetailsList(ShopName: 'Muse Shop',CompanyName: "Chanel", BagDetails: "Mini Flap Bag with Top Handle",Price: '650,900',image: 'assets/images/1.PNG',Reserve: false),
  HomeProductDetailsList(ShopName: 'Queen Shop',CompanyName: "Chanel", BagDetails: "Large Shopping Bag        ",Price: '650,900',image: 'assets/images/2.PNG',Reserve: true),
  HomeProductDetailsList(ShopName: 'Muse Shop',CompanyName: "Chanel", BagDetails: "Chanel Classic Crossbody Bag 20cm",Price: '650,900',image: 'assets/images/3.PNG',Reserve: false),
  HomeProductDetailsList(ShopName: 'Queen Shop',CompanyName: "Chanel", BagDetails: "Large Shopping Bag        ",Price: '650,900',image: 'assets/images/2.PNG',Reserve: true),
  HomeProductDetailsList(ShopName: 'Muse Shop',CompanyName: "Hermes", BagDetails: "Chanel Classic Crossbody Bag 20cm",Price: '650,900',image: 'assets/images/1.PNG',Reserve: false),
  HomeProductDetailsList(ShopName: 'Queen Shop',CompanyName: "Chanel", BagDetails: "Large Shopping Bag        ",Price: '650,900',image: 'assets/images/3.PNG',Reserve: true),
  HomeProductDetailsList(ShopName: 'Muse Shop',CompanyName: "Chanel", BagDetails: "Chanel Classic Crossbody Bag 20cm",Price: '650,900',image: 'assets/images/1.PNG',Reserve: false),
  HomeProductDetailsList(ShopName: 'Queen Shop',CompanyName: "Hermes", BagDetails: "Large Shopping Bag        ",Price: '650,900',image: 'assets/images/2.PNG',Reserve: true),
  HomeProductDetailsList(ShopName: 'Muse Shop',CompanyName: "Chanel", BagDetails: "Chanel Classic Crossbody Bag 20cm",Price: '650,900',image: 'assets/images/3.PNG',Reserve: false),
  HomeProductDetailsList(ShopName: 'Queen Shop',CompanyName: "Chanel", BagDetails: "Large Shopping Bag        ",Price: '650,900',image: 'assets/images/1.PNG',Reserve: true),
  HomeProductDetailsList(ShopName: 'Muse Shop',CompanyName: "Chanel", BagDetails: "Chanel Classic Crossbody Bag 20cm",Price: '650,900',image: 'assets/images/2.PNG',Reserve: false),

];