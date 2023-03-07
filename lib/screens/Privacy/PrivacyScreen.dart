import 'package:af24client/Api/globalVariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:sizer/sizer.dart';

import '../../Api/Auth_af24.dart';
import '../../localization/languages/languages.dart';


class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  var document;
  bool loader = false;
  final spinkit = SpinKitSpinningLines(
    size: 5.h,
    color: Colors.black,
  );
  fun()
  async {
    setState(() {
      loader = true;
    });
    await DataApiService.instance.getFooterLinks();
    setState(() {
      document = parse(
          privacy!.value);
      loader = false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    fun();
    super.initState();
  }
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
          child: Text(Languages.of(context)!.PRIVACY_POLICES,style: TextStyle(color: Colors.black),),
        ),
      ),
      body:
      loader == true ?  spinkit :
      termsConditions!.value == "" ?
      Center(child: Text(Languages.of(context)!.PRIVACY_POLICES_UPDATES))
          :
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,top: 10.0),
          child: HtmlWidget(document.outerHtml),
        ),
      ),
    );
  }
}
