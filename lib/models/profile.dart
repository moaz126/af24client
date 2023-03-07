import 'package:flutter/cupertino.dart';

class profile{

  String userName,imagePath;

  profile({required this.userName,required this.imagePath});

}

List<profile> Profile = [
  profile(userName: 'Name', imagePath: 'assets/icons/My Page.png')
];