import 'package:af24client/screens/New_Screens/home_screen/about_boutique_screen.dart';
import 'package:af24client/screens/New_Screens/search_screen/search_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:numeral/fun.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/bottom_bar.dart';
import '../../Widgets/colors.dart';
import '../../Widgets/common_widgets.dart';
import '../../Widgets/page_transition.dart';
import '../filter_screen/filter_screen.dart';

class BoutiquesPage extends StatefulWidget {
  const BoutiquesPage({Key? key}) : super(key: key);

  @override
  State<BoutiquesPage> createState() => _BoutiquesPageState();
}

class _BoutiquesPageState extends State<BoutiquesPage> {
  Future<dynamic> _onBackPressed(context) async {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Exit',
      desc: 'Do you want to exit app',
      btnCancelOnPress: () {},
      btnCancelText: 'No',
      btnOkText: 'Yes',
      btnOkOnPress: () async {
        SystemNavigator.pop();
      },
    ).show();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          bool? result = await _onBackPressed(context);
          if (result == null) {
            result = false;
          }
          return result;
        },
        child: Scaffold(
// backgroundColor: Colors.black ,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 48,
                  child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 1.3,
                              width: 100.w,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: (){
                                    PageTransition.fadeInNavigation(
                                        page: SearchScreen(
                                        ));
                                    // Get.to(()=>SearchScreen());
                                  },
                                  child: Image.asset('assets/images/searchicon.png',
                                    height: 23,
                                    width: 23,
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),

                                SizedBox(
                                  width: 6,
                                ),
                                InkWell(
                                  onTap: (){
                                    PageTransition.fadeInNavigation(
                                        page: FilterScreen(
                                        ));
                                    // Get.to(()=>FilterScreen());
                                  },
                                  child: Image.asset('assets/images/filtericon.png',
                                    height: 20,
                                    width: 25,
                                  ),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                InkWell(
                                  onTap: (){

                                  },
                                  child: Container(
                                      height: 22,
                                      width: 22,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.black),

                                      ),
                                      child: Center(child: Text('+',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),))
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 25,
                                    child: Center(
                                      child: TextField(
                                        maxLines: 1,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.zero,
                                          isDense: true,
                                          // disabledBorder: InputBorder.none
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),

                                SizedBox(
                                  width: 8,
                                ),

                                SizedBox(
                                  width: 12,
                                ),
                                SizedBox(width: 15,)
                              ],
                            ),


                          ],
                        ),
                        Positioned(
                          bottom:0,

                          child: Container(
                            height: 1.3,
                            width: 100.w,
                            color: Colors.black,
                          ),),
                        Positioned(
                          top: 5,
                          left: 40,
                          child: Container(
                            height: 44,
                            width: 1,
                            color: Colors.black,
                          ),),

                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Column(
                    children: [
                      GridView.builder(
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return
                            InkWell(
                              onTap: (){
                                PageTransition.fadeInNavigation(
                                    page: BoutiqueDetailScreen());
                                // Get.to(()=>ProductDetailScreen());
                              },
                              child: Container(
                                height: 340,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                          color: Colors.black,
                                        ),
                                        left:  BorderSide(
                                          color:   index%2 ==0?
                                          Colors.transparent:
                                          Colors.black,
                                        )

                                    )
                                ),
                                // color: Colors.grey,
                                child: Padding(
                                  padding: index%2 ==1?

                                  EdgeInsets.only(left: 10):
                                  EdgeInsets.only(right: 3),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 6,top: 7,right: 7),
                                        child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text('30min ago',style: TextStyles.TitleTexStyle10(),)
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 181,
                                        child: Row(
                                          children: [
                                            Image.asset('assets/images/home1.png',
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [

                                              Image.asset('assets/images/flag.png',
                                                height: 15,
                                                width: 15,
                                              ),

                                            ],
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(right: 6),
                                            child: Row(
                                              children: [
                                                Container(


                                                  child: Row(
                                                    children: [
                                                      Image.asset('assets/images/favorite.png',height: 20,
                                                        width: 15,),
                                                      SizedBox(
                                                        width: 3,
                                                      ),
                                                      Text(numeral(12344,fractionDigits: 1),style: TextStyle(
                                                          fontSize: 10
                                                      ),),
                                                    ],
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text('Celine',style: TextStyles.TitleTexStyle14(),)),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            children: [
                                              Text('390€',style: TextStyles.TitleTexStyle14().copyWith(
                                                  fontWeight: FontWeight.w600
                                              )),
                                              SizedBox(
                                                width: 11,
                                              ),
                                              Text('390€',style: TextStyles.TitleTexStyle12().copyWith(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w400,
                                                decoration: TextDecoration.lineThrough,
                                              ),),


                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0,
                            mainAxisExtent: 287
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
          bottomNavigationBar: CommonNavigationBar(index: 1),
        ),
      ),
    );
  }
}
