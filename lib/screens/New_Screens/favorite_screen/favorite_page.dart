import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Widgets/bottom_bar.dart';
import '../../Widgets/colors.dart';
import '../../Widgets/common_widgets.dart';
import '../../Widgets/page_transition.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  bool products =true;
  bool brands =false;
  bool sellers =false;
  bool boutigues =false;
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
          body: Column(
            children: [
              SizedBox(
                height: 2,
              ),
              CommonUiWidget.DividerWidthOneNThree(),
              SizedBox(
                height: 3,
              ),
              Row(children: [
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: (){
                      setState(() {
                        products= true;
                        brands= false;
                        sellers= false;
                        boutigues= false;
                      });
                    },
                    child: products ==true?
                    Text('Products',
                      style:
                      TextStyles.TitleTexStyle13(),

                    ):
                    Text('Products',
                      style:
                      TextStyles.TitleTexStyle13().copyWith(
                          fontWeight: FontWeight.normal),

                    )
                ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                    onTap: (){
                      setState(() {
                        products= false;
                        brands= true;
                        sellers= false;
                        boutigues= false;

                      });
                    },
                    child: brands ==true?
                    Text('Brands',
                      style:
                      TextStyles.TitleTexStyle13(),

                    ):
                    Text('Brands',
                      style:
                      TextStyles.TitleTexStyle13().copyWith(
                          fontWeight: FontWeight.normal),
                    )
                ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                    onTap: (){
                      setState(() {
                        products= false;
                        brands= false;
                        sellers= true;
                        boutigues= false;
                      });
                    },
                    child: sellers ==true?
                    Text('Sellers',
                      style:
                      TextStyles.TitleTexStyle13(),
                    ):
                    Text('Sellers',
                      style:
                      TextStyles.TitleTexStyle13().copyWith(
                          fontWeight: FontWeight.normal),

                    )

                ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                    onTap: (){
                      setState(() {
                        products= false;
                        brands= false;
                        sellers= false;
                        boutigues= true;

                      });
                    },
                    child: boutigues ==true?

                    Text('Boutigues',
                      style:
                      TextStyles.TitleTexStyle13(),

                    ):
                    Text('Boutigues',
                      style:
                      TextStyles.TitleTexStyle13().copyWith(
                          fontWeight: FontWeight.normal),

                    )

                ),
              ],),
              SizedBox(
                height: 3,
              ),
              SizedBox(
                  height: 8,
                  child: Stack(children : [

                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: CommonUiWidget.DividerWidthOneNThree(),
                    ),
                     products==true?
                    Positioned(
                      left:30,
                      child: Container(
                        height: 5,
                        width: 23,
                        color: Colors.black,
                      ),
                    ):
                    brands ==true?
                    Positioned(
                      left: 95,
                      child: Container(
                        height: 5,
                        width: 17,
                        color: Colors.black,
                      ),
                    ):
                    sellers ==true?
                    Positioned(
                      left: 155,
                      child: Container(
                        height: 5,
                        width: 17,
                        color: Colors.black,
                      ),
                    ):

                         Positioned(
                           left: 220,
                           child: Container(
                             height: 5,
                             width: 17,
                             color: Colors.black,
                           ),
                         )

                  ])),
              products ==true?
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          children: [

                            GridView.builder(
                              physics: ScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: 4,
                              itemBuilder: (BuildContext context, int index) {
                                return
                                  InkWell(
                                    onTap: (){
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
                                                  Colors.black
                                              )
                                          )
                                      ),
                                      // color: Colors.grey,
                                      child: Padding(
                                        padding: index%2 ==1?
                                        EdgeInsets.only(left: 5):
                                        EdgeInsets.only(left: 0),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 10),
                                              child: SizedBox(
                                                height: 183,
                                                child: Row(
                                                  children: [
                                                    Image.asset('assets/images/home1.png',
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Image.asset('assets/images/flag.png',
                                                  height: 15,
                                                  width: 15,
                                                ),
                                                Row(
                                                  children: [
                                                    Image.asset('assets/images/Liked.png',height: 20,
                                                      width: 15,),
                                                    Text('12345',style: TextStyle(
                                                        fontSize: 10
                                                    ),),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: Text('Celine',style: TextStyles.TitleTexStyle13(),)),
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: Row(
                                                  children: [
                                                    Text('390€',style: TextStyles.TitleTexStyle13(),),
                                                    SizedBox(
                                                      width: 13,
                                                    ),
                                                    Text('390€',style: TextStyles.TitleTexStyle13().copyWith(
                                                        color: Colors.grey,
                                                        decoration: TextDecoration.lineThrough
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
                                  mainAxisExtent: 280
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ):
                  brands ==true?
                      Column(
                        children: [],
                      ):
                      sellers == true?
                          Column(
                            children: [],
                          ):
                          Column(
                            children: [],
                          ),
            ],
          ),
          bottomNavigationBar: CommonNavigationBar(index: 3),
        ),
      ),
    );
  }
}