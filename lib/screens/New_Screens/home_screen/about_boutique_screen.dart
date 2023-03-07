import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numeral/fun.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/colors.dart';
import '../../Widgets/common_app_bar_container.dart';
import '../../Widgets/common_widgets.dart';
import '../../Widgets/page_transition.dart';

class BoutiqueDetailScreen extends StatefulWidget {
  const BoutiqueDetailScreen({Key? key}) : super(key: key);

  @override
  State<BoutiqueDetailScreen> createState() => _BoutiqueDetailScreenState();
}

class _BoutiqueDetailScreenState extends State<BoutiqueDetailScreen> {
  bool gridview =true;
  bool listview =false;
  bool active =true;
  bool sold =false;
  bool review =false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CommonUiWidget.DividerWidthOneNThree(),
              CommonAppBarContainer(title: 'About Boutique', onClicked: (){
                Get.back();
              }),

              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  height: 50,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){

                          // Get.to(()=>ABoutSellerScreen());
                        },
                        child: Container(
                            width: 50.w,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 22,
                                        width: 22,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.yellow.withOpacity(0.6)
                                        ),
                                        child: Center(child: Text('XY',style: TextStyles.TitleTexStyle11(),)),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text('Boutique XY',style: TextStyles.TitleTexStyle11(),)
                                    ],
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(right: 7),
                                  //   child: Container(
                                  //     height: 16,
                                  //     width: 52,
                                  //     decoration: BoxDecoration(
                                  //         borderRadius: BorderRadius.circular(3),
                                  //         color: Colors.black
                                  //     ),
                                  //     child:Center(
                                  //       child: Text('Superseller',style: TextStyles.TitleTexStyle10().copyWith(
                                  //           fontSize: 8,
                                  //           color: Colors.white
                                  //       ),),
                                  //     ),
                                  //   ),
                                  // )
                                ])
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 0.8,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 6,
                          ),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Location',style: TextStyles.TitleTexStyle11().copyWith(
                                    fontWeight: FontWeight.normal
                                ),),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Image.asset('assets/images/flag.png',height: 23,
                                    width: 18,),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 50,
                        width: 0.8,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.end,

                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Shipping to',textAlign: TextAlign.right,style: TextStyles.TitleTexStyle11().copyWith(
                                  fontWeight: FontWeight.normal,
                                ),),
                                SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset('assets/images/flag.png',height: 23,
                                  width: 18,),
                                SizedBox(
                                  width: 7,
                                ),
                                Image.asset('assets/images/flag.png',height: 23,
                                  width: 18,),
                                SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 0.7,
                width: 100.w,
                color: Colors.black,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Container(
                        width: 35.w,
                        child: Row(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [

                                  Text('Since 2021',style: TextStyles.TitleTexStyle11(),)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: Colors.black
                                  ),
                                  child:Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 4, right: 4, top: 3, bottom: 3),
                                      child: Text('Boutiquelabel',style: TextStyles.TitleTexStyle10().copyWith(
                                          fontSize: 7,
                                          color: Colors.white
                                      ),),
                                    ),
                                  ),
                                ),
                              )
                            ])
                    ),
                    Container(
                      height: 34,
                      width: 0.8,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 6,
                        ),
                        Text('230 followers',style: TextStyles.TitleTexStyle11(),)
                      ],
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Row(
                      children: [
                        Image.asset('assets/images/favorite.png',height: 20,
                          width: 15,),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Follow this Boutique',style: TextStyles.TitleTexStyle11().copyWith(
                            fontWeight: FontWeight.normal
                        ),)
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 0.7,
                width: 100.w,
                color: Colors.black,
              ),
              Row(
                children: [
                  Container(
                    height: 30,

                    child: Row(children: [
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(onTap: (){
                        setState(() {
                          active =true;
                          sold =false;
                          review =false;
                        });
                      },
                          child:
                          active ==true ?
                          Text('Active on list (20)',style: TextStyles.TitleTexStyle11(),):
                          Text('Active on list (20)',style: TextStyles.TitleTexStyle11().copyWith(fontWeight: FontWeight.normal),)
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(onTap: (){
                        active =false;
                        sold =true;
                        review =false;
                      },
                          child:
                          sold ==true?

                          Text('Sold (209)',style: TextStyles.TitleTexStyle11(),):
                          Text('Sold (209)',style: TextStyles.TitleTexStyle11().copyWith(fontWeight: FontWeight.normal),)
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: (){
                            active =false;
                            sold =false;
                            review =true;
                          },
                          child:
                          review ==true?
                          Text('Boutique (200)',
                            style:
                            TextStyles.TitleTexStyle11(),):
                          Text('Boutique review (200)',
                            style:
                            TextStyles.TitleTexStyle11().copyWith(

                                fontWeight: FontWeight.normal),)

                      ),
                      Container(
                        height: 40,
                        width: 0.8,
                        color: Colors.black,
                      ),

                    ],),
                  ),

                  SizedBox(width: 8,),
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
                  SizedBox(width: 8,),

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
                    ),
                  ),
                ],
              ),

              CommonUiWidget.DividerWidthOneNThree(),
              // SizedBox(
              //     height: 8,
              //     child: Stack(children : [
              //
              //       Padding(
              //         padding: const EdgeInsets.only(top: 2),
              //         child: CommonUiWidget.DividerWidthOneNThree(),
              //       ),
              //       //  active ==true?
              //       // Positioned(
              //       //   left: 40,
              //       //   child: Container(
              //       //     height: 5,
              //       //     width: 23,
              //       //     color: Colors.black,
              //       //   ),
              //       // ):
              //       // sold ==true?
              //       // Positioned(
              //       //   left: 105,
              //       //   child: Container(
              //       //     height: 5,
              //       //     width: 17,
              //       //     color: Colors.black,
              //       //   ),
              //       // ):
              //       //     review ==true?
              //       // Positioned(
              //       //   left: 165,
              //       //   child: Container(
              //       //     height: 5,
              //       //     width: 17,
              //       //     color: Colors.black,
              //       //   ),
              //       // ):
              //               gridview ==true?
              //               Positioned(
              //                 right: 100,
              //                 child: Container(
              //                   height: 5,
              //                   width: 17,
              //                   color: Colors.black,
              //                 ),
              //               ):
              //                   listview == true ?
              //                   Positioned(
              //                     right: 50,
              //                     child: Container(
              //                       height: 5,
              //                       width: 17,
              //                       color: Colors.black,
              //                     ),
              //                   ):
              //                       SizedBox()
              //
              //     ])),
              gridview ==true?
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

                          Container(
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
                                  SizedBox(
                                    height: 15,
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(bottom: 6),
                                  //   child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                  //     children: [
                                  //       Text('30min ago',style: TextStyles.TitleTexStyle13(),)
                                  //     ],
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 183,
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

                                      Image.asset('assets/images/flag.png',
                                        height: 15,
                                        width: 15,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 4),
                                        child: Row(
                                          children: [
                                            Image.asset('assets/images/favorite.png',height: 20,
                                              width: 15,),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Text(numeral(12344,fractionDigits: 1),style: TextStyle(
                                                fontSize: 10
                                            ),),
                                            SizedBox(
                                              width: 5,
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
                                      child: Text('Celine',style: TextStyles.TitleTexStyle13(),)),

                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        children: [
                                          Text('390€',style: TextStyles.TitleTexStyle14(),),
                                          SizedBox(
                                            width: 11,
                                          ),
                                          Text('390€',style: TextStyles.TitleTexStyle12().copyWith(
                                              color: Colors.grey,
                                              decoration: TextDecoration.lineThrough,
                                              fontWeight: FontWeight.normal

                                          ),),


                                        ],
                                      ))
                                ],
                              ),
                            ),
                          );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                          mainAxisExtent: 275
                      ),
                    ),
                  ],
                ),
              ):
              Column(
                children: [
                  for(int index =0;index<5;index++)
                    InkWell(
                      onTap: (){

                      },
                      child: Container(
                          height: 140,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black)
                              )
                          ),
                          child:Row(
                            children: [
                              Container(
                                height: 120,
                                width: 130,
                                child: Image.asset('assets/images/home1.png'),
                              ),
                              Container(
                                width: 210,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
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


                                      ],
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      children: [
                                        Text('Celine',style: TextStyles.TitleTexStyle13(),)
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text('TRAPEZE TRIOMPHE BAG IN SHINY CALFSK IN BLACK',style: TextStyles.TitleTexStyle12().copyWith(fontWeight: FontWeight.normal),),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text('390€',style: TextStyles.TitleTexStyle14().copyWith(

                                            ),),
                                            SizedBox(
                                              width: 13,
                                            ),
                                            Text('390€',style: TextStyles.TitleTexStyle12().copyWith(
                                                color: Colors.grey,
                                                decoration: TextDecoration.lineThrough,
                                                fontWeight: FontWeight.normal

                                            ),),


                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset('assets/images/favorite.png',height: 20,
                                              width: 15,),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(numeral(12344,fractionDigits: 1),style: TextStyle(
                                                fontSize: 10
                                            ),),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              )

                            ],
                          )

                      ),
                    )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
