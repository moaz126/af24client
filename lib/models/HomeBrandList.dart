import 'package:flutter/cupertino.dart';

class HomeBrandList{
  final String Details;
  final String Logo;
  HomeBrandList({
    required this.Details,
    required this.Logo,
  });
}

List<HomeBrandList> homeBrandList = [
  HomeBrandList(Logo: 'assets/images/1.PNG', Details: "All Clothing List"),
  HomeBrandList(Logo: 'assets/images/1.PNG', Details: "All Accessories List"),
  HomeBrandList(Logo: 'assets/images/1.PNG', Details: "All Boutique List"),
  HomeBrandList(Logo: 'assets/images/1.PNG', Details: "All Brands List"),
  HomeBrandList(Logo: 'assets/images/1.PNG', Details: "All Sellers List"),
  HomeBrandList(Logo: 'assets/images/1.PNG', Details: "New Arrivals List"),

];