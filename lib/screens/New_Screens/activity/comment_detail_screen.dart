import 'package:af24client/Api/Urls.dart';
import 'package:af24client/screens/Widgets/common_app_bar_container.dart';
import 'package:af24client/screens/Widgets/elevated_button_50.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/common_elevated_button.dart';
import '../../Widgets/common_widgets.dart';
import '../../Widgets/page_transition.dart';

class CommentDetailScreen extends StatefulWidget {
  const CommentDetailScreen({Key? key}) : super(key: key);
  @override
  State<CommentDetailScreen> createState() => _CommentDetailScreenState();
}

class _CommentDetailScreenState extends State<CommentDetailScreen> {
  bool _value = false;
  List<String> name = ["MA", "FS", "MA", "MA"];
  List<String> message = [
    "Helloskjdfksvblskvbkhssjhvskydvcsdyvyyksyev",
    "Hy",
    "How are you?",
    "Where are you?"
  ];
  List<String> dateTime = [
    "18:06:10 12.12.2022.",
    "18:06:10 12.12.2022.",
    "18:06:10 12.12.2022.",
    "18:06:10 12.12.2022."
  ];
  List<bool> online = [false, false, false, true];

  TextEditingController SendMessageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 2,
            ),
            CommonUiWidget.DividerWidthOneNThree(),
            CommonAppBarContainer(title: 'Comment details', onClicked: () {}),
            Container(
                height: 156,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 130,
                          width: 140,
                          child: Image.asset('assets/images/home1.png'),
                        ),
                        Container(
                          child: Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                            color: Colors.greenAccent,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.yellow
                                                  .withOpacity(0.6)),
                                          child: Center(
                                              child: Text(
                                            'YK',
                                            style: TextStyles.TitleTexStyle10(),
                                          )),
                                        ),
                                        Text(
                                          'Youngmin Kim',
                                          style: TextStyles.TitleTexStyle10(),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '13:30:23 11/12/2022',
                                          style: TextStyles.TitleTexStyle10()
                                              .copyWith(
                                                  fontWeight:
                                                      FontWeight.normal),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Celine',
                                      style: TextStyles.TitleTexStyle13(),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'TRAPEZE TRIOMPHE BAG IN SHINY CALFSK IN BLACK',
                                  style: TextStyles.TitleTexStyle12()
                                      .copyWith(fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '390€',
                                          style: TextStyles.TitleTexStyle13(),
                                        ),
                                        SizedBox(
                                          width: 13,
                                        ),
                                        Text(
                                          '390€',
                                          style: TextStyles.TitleTexStyle13()
                                              .copyWith(
                                                  color: Colors.grey,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                        ),
                                      ],
                                    ),
                                    Image.asset(
                                      'assets/images/flag.png',
                                      height: 15,
                                      width: 15,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Please keep your manners to the seller, your comment will be shown in the comments section of the product.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            // CommonUiWidget.OrderNow(),
            // CommonUiWidget.ThankYouForOrder(),
            // CommonUiWidget.OrderSent_ShippingAddres(),
            // CommonUiWidget.OrderArrived(),
            // CommonUiWidget.ImageUpload(),

            //
            Column(
              children: [],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(2.w),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                reverse: true,
                itemCount: message.length,
                itemBuilder: (context, index) {
                  return name[index] == "MA"
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Container(
                                padding: EdgeInsets.all(1.w),
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                ),
                                child: Text(
                                  name[index],
                                  style: TextStyles.TitleTexStyle11()
                                      .copyWith(fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            // SizedBox(width: 1.w,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 80.w,
                                  padding: EdgeInsets.only(
                                      left: 11, right: 5, top: 10, bottom: 1),
                                  child: Text(
                                    message[index],
                                    style: TextStyles.TitleTexStyle11()
                                        .copyWith(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 11.sp),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 10,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 13),
                                  width: 30.w,
                                  child: Text(
                                    dateTime[index],
                                    style: TextStyles.TitleTexStyle11()
                                        .copyWith(
                                            fontWeight: FontWeight.normal),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 80.w,
                                  padding: EdgeInsets.only(
                                      left: 10, right: 3, top: 10, bottom: 1),
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Text(
                                    message[index],
                                    style: TextStyles.TitleTexStyle11()
                                        .copyWith(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 11.sp),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 10,
                                  ),
                                ),
                                Container(
                                  width: 30.w,
                                  child: Text(
                                    dateTime[index],
                                    style: TextStyles.TitleTexStyle11()
                                        .copyWith(
                                            fontWeight: FontWeight.normal),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, left: 7, right: 7),
                                  child: Text(
                                    name[index],
                                    style: TextStyles.TitleTexStyle11()
                                        .copyWith(
                                            fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 2.w, right: 2.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Container(
                      padding: EdgeInsets.all(1.w),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Text(
                        "MA",
                        style: TextStyles.TitleTexStyle11()
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: SendMessageController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: "add comment",
                        hintStyle: TextStyle(fontSize: 9.sp),
                        contentPadding: EdgeInsets.only(left: 2.w, right: 2.w),
                        suffix: Container(
                          width: 30.w,
                          child: InkWell(
                            onTap: () {
                              name.insert(0, 'FS');
                              message.insert(0, SendMessageController.text);
                              dateTime.insert(0, DateTime.now().toString());
                              SendMessageController.clear();
                              setState(() {});
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Send",
                                  style: TextStyle(
                                      fontSize: 9.sp, color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Image.asset(
                                  'assets/images/send.png',
                                  height: 12,
                                  width: 12,
                                )
                              ],
                            ),
                          ),
                        ),
                        suffixStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
