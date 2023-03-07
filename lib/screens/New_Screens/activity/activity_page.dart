import 'package:af24client/screens/New_Screens/activity/comment_detail_screen.dart';
import 'package:af24client/screens/New_Screens/order_detail_screens.dart';
import 'package:af24client/screens/New_Screens/activity/support_message.dart';
import 'package:af24client/screens/New_Screens/write_question_screen.dart';
import 'package:af24client/screens/Widgets/common_widgets.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Widgets/bottom_bar.dart';
import '../../Widgets/page_transition.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  bool comments =true;
  bool orders =false;
  bool support =false;
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
          body: SingleChildScrollView(
            child: Column(
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
                          orders= false;
                          comments= true;
                          support= false;
                        });
                      },
                      child: comments ==true?
                      Text('Comments',
                        style:
                        TextStyles.TitleTexStyle13(),

                      ):
                      Text('Comments',
                        style:
                        TextStyles.TitleTexStyle13().copyWith(
                            fontWeight: FontWeight.normal),

                      )
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: (){
                        setState(() {
                          orders= true;
                          comments= false;
                          support= false;

                        });
                      },
                      child: orders ==true?
                      Text('Orders',
                        style:
                        TextStyles.TitleTexStyle13(),

                      ):
                      Text('Orders',
                        style:
                        TextStyles.TitleTexStyle13().copyWith(
                            fontWeight: FontWeight.normal),

                      )
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: (){
                        setState(() {
                          orders= false;
                          comments= false;
                          support= true;

                        });
                      },
                      child: support ==true?

                      Text('Supports',
                        style:
                        TextStyles.TitleTexStyle13(),

                      ):
                      Text('Supports',
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
                      comments ==true?
                      Positioned(
                        left: 10,
                        child: Container(
                          height: 5,
                          width: 23,
                          color: Colors.black,
                        ),
                      ):
                      orders ==true?
                      Positioned(
                        left: 95,
                        child: Container(
                          height: 5,
                          width: 17,
                          color: Colors.black,
                        ),
                      ):
                      Positioned(
                        left: 150,
                        child: Container(
                          height: 5,
                          width: 17,
                          color: Colors.black,
                        ),
                      )

                    ])),

                comments ==true?
                // Expanded(
                //   child: ListView.builder(
                //       scrollDirection: Axis.vertical,
                //       itemCount: 5,
                //       itemBuilder: (BuildContext context, index) {
                //         return InkWell(
                //           onTap: (){
                //             PageTransition.fadeInNavigation(
                //                 page: CommentDetailScreen(
                //                 ));
                //             // Get.to(()=>CommentDetailScreen());
                //           },
                //           child: Container(
                //               height: 150,
                //               decoration: BoxDecoration(
                //                   border: Border(
                //                       bottom: BorderSide(color: Colors.black)
                //                   )
                //               ),
                //               child:Row(
                //                 children: [
                //                   Container(
                //                     height: 130,
                //                     width: 140,
                //                     child: Image.asset('assets/images/home1.png'),
                //                   ),
                //                   Container(
                //                     width: 210,
                //                     child: Column(
                //                       children: [
                //                         Padding(
                //                           padding: const EdgeInsets.only(top: 3),
                //                           child: Row(mainAxisAlignment: MainAxisAlignment.end,
                //                             children: [
                //                               Container(
                //                                 height: 10,
                //                                 width: 10,
                //                                 decoration: BoxDecoration(
                //                                     color: Colors.greenAccent,
                //                                     borderRadius: BorderRadius.circular(15)
                //                                 ),
                //                               )
                //                             ],),
                //                         ),
                //                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Row(
                //                               children: [
                //                                 Container(
                //                                   height: 20,
                //                                   width: 20,
                //                                   decoration: BoxDecoration(
                //                                       borderRadius: BorderRadius.circular(20),
                //                                       color: Colors.yellow.withOpacity(0.6)
                //                                   ),
                //                                   child: Center(child: Text('YK',style: TextStyles.TitleTexStyle10(),)),
                //                                 ),
                //                                 Text('Youngmin Kim',style: TextStyles.TitleTexStyle10(),)
                //                               ],
                //                             ),
                //                             Row(
                //                               children: [
                //                                 Text('13:30:23 11/12/2022',style: TextStyles.TitleTexStyle10().copyWith(fontWeight: FontWeight.normal),)
                //                               ],
                //                             ),
                //
                //                           ],
                //                         ),
                //                         SizedBox(
                //                           height: 7,
                //                         ),
                //                         Row(
                //                           children: [
                //                             Text('Celine',style: TextStyles.TitleTexStyle13(),)
                //                           ],
                //                         ),
                //                         SizedBox(
                //                           height: 4,
                //                         ),
                //                         Text('TRAPEZE TRIOMPHE BAG IN SHINY CALFSK IN BLACK',style: TextStyles.TitleTexStyle12().copyWith(fontWeight: FontWeight.normal),),
                //                         SizedBox(
                //                           height: 4,
                //                         ),
                //                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Row(
                //                               children: [
                //                                 Text('390€',style: TextStyles.TitleTexStyle13(),),
                //                                 SizedBox(
                //                                   width: 13,
                //                                 ),
                //                                 Text('390€',style: TextStyles.TitleTexStyle13().copyWith(
                //                                     color: Colors.grey,
                //                                     decoration: TextDecoration.lineThrough
                //
                //                                 ),),
                //
                //
                //                               ],
                //                             ),
                //                             Image.asset('assets/images/flag.png',
                //                               height: 15,
                //                               width: 15,
                //                             ),
                //                           ],
                //                         )
                //                       ],
                //                     ),
                //                   )
                //
                //                 ],
                //               )
                //
                //           ),
                //         );
                //       }),
                // )
                Column(
                  children: [
                    for(int j=0;j<5;j++)


                      InkWell(
                        onTap: (){

                          PageTransition.fadeInNavigation(
                              page: CommentDetailScreen(
                              ));
                          // Get.to(()=>OrderDetailScreen());
                        },
                        child: Container(
                            height: 155,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black)
                                )
                            ),
                            child:Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 12,bottom: 12, left: 5),
                                  child: Container(
                                    height: 130,
                                    width: 140,
                                    child: Image.asset('assets/images/home1.png'),
                                  ),
                                ),

                                Expanded(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  color: j%2==0?
                                                  Colors.greenAccent:
                                                  Colors.red,
                                                  borderRadius: BorderRadius.circular(15)
                                              ),
                                            )
                                          ],),
                                      ),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                    color: Colors.yellow.withOpacity(0.6)
                                                ),
                                                child: Center(child: Text('YK',style: TextStyles.TitleTexStyle10(),)),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text('Youngmin Kim',style: TextStyles.TitleTexStyle10(),)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text('13:30:23 11/12/2022',style: TextStyles.TitleTexStyle10().copyWith(fontWeight: FontWeight.normal),)
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
                                        height: 4,
                                      ),
                                      Text('TRAPEZE TRIOMPHE BAG IN SHINY CALFSK IN BLACK',style: TextStyles.TitleTexStyle12().copyWith(fontWeight: FontWeight.normal),),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text('390€',style: TextStyles.TitleTexStyle14(),),
                                              SizedBox(
                                                width: 13,
                                              ),
                                              Text('410€',style: TextStyles.TitleTexStyle12().copyWith(
                                                  color: Colors.grey,
                                                  decoration: TextDecoration.lineThrough,
                                                fontWeight: FontWeight.normal

                                              ),),


                                            ],
                                          ),
                                          Image.asset('assets/images/flag.png',
                                            height: 15,
                                            width: 15,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),

                              ],
                            )

                        ),
                      ),
                      // InkWell(
                      //   onTap: (){
                      //     PageTransition.fadeInNavigation(
                      //         page: CommentDetailScreen(
                      //         ));
                      //     // Get.to(()=>CommentDetailScreen());
                      //   },
                      //   child: Container(
                      //       height: 150,
                      //       decoration: BoxDecoration(
                      //           border: Border(
                      //               bottom: BorderSide(color: Colors.black)
                      //           )
                      //       ),
                      //       child:Row(
                      //         children: [
                      //           Container(
                      //             height: 130,
                      //             width: 140,
                      //             child: Image.asset('assets/images/home1.png'),
                      //           ),
                      //           Container(
                      //             width: 210,
                      //             child: Column(
                      //               children: [
                      //                 Padding(
                      //                   padding: const EdgeInsets.only(top: 3),
                      //                   child: Row(mainAxisAlignment: MainAxisAlignment.end,
                      //                     children: [
                      //                       Container(
                      //                         height: 10,
                      //                         width: 10,
                      //                         decoration: BoxDecoration(
                      //                             color: Colors.greenAccent,
                      //                             borderRadius: BorderRadius.circular(15)
                      //                         ),
                      //                       )
                      //                     ],),
                      //                 ),
                      //                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                   children: [
                      //                     Row(
                      //                       children: [
                      //                         Container(
                      //                           height: 20,
                      //                           width: 20,
                      //                           decoration: BoxDecoration(
                      //                               borderRadius: BorderRadius.circular(20),
                      //                               color: Colors.yellow.withOpacity(0.6)
                      //                           ),
                      //                           child: Center(child: Text('YK',style: TextStyles.TitleTexStyle10(),)),
                      //                         ),
                      //                         Text('Youngmin Kim',style: TextStyles.TitleTexStyle10(),)
                      //                       ],
                      //                     ),
                      //                     Row(
                      //                       children: [
                      //                         Text('13:30:23 11/12/2022',style: TextStyles.TitleTexStyle10().copyWith(fontWeight: FontWeight.normal),)
                      //                       ],
                      //                     ),
                      //
                      //                   ],
                      //                 ),
                      //                 SizedBox(
                      //                   height: 7,
                      //                 ),
                      //                 Row(
                      //                   children: [
                      //                     Text('Celine',style: TextStyles.TitleTexStyle13(),)
                      //                   ],
                      //                 ),
                      //                 SizedBox(
                      //                   height: 4,
                      //                 ),
                      //                 Text('TRAPEZE TRIOMPHE BAG IN SHINY CALFSK IN BLACK',style: TextStyles.TitleTexStyle12().copyWith(fontWeight: FontWeight.normal),),
                      //                 SizedBox(
                      //                   height: 4,
                      //                 ),
                      //                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                   children: [
                      //                     Row(
                      //                       children: [
                      //                         Text('390€',style: TextStyles.TitleTexStyle13(),),
                      //                         SizedBox(
                      //                           width: 13,
                      //                         ),
                      //                         Text('390€',style: TextStyles.TitleTexStyle13().copyWith(
                      //                             color: Colors.grey,
                      //                             decoration: TextDecoration.lineThrough
                      //
                      //                         ),),
                      //
                      //
                      //                       ],
                      //                     ),
                      //                     Image.asset('assets/images/flag.png',
                      //                       height: 15,
                      //                       width: 15,
                      //                     ),
                      //                   ],
                      //                 )
                      //               ],
                      //             ),
                      //           )
                      //
                      //         ],
                      //       )
                      //
                      //   ),
                      // )
                  ],
                )
                    :
                orders==true?
                Column(
                  children: [
                    for(int i =0;i<3;i++)
                      InkWell(
                        onTap: (){

                          PageTransition.fadeInNavigation(
                              page: OrderDetailScreen(
                              ));
                          // Get.to(()=>OrderDetailScreen());
                        },
                        child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black)
                                )
                            ),
                            child:Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                                  child: Container(
                                    height: 130,
                                    width: 140,
                                    child: Image.asset('assets/images/home1.png'),
                                  ),
                                ),

                                Expanded(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  color: i%2==0?
                                                  Colors.greenAccent:
                                                  Colors.red,
                                                  borderRadius: BorderRadius.circular(15)
                                              ),
                                            )
                                          ],),
                                      ),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                    color: Colors.yellow.withOpacity(0.6)
                                                ),
                                                child: Center(child: Text('YK',style: TextStyles.TitleTexStyle10(),)),
                                              ),
                                              Text('Youngmin Kim',style: TextStyles.TitleTexStyle10(),)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text('13:30:23 11/12/2022',style: TextStyles.TitleTexStyle10().copyWith(fontWeight: FontWeight.normal),)
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
                                        height: 4,
                                      ),
                                      Text('TRAPEZE TRIOMPHE BAG IN SHINY CALFSK IN BLACK',style: TextStyles.TitleTexStyle12().copyWith(fontWeight: FontWeight.normal),),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
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
                                          ),
                                          Image.asset('assets/images/flag.png',
                                            height: 15,
                                            width: 15,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),

                              ],
                            )

                        ),
                      ),
                  ],
                )


                // Expanded(
                //   child: ListView.builder(
                //       scrollDirection: Axis.vertical,
                //       itemCount: 3,
                //       itemBuilder: (BuildContext context, index) {
                //         return InkWell(
                //           onTap: (){
                //
                //             PageTransition.fadeInNavigation(
                //                 page: OrderDetailScreen(
                //                 ));
                //             // Get.to(()=>OrderDetailScreen());
                //           },
                //           child: Container(
                //               height: 150,
                //               decoration: BoxDecoration(
                //                   border: Border(
                //                       bottom: BorderSide(color: Colors.black)
                //                   )
                //               ),
                //               child:Row(
                //                 children: [
                //                   Container(
                //                     height: 130,
                //                     width: 140,
                //                     child: Image.asset('assets/images/home1.png'),
                //                   ),
                //                   Container(
                //                     width: 210,
                //                     child: Column(
                //                       children: [
                //                         Padding(
                //                           padding: const EdgeInsets.only(top: 3),
                //                           child: Row(mainAxisAlignment: MainAxisAlignment.end,
                //                             children: [
                //                               Container(
                //                                 height: 10,
                //                                 width: 10,
                //                                 decoration: BoxDecoration(
                //                                     color: index%2==0?
                //                                     Colors.greenAccent:
                //                                     Colors.red,
                //                                     borderRadius: BorderRadius.circular(15)
                //                                 ),
                //                               )
                //                             ],),
                //                         ),
                //                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Row(
                //                               children: [
                //                                 Container(
                //                                   height: 20,
                //                                   width: 20,
                //                                   decoration: BoxDecoration(
                //                                       borderRadius: BorderRadius.circular(20),
                //                                       color: Colors.yellow.withOpacity(0.6)
                //                                   ),
                //                                   child: Center(child: Text('YK',style: TextStyles.TitleTexStyle10(),)),
                //                                 ),
                //                                 Text('Youngmin Kim',style: TextStyles.TitleTexStyle10(),)
                //                               ],
                //                             ),
                //                             Row(
                //                               children: [
                //                                 Text('13:30:23 11/12/2022',style: TextStyles.TitleTexStyle10().copyWith(fontWeight: FontWeight.normal),)
                //                               ],
                //                             ),
                //
                //                           ],
                //                         ),
                //                         SizedBox(
                //                           height: 7,
                //                         ),
                //                         Row(
                //                           children: [
                //                             Text('Celine',style: TextStyles.TitleTexStyle13(),)
                //                           ],
                //                         ),
                //                         SizedBox(
                //                           height: 4,
                //                         ),
                //                         Text('TRAPEZE TRIOMPHE BAG IN SHINY CALFSK IN BLACK',style: TextStyles.TitleTexStyle12().copyWith(fontWeight: FontWeight.normal),),
                //                         SizedBox(
                //                           height: 4,
                //                         ),
                //                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Row(
                //                               children: [
                //                                 Text('390€',style: TextStyles.TitleTexStyle13(),),
                //                                 SizedBox(
                //                                   width: 13,
                //                                 ),
                //                                 Text('390€',style: TextStyles.TitleTexStyle13().copyWith(
                //                                     color: Colors.grey,
                //                                     decoration: TextDecoration.lineThrough
                //
                //                                 ),),
                //
                //
                //                               ],
                //                             ),
                //                             Image.asset('assets/images/flag.png',
                //                               height: 15,
                //                               width: 15,
                //                             ),
                //                           ],
                //                         )
                //                       ],
                //                     ),
                //                   )
                //
                //                 ],
                //               )
                //
                //           ),
                //         );
                //       }),
                // ),




                    :

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Do you have any Question? '),
                          InkWell(
                            onTap: (){
                              PageTransition.fadeInNavigation(
                                  page: QuestionScreen(
                                  ));
                              // Get.to(()=>QuestionScreen());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Row(children: [
                                  Text('I have a question',style: TextStyles.TitleTexStyle11().copyWith(fontWeight: FontWeight.normal),),
                                  SizedBox(width: 3,),
                                  Image.asset('assets/images/report_arrow.png',height: 9,width: 9,)
                                ],),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    CommonUiWidget.DividerWidthOneNThree(),

                    // ListView.builder(
                    //     scrollDirection: Axis.vertical,
                    //     itemCount: 3,
                    //     itemBuilder: (BuildContext context, index) {
                    //       return InkWell(
                    //         onTap: (){
                    //           Get.to(()=>OrderDetailScreen());
                    //         },
                    //         child: Container(
                    //             height: 150,
                    //             decoration: BoxDecoration(
                    //                 border: Border(
                    //                     bottom: BorderSide(color: Colors.black)
                    //                 )
                    //             ),
                    //             child:Row(
                    //               children: [
                    //                 Container(
                    //                   height: 130,
                    //                   width: 140,
                    //                   child: Image.asset('assets/images/home1.png'),
                    //                 ),
                    //                 Container(
                    //                   width: 210,
                    //                   child: Column(
                    //                     children: [
                    //                       Padding(
                    //                         padding: const EdgeInsets.only(top: 3),
                    //                         child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    //                           children: [
                    //                             Container(
                    //                               height: 10,
                    //                               width: 10,
                    //                               decoration: BoxDecoration(
                    //                                   color: index%2==0?
                    //                                   Colors.greenAccent:
                    //                                   Colors.red,
                    //                                   borderRadius: BorderRadius.circular(15)
                    //                               ),
                    //                             )
                    //                           ],),
                    //                       ),
                    //                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                         children: [
                    //                           Row(
                    //                             children: [
                    //                               Container(
                    //                                 height: 20,
                    //                                 width: 20,
                    //                                 decoration: BoxDecoration(
                    //                                     borderRadius: BorderRadius.circular(20),
                    //                                     color: Colors.yellow.withOpacity(0.6)
                    //                                 ),
                    //                                 child: Center(child: Text('YK',style: TextStyles.TitleTexStyle10(),)),
                    //                               ),
                    //                               Text('Youngmin Kim',style: TextStyles.TitleTexStyle10(),)
                    //                             ],
                    //                           ),
                    //                           Row(
                    //                             children: [
                    //                               Text('13:30:23 11/12/2022',style: TextStyles.TitleTexStyle10().copyWith(fontWeight: FontWeight.normal),)
                    //                             ],
                    //                           ),
                    //
                    //                         ],
                    //                       ),
                    //                       SizedBox(
                    //                         height: 7,
                    //                       ),
                    //                       Row(
                    //                         children: [
                    //                           Text('Celine',style: TextStyles.TitleTexStyle13(),)
                    //                         ],
                    //                       ),
                    //                       SizedBox(
                    //                         height: 4,
                    //                       ),
                    //                       Text('TRAPEZE TRIOMPHE BAG IN SHINY CALFSK IN BLACK',style: TextStyles.TitleTexStyle12().copyWith(fontWeight: FontWeight.normal),),
                    //                       SizedBox(
                    //                         height: 4,
                    //                       ),
                    //                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                         children: [
                    //                           Row(
                    //                             children: [
                    //                               Text('390€',style: TextStyles.TitleTexStyle13(),),
                    //                               SizedBox(
                    //                                 width: 13,
                    //                               ),
                    //                               Text('390€',style: TextStyles.TitleTexStyle13().copyWith(
                    //                                   color: Colors.grey,
                    //                                   decoration: TextDecoration.lineThrough
                    //
                    //                               ),),
                    //
                    //
                    //                             ],
                    //                           ),
                    //                           Image.asset('assets/images/flag.png',
                    //                             height: 15,
                    //                             width: 15,
                    //                           ),
                    //                         ],
                    //                       )
                    //                     ],
                    //                   ),
                    //                 )
                    //
                    //               ],
                    //             )
                    //
                    //         ),
                    //       );
                    //     })

                    for(int index =0;index<3;index++)
                      InkWell(
                        onTap: (){
                          PageTransition.fadeInNavigation(
                              page: SupportMessage(
                              ));
                          // Get.to(()=>SupportMessage());
                        },
                        child: Container(
                            height: 110,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black)
                                )
                            ),
                            child:Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3,right: 8),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                              color: index%2==0?
                                              Colors.greenAccent:
                                              Colors.red,
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                        )
                                      ],),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: Colors.black
                                              ),
                                              child: Center(child: Padding(
                                                padding: const EdgeInsets.only(left: 5,right: 5,top: 9,bottom: 9),
                                                child: Text('AF24',style: TextStyles.TitleTexStyle10().copyWith(color: Colors.white),),
                                              )),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text('AF24',style: TextStyles.TitleTexStyle12(),)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('13:30:23 11/12/2022',style: TextStyles.TitleTexStyle10().copyWith(fontWeight: FontWeight.normal),)
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: [
                                      Text('Feedback',style: TextStyles.TitleTexStyle13(),)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text('Thanks for your Feedback to our Service, We try to make',maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyles.TitleTexStyle12().copyWith(fontWeight: FontWeight.normal),)),
                                  SizedBox(
                                    height: 2,
                                  ),
                                ],
                              ),
                            )

                        ),
                      )


                  ],
                )



              ],
            ),
          ),

          //
          //
          bottomNavigationBar: CommonNavigationBar(index: 2),
        ),
      ),
    );
  }
}
