import 'package:flutter/cupertino.dart';

class ProductDetailsList{
  final String CompanyName;
  final String BagDetails;
  final String Price;
  final String image;
  ProductDetailsList({
    required this.CompanyName,
    required this.BagDetails,
    required this.Price,
    required this.image,
  });
}

List<ProductDetailsList> productdetails = [
  ProductDetailsList(CompanyName: "Hermes", BagDetails: "Hermes Classic Crossbody Bag 20cm",Price: '659,000',image: 'assets/images/1.PNG'),
  ProductDetailsList(CompanyName: "Chanel", BagDetails: "Mini Flap Bag with Top Handle",Price: '659,000',image: 'assets/images/1.PNG'),
  ProductDetailsList(CompanyName: "Chanel", BagDetails: "Large Shopping Bag        ",Price: '659,000',image: 'assets/images/2.PNG'),
  ProductDetailsList(CompanyName: "Chanel", BagDetails: "Chanel Classic Crossbody Bag 20cm",Price: '659,000',image: 'assets/images/3.PNG'),
  ProductDetailsList(CompanyName: "Chanel", BagDetails: "Large Shopping Bag        ",Price: '659,000',image: 'assets/images/2.PNG'),
  ProductDetailsList(CompanyName: "Hermes", BagDetails: "Chanel Classic Crossbody Bag 20cm",Price: '659,000',image: 'assets/images/1.PNG'),
  ProductDetailsList(CompanyName: "Chanel", BagDetails: "Large Shopping Bag        ",Price: '659,000',image: 'assets/images/3.PNG'),
  ProductDetailsList(CompanyName: "Chanel", BagDetails: "Chanel Classic Crossbody Bag 20cm",Price: '659,000',image: 'assets/images/1.PNG'),
  ProductDetailsList(CompanyName: "Hermes", BagDetails: "Large Shopping Bag        ",Price: '659,000',image: 'assets/images/2.PNG'),
  ProductDetailsList(CompanyName: "Chanel", BagDetails: "Chanel Classic Crossbody Bag 20cm",Price: '659,000',image: 'assets/images/3.PNG'),
  ProductDetailsList(CompanyName: "Chanel", BagDetails: "Large Shopping Bag        ",Price: '659,000',image: 'assets/images/1.PNG'),
  ProductDetailsList(CompanyName: "Chanel", BagDetails: "Chanel Classic Crossbody Bag 20cm",Price: '659,000',image: 'assets/images/2.PNG'),

];