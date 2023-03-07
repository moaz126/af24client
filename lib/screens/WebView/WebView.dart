import 'package:af24client/screens/OrderHistory/OrderList.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../Provider/cartProvider.dart';
import '../../localization/languages/languages.dart';

class WebViewContainer extends StatefulWidget {
  final url;

  WebViewContainer(this.url);

  @override
  createState() => _WebViewContainerState(this.url);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  bool isLoading = true;

  _WebViewContainerState(this._url);

  void initState() {
    // TODO: implement initState
    super.initState();
    print("ploko");
    print(_url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          Languages.of(context)!.PAYMENT,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 7.w),
        ),
      ),
      body: Stack(
        children: [
          WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: _url,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
            javascriptChannels: <JavascriptChannel>{
              _toasterJavascriptChannel(context),
            },

            navigationDelegate: (NavigationRequest request) async {
              print("pknscjh");
              print(request.url);
              if (request.url.contains('pay-stripe/success') || request.url.contains('/paypal/payment/success') || request.url.contains('/payment-success') ) {
                print("success url");
                if (mounted) {
                  Provider.of<MyCart>(context, listen: false).setToZero();
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.SUCCES,
                    animType: AnimType.BOTTOMSLIDE,
                    title: Languages.of(context)!.SUCCESS,
                    desc: Languages.of(context)!.ORDER_PLACED,
                    btnOkOnPress: () {
                      Get.off(()=>OrderList());
                    },
                  ).show();
                }
              }
              return NavigationDecision.navigate;
            },
          ),
          isLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : Stack(),
        ],
      ),
    );
  }
  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          print('Text');
          print(message);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}
