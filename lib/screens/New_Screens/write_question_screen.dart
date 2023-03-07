import 'package:af24client/screens/New_Screens/activity/support_message.dart';
import 'package:af24client/screens/Widgets/common_app_bar_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../Widgets/common_textfield.dart';
import '../Widgets/page_transition.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CommonAppBarContainer(title: 'I have a question', onClicked: (){
              Get.back();
            }),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: titleController,
              cursorColor: Colors.black,
              decoration:
              InputDecorations.inputDecorationNoBorder(
                  labelText: "title"
              ).copyWith(focusedBorder: UnderlineInputBorder(),

                  enabledBorder: UnderlineInputBorder(),contentPadding: EdgeInsets.symmetric(horizontal: 10)
              )
            ),
            SizedBox(
              height: 5,
            ),

            TextFormField(
                controller: descriptionController,

                cursorColor: Colors.black,
                decoration:
                InputDecorations.inputDecorationNoBorder(
                    labelText: "Description"
                ).copyWith(contentPadding: EdgeInsets.symmetric(horizontal: 5)
                )
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
                          PageTransition.fadeInNavigation(
                              page: SupportMessage(
                              ));
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
