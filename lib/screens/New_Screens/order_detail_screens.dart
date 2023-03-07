import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Widgets/colors.dart';
import '../Widgets/common_app_bar_container.dart';
import '../Widgets/common_widgets.dart';
import '../Widgets/page_transition.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}
class _OrderDetailScreenState extends State<OrderDetailScreen> {
  int activeIndex = 0;
  bool _customTileExpandedComment = false;
  bool _customTileExpandedOrderStatus = false;

  List<StepperData> stepperData = [
    StepperData(
        title: StepperText(
          "Shipping",
          textStyle: const TextStyle(
            color: Colors.black,
          ),
        ),

        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(30))),

        )),
    StepperData(
        title: StepperText("Arrived",textStyle: const TextStyle(
          color: Colors.black,
        ),),

        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(30))),

        )),
    StepperData(
        title: StepperText("Wait for Feedback",textStyle: const TextStyle(
          color: Colors.black,
        ),),
        subtitle: StepperText(
            "If recieved item has issue, Please report us"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(30))),
        )),

  ];

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 2,
              ),
              CommonUiWidget.DividerWidthOneNThree(),
              CommonAppBarContainer(title: 'Comment details', onClicked: (){
              }),
              Container(
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black)
                      )
                  ),
                  child:Row(
                    children: [
                      Container(
                        height: 130,
                        width: 140,
                        child: Image.asset('assets/images/home1.png'),
                      ),
                      Container(
                        width: 210,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: Colors.greenAccent,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                  )
                                ],),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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



                    ],
                  )

              ),
              Column(
                children: [
                  ExpansionTile(textColor: Colors.black,collapsedTextColor: Colors.black,
                    title:  Row(
                      children: [
                        SizedBox(
                          width: 3,
                        ),
                        Text('Order Status',style: TextStyles.TitleTexStyle13(),),
                      ],
                    ),
                    onExpansionChanged: (bool expanded) {
                      setState(() => _customTileExpandedOrderStatus = expanded);
                    },
                    trailing:
                    _customTileExpandedOrderStatus ?
                    Image.asset(
                      ('assets/images/closeexpansion.png'),height: 15,width: 15,):   Image.asset(
                      ('assets/images/openexpansion.png'),height: 15,width: 15,),
                    children: [

                      Column(
                        children: [
                          CommonUiWidget.DividerWidthOneNThree(),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(

                              color: Colors.white,
                              child: AnotherStepper(
                                stepperList: stepperData,
                                stepperDirection: Axis.vertical,
                                inverted: false,
                                activeIndex: 1,activeBarColor: Colors.greenAccent,
                                gap: 20,
                              )
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CommonUiWidget.DividerWidthOneNThree(),
                  ExpansionTile(textColor: Colors.black,collapsedTextColor: Colors.black,
                    title:  Row(
                      children: [

                        SizedBox(
                          width: 3,
                        ),
                        Text('Comment history',style: TextStyles.TitleTexStyle13(),),

                      ],
                    ),
                    onExpansionChanged: (bool expanded) {
                      setState(() => _customTileExpandedComment = expanded);
                    },
                    trailing:
                    _customTileExpandedComment ?
                    Image.asset(
                      ('assets/images/closeexpansion.png'),height: 15,width: 15,):   Image.asset(
                      ('assets/images/openexpansion.png'),height: 15,width: 15,),
                    children: [
                      Container(
                        height: 20.h,
                        color: AppColors.expansiotile,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                              child: ListView.builder(
                                itemCount: 6,
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 3),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 25,top: 5),
                                    child: Row(
                                      children: [
                                        Text('18:06:10 12.12.2022.',style: TextStyles.TitleTexStyle12().copyWith(
                                            fontWeight: FontWeight.normal
                                        ),),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 22,
                                          width: 22,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.blue.withOpacity(0.6)
                                          ),
                                          child: Center(child: Text('JJ',style: TextStyles.TitleTexStyle12(),)),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text('Do you have white one?',style: TextStyles.TitleTexStyle12().copyWith(
                                            fontWeight: FontWeight.normal
                                        ),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
