import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../localization/languages/languages.dart';


class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
            child: Icon(Icons.arrow_back_ios_new,color: Colors.black,),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0,bottom: 8.0),
          child: Text(Languages.of(context)!.FAQ,style: TextStyle(color: Colors.black),),
        ),
      ),
      body: Center(child: Text(Languages.of(context)!.NO_UPDATES_YET)),
    );
  }
}
