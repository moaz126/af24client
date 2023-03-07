import 'package:flutter/cupertino.dart';

class BrandCategory{
  final String Name;
  final String Logo;
  BrandCategory({
    required this.Name,
    required this.Logo,
  });
}

List<BrandCategory> brandCategory = [
  BrandCategory(Logo: 'assets/images/1.PNG', Name: "HERMES"),
  BrandCategory(Logo: 'assets/images/1.PNG', Name: "BALMAIN"),
  BrandCategory(Logo: 'assets/images/1.PNG', Name: "LOUIS VUITTION"),
  BrandCategory(Logo: 'assets/images/1.PNG', Name: "TIFFANY & CO"),
  BrandCategory(Logo: 'assets/images/1.PNG', Name: "PRADA"),
  BrandCategory(Logo: 'assets/images/1.PNG', Name: "BRIONI"),
  BrandCategory(Logo: 'assets/images/1.PNG', Name: "ROLEX"),
  BrandCategory(Logo: 'assets/images/1.PNG', Name: "GOYARD"),

];