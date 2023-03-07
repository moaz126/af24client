import 'package:af24client/Api/Auth_af24.dart';
import 'package:af24client/navBar.dart';
import 'package:af24client/screens/Cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Provider/cartProvider.dart';
import '../../localization/languages/languages.dart';
import '../../Api/globalVariables.dart';

class languageOptions extends StatefulWidget {
  const languageOptions({Key? key}) : super(key: key);

  @override
  State<languageOptions> createState() => _languageOptionsState();
}

class _languageOptionsState extends State<languageOptions> {
  String language = 'English';

  int presses = 0;
  int valid = 0;

  List<String> selectlanguage = [
    'English',
    'Germany',
    'Urdu',
    'French',
    'Russian',
    'chinese',
    'spanish',
    'bangali',
  ];
  fun() async {
    await DataApiService.instance.getCartCount(sellerinfo!.id!.toInt());
    setState(() {

    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fun();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        titleSpacing: 1.w,
        title: Text(
          Languages.of(context)!.SELECT_REGION,
          style: TextStyle(color: Colors.black),
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: BackButton(
            color: Colors.black,
          ),
        ),
        actions: [
          SizedBox(
            width: 3,
          ),
          InkWell(
            onTap: (){
              Get.to(Carts());
            },
            child: Consumer<MyCart>(builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 11.0),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.asset(
                      'assets/icons/Seller app icon (6).png',
                      height: 4.5.h,
                    ),
                    // Container(
                    //   height: 12,
                    //   width: 12,
                    //   decoration: BoxDecoration(
                    //       color: Colors.orange[700],
                    //       borderRadius: BorderRadius.circular(10)),
                    // ),
                    Container(
                      height: 1.5.h,
                      padding: EdgeInsets.only(left: 1.5, right: 1),
                      decoration: BoxDecoration(
                          color: Colors.orange[700],
                          borderRadius: BorderRadius.circular(100)),
                      //color: Colors.blue,
                      child: Guest == 1
                          ? Text(
                        "0",
                        style:
                        TextStyle(color: Colors.black, fontSize: 8),
                      )
                          : Text(
                        value.getCartLength().toString(),
                        style:
                        TextStyle(color: Colors.black, fontSize: 8),
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Container(
              child: Column(
                children: [
                  Text(Languages.of(context)!.SELECT_LOCATION,
                      style: TextStyle(fontSize: 20)),
                  Text(Languages.of(context)!.LANGUAGE_WHERE_YOU,
                      style: TextStyle(fontSize: 20)),
                  Text(Languages.of(context)!.USING_APP, style: TextStyle(fontSize: 20)),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: InkWell(
                      onTap: () => showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0)),
                        ),
                        context: context,
                        builder: (context) => buildSheet(),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.5))),
                        height: 60,
                        width: 94.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: InkWell(
                                onTap: () => showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        topRight: Radius.circular(15.0)),
                                  ),
                                  context: context,
                                  builder: (context) => buildSheet(),
                                ),
                                child: Text(
                                  '$language',
                                  style: TextStyle(fontSize: 21),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0)),
                                ),
                                context: context,
                                builder: (context) => buildSheet(),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.keyboard_arrow_down_outlined),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Center(
                      child: Text(
                        Languages.of(context)!.VALIDATE,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: newNavBar(
        index: 4,
      ),
    );
  }

  Widget buildSheet() => DraggableScrollableSheet(
        minChildSize: 0.1,
        initialChildSize: 0.25,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
          ),
          height: 10,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      language = selectlanguage[valid];
                      Navigator.pop(context);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(Languages.of(context)!.VALIDATE,
                        style: TextStyle(
                            color: Colors.transparent,
                            decorationColor: Colors.black,
                            shadows: [
                              Shadow(color: Colors.black, offset: Offset(0, -3))
                            ],
                            decoration: TextDecoration.underline,
                            decorationThickness: 3)),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    for (int i = 0; i < selectlanguage.length; i++)
                      Container(
                        height: 60,
                        width: 400,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              presses = i;
                              valid = i;
                              language = selectlanguage[valid];
                              Navigator.pop(context);
                            });
                          },
                          child: Card(
                            color: (presses == i)
                                ? Colors.grey.withOpacity(0.2)
                                : Colors.white,
                            //
                            // Colors.white,
                            //(presses == i) ? Colors.grey.withOpacity(0.2): Colors.white,
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.only(left: 4.0, right: 4),
                              child: Text(
                                selectlanguage[i],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            )),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
