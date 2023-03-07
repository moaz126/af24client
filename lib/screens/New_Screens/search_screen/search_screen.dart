import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/common_widgets.dart';
import '../../Widgets/page_transition.dart';
import '../filter_screen/filter_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool gridview =true;
  bool listview =false;

  bool women =false;
  bool men =false;
  bool kids =false;
  bool boutigues =true;
  bool lifestyle =false;
  bool seller =false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            CommonUiWidget.DividerWidthOneNThree(),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset('assets/images/searchicon.png',
                    height: 23,
                    width: 23,
                  ),
                  SizedBox(
                    width: 5,
                  ),

                  Expanded(
                    child: Container(
                      height: 25,

                      child: Center(
                        child: TextField(
                          maxLines: 1,
                          decoration: InputDecoration(hintText: 'Search',
                            hintStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey
                            ),
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
                    width: 6,
                  ),
                  Container(
                    height: 30,
                    width: 1.5,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 2.5,
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
                      width: 20,
                    ),
                  ),
                  SizedBox(
                    width: 2.5,
                  ),
                  Container(
                    height: 30,
                    width: 1.5,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  InkWell(
                      onTap: (){
                        setState(() {
                          gridview =true;
                          listview =false;
                        });
                      },
                      child:
                      gridview ==true?Image.asset('assets/images/gridviewselected.png',
                        height: 18,
                        width: 18,
                      ):
                      Image.asset('assets/images/gridview.png',
                        height: 18,
                        width: 18,
                      )
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                      onTap: (){
                        setState(() {
                          gridview = false;
                          listview = true;
                        });
                      },
                      child:
                      listview ==true?
                      Image.asset('assets/images/listview_selected.png',
                        height: 18,
                        width: 18,
                      ):Image.asset('assets/images/listview.png',
                        height: 18,
                        width: 18,
                      )

                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
            // CommonUiWidget.DividerWidthOne(),
            SizedBox(
              height: 4,
              child: Stack(
                alignment: Alignment.centerRight,
                children : [
                  CommonUiWidget.DividerWidthOneNThree(),
                  gridview ==true?
                  Positioned(
                    right: 50,
                    child: Container(
                      height: 4,
                      width: 17,
                      color: Colors.black,
                    ),
                  ):
                  Positioned(
                    right: 15,
                    child: Container(
                      height: 4,
                      width: 17,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),


            SizedBox(
              height: 5,
            ),


            Row(children: [
              SizedBox(
                width: 10,
              ),
              InkWell(
                  onTap: (){
                    setState(() {
                       women =false;
                       men =false;
                       kids =false;
                       boutigues =true;
                       lifestyle =false;
                       seller =false;
                    });
                  },
                  child: boutigues ==true?
                  Text('Boutigues',
                    style:
                    TextStyles.TitleTexStyle13(),

                  ):
                  Text('Boutiques',
                    style:
                    TextStyles.TitleTexStyle13().copyWith(
                        fontWeight: FontWeight.normal),

                  )
              ),
              SizedBox(
                width: 12,
              ),
              InkWell(
                  onTap: (){
                    setState(() {
                      women =true;
                      men =false;
                      kids =false;
                      boutigues =false;
                      lifestyle =false;
                      seller =false;

                    });
                  },
                  child: women ==true?
                  Text('Women',
                    style:
                    TextStyles.TitleTexStyle13(),

                  ):
                  Text('Women',
                    style:
                    TextStyles.TitleTexStyle13().copyWith(
                        fontWeight: FontWeight.normal),

                  )
              ),
              SizedBox(
                width: 12,
              ),
              InkWell(
                  onTap: (){
                    setState(() {
                      women =false;
                      men =true;
                      kids =false;
                      boutigues =false;
                      lifestyle =false;
                      seller =false;

                    });
                  },
                  child: men ==true?

                  Text('Men',
                    style:
                    TextStyles.TitleTexStyle13(),

                  ):
                  Text('Men',
                    style:
                    TextStyles.TitleTexStyle13().copyWith(
                        fontWeight: FontWeight.normal),

                  )

              ),
              SizedBox(
                width: 12,
              ),
              InkWell(
                  onTap: (){
                    setState(() {
                      women =false;
                      men =false;
                      kids =true;
                      boutigues =false;
                      lifestyle =false;
                      seller =false;

                    });
                  },
                  child: kids ==true?

                  Text('Kids',
                    style:
                    TextStyles.TitleTexStyle13(),

                  ):
                  Text('Kids',
                    style:
                    TextStyles.TitleTexStyle13().copyWith(
                        fontWeight: FontWeight.normal),

                  )

              ),
              SizedBox(
                width: 12,
              ),
              InkWell(
                  onTap: (){
                    setState(() {
                      women =false;
                      men =false;
                      kids =false;
                      boutigues =false;
                      lifestyle =true;
                      seller =false;

                    });
                  },
                  child: lifestyle ==true?

                  Text('Lifestyle',
                    style:
                    TextStyles.TitleTexStyle13(),

                  ):
                  Text('Lifestyle',
                    style:
                    TextStyles.TitleTexStyle13().copyWith(
                        fontWeight: FontWeight.normal),

                  )

              ),
              SizedBox(
                width: 12,
              ),
              InkWell(
                  onTap: (){
                    setState(() {
                      women =false;
                      men =false;
                      kids =false;
                      boutigues =false;
                      lifestyle =false;
                      seller =true;

                    });
                  },
                  child: seller ==true?

                  Text('Seller',
                    style:
                    TextStyles.TitleTexStyle13(),

                  ):
                  Text('Seller',
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
                  boutigues==true?
                  Positioned(
                    left:30,
                    child: Container(
                      height: 5,
                      width: 23,
                      color: Colors.black,
                    ),
                  ):
                  women ==true?
                  Positioned(
                    left: 95,
                    child: Container(
                      height: 5,
                      width: 17,
                      color: Colors.black,
                    ),
                  ):
                  men ==true?
                  Positioned(
                    left: 155,
                    child: Container(
                      height: 5,
                      width: 17,
                      color: Colors.black,
                    ),
                  ):
                      kids ==true?

                  Positioned(
                    left: 193,
                    child: Container(
                      height: 5,
                      width: 17,
                      color: Colors.black,
                    ),
                  ):
                          lifestyle ==true?
                          Positioned(
                            left: 240,
                            child: Container(
                              height: 5,
                              width: 17,
                              color: Colors.black,
                            ),
                          ):
                          Positioned(
                            left: 300,
                            child: Container(
                              height: 5,
                              width: 17,
                              color: Colors.black,
                            ),
                          )

                ])),
          ],
        ),
      ),
    );
  }
}
