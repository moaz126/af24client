import 'package:af24client/screens/Widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/common_app_bar_container.dart';
import '../../Widgets/page_transition.dart';

class SupportMessage extends StatefulWidget {
  const SupportMessage({Key? key}) : super(key: key);

  @override
  State<SupportMessage> createState() => _SupportMessageState();
}

class _SupportMessageState extends State<SupportMessage> {
  bool _value= false;
  List<String> name = ["MA","FS","MA","MA"];
  List<String> message = ["Hope You Liked our product","Yes I did","Thanks for your Feedback, We are always trying do our best! we promise you that we provide more personal service for you!",];
  List<String> dateTime = ["18:06:10 12.12.2022.","18:06:10 12.12.2022.","18:06:10 12.12.2022.","18:06:10 12.12.2022."];
  List<bool> online = [false,false,false,true];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CommonAppBarContainer(title: 'Support message', onClicked: (){
              Get.back();
            }),
            Padding(
              padding: const EdgeInsets.only(top: 3,right: 8),
              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color:
                        Colors.greenAccent,

                        borderRadius: BorderRadius.circular(15)
                    ),
                  )
                ],),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8,left: 8),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [


                      Text('Feedback',style: TextStyles.TitleTexStyle12(),)
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
            SizedBox(height: 4,),
            CommonUiWidget.DividerWidthOneNThree(),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(2.w),
                shrinkWrap: true,
                itemCount: message.length,
                itemBuilder: (context, index) {
                  return
                    name[index] == "MA" ?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black
                            ),
                            child: Center(
                              child: Text('AF24',style: TextStyles.TitleTexStyle10().copyWith(
                                // fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),),
                            ),
                          )
                        ),
                        SizedBox(width: 1.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 80.w,
                              padding: EdgeInsets.all(2.w),
                              child: Text(message[index],style: TextStyles.TitleTexStyle11().copyWith(fontWeight: FontWeight.normal,fontSize: 11.sp),overflow: TextOverflow.ellipsis,maxLines: 10,),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 2.w),
                              width: 30.w,
                              child: Text(dateTime[index],style: TextStyles.TitleTexStyle11().copyWith(fontWeight: FontWeight.normal),maxLines: 1,overflow: TextOverflow.ellipsis,),
                            )
                          ],
                        ),
                      ],
                    )
                        :
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 80.w,
                              padding: EdgeInsets.all(2.w),
                              alignment: AlignmentDirectional.centerEnd,
                              child: Text(message[index],style: TextStyles.TitleTexStyle11().copyWith(fontWeight: FontWeight.normal,fontSize: 11.sp),overflow: TextOverflow.ellipsis,maxLines: 10,),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 2.w),
                              width: 30.w,
                              child: Text(dateTime[index],style: TextStyles.TitleTexStyle11().copyWith(fontWeight: FontWeight.normal),maxLines: 1,overflow: TextOverflow.ellipsis,),
                            )
                          ],
                        ),
                        SizedBox(width: 1.w,),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Container(

                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 7,right: 7),
                              child: Text(name[index],style: TextStyles.TitleTexStyle11().copyWith(fontWeight: FontWeight.normal),),
                            ),
                          ),
                        ),
                      ],
                    );
                },),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 2.w,right: 2.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Container(
                  padding: EdgeInsets.all(1.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  child: Text("Me",style: TextStyles.TitleTexStyle11().copyWith(),),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black
                      ),
                    ),
                    hintText: "Writing Somthing....",
                    hintStyle: TextStyle(fontSize: 9.sp),
                    contentPadding: EdgeInsets.only(left: 2.w,right: 2.w),
                    suffix: Container(
                      width: 30.w,
                      child: InkWell(
                        onTap: (){

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Send",style: TextStyle(fontSize: 9.sp,color: Colors.grey),),
                            SizedBox(width: 1.w,),
                            Image.asset('assets/images/send.png',height: 12,width: 12,)
                          ],
                        ),
                      ),
                    ),
                    suffixStyle: TextStyle(
                        color: Colors.black
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
