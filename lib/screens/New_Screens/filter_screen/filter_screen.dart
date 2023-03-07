import 'package:af24client/screens/Widgets/common_app_bar_container.dart';
import 'package:af24client/screens/Widgets/common_widgets.dart';
import 'package:af24client/screens/Widgets/elevated_button_50.dart';
import 'package:flutter/material.dart';

import '../../Widgets/page_transition.dart';


class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool women =false;
  bool men =false;
  bool kids =false;
  bool boutigues =true;
  bool lifestyle =false;
  bool seller =false;
  bool _customTileCategory1 = false;
  bool _customTileCategory2 = false;
  bool _customTileCategory3 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CommonAppBarContainer(title: 'Filter', onClicked: (){}),
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
            boutigues ==true?
                Column(
                  children: [

                    ExpansionTile(
                      textColor: Colors.black,collapsedTextColor: Colors.black,
                      title:  Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Image.asset('assets/images/category.png',height: 12,width: 12,),
                                    ),

                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),


                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Category II.',style: TextStyles.TitleTexStyle11(),),
                                SizedBox(
                                  height: 5,
                                ),

                                Text('Order Status',style: TextStyles.TitleTexStyle13(),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onExpansionChanged: (bool expanded) {
                        setState(() => _customTileCategory1 = expanded);
                      },
                      trailing:
                      _customTileCategory1 ?
                      Image.asset(
                        ('assets/images/closeexpansion.png'),height: 15,width: 15,):   Image.asset(
                        ('assets/images/openexpansion.png'),height: 15,width: 15,),
                      children: [
                        Container(
                          color: Colors.white,
                          child: SizedBox(
                            height: 200,
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 3),
                                child: ExpansionTile(
                                  textColor: Colors.black,collapsedTextColor: Colors.black,
                                  title:  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 5),
                                                  child: Image.asset('assets/images/category.png',height: 12,width: 12,),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 5),
                                                  child: Image.asset('assets/images/category.png',height: 12,width: 12,),
                                                ),

                                              ],
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),


                                          ],
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Column(mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Category III.',style: TextStyles.TitleTexStyle11(),),
                                            SizedBox(
                                              height: 5,
                                            ),

                                            Text('Bag',style: TextStyles.TitleTexStyle13(),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  onExpansionChanged: (bool expanded) {
                                    setState(() => _customTileCategory2 = expanded);
                                  },
                                  trailing:
                                  _customTileCategory2 ?
                                  Image.asset(
                                    ('assets/images/closeexpansion.png'),height: 15,width: 15,):   Image.asset(
                                    ('assets/images/openexpansion.png'),height: 15,width: 15,),
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: SizedBox(
                                        height: 100,
                                        child: ListView.builder(
                                          itemCount: 1,
                                          itemBuilder: (context, index) => Padding(
                                            padding: EdgeInsets.symmetric(vertical: 3),
                                            child: ExpansionTile(
                                              textColor: Colors.black,collapsedTextColor: Colors.black,
                                              title:  Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: Row(
                                                  children: [
                                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.only(right: 5),
                                                              child: Image.asset('assets/images/category.png',height: 12,width: 12,),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.only(right: 5),
                                                              child: Image.asset('assets/images/category.png',height: 12,width: 12,),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.only(right: 5),
                                                              child: Image.asset('assets/images/category.png',height: 12,width: 12,),
                                                            ),

                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 25,
                                                        ),


                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Column(mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text('Category IIII.',style: TextStyles.TitleTexStyle11(),),
                                                        SizedBox(
                                                          height: 5,
                                                        ),

                                                        Text('Select',style: TextStyles.TitleTexStyle13(),),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onExpansionChanged: (bool expanded) {
                                                setState(() => _customTileCategory3 = expanded);
                                              },
                                              trailing:
                                              _customTileCategory3 ?
                                              Image.asset(
                                                ('assets/images/closeexpansion.png'),height: 15,width: 15,):   Image.asset(
                                                ('assets/images/openexpansion.png'),height: 15,width: 15,),
                                              children: [
                                                Container(
                                                  color: Colors.white,
                                                  child: SizedBox(
                                                    height: 100,
                                                    child: ListView.builder(
                                                      itemCount: 1,
                                                      itemBuilder: (context, index) => Padding(
                                                        padding: EdgeInsets.symmetric(vertical: 3),
                                                        child: Padding(
                                                            padding: const EdgeInsets.only(left: 25,top: 5),
                                                            child: Row(
                                                              children: [

                                                              ],
                                                            )
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    CommonUiWidget.DividerWidthOneNThree(),
                  ],
                ):
                women ==true?
                    Column(
                      children: [],
                    ):
                    men ==true?
                        Column(
                          children: [],
                        ):
                        kids ==true?
                            Column(
                              children: [],
                            ):
                            lifestyle ==true?
                                Column(
                                  children: [],
                                ):
                                Column(
                                  children: [

                                  ],
                                ),


            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 93,
                  child: Column(
                    children: [
                      Text('Reset'),
                      SizedBox(
                        height: 10,
                      ),
                      CommonElevatedButtonBlack50(title: 'Add to my filter', onClicked: (){}),
                    ],
                  ),
                ),
              ),
            )
          ],

        ),

      ),
    );
  }
}
