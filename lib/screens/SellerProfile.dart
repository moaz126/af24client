import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';


class SellerProfile extends StatefulWidget {
  const SellerProfile({Key? key}) : super(key: key);

  @override
  State<SellerProfile> createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Text('Profile',style: TextStyle( color:  Colors.black, fontSize: 20.sp), ),
        ),
        leading: InkWell(
            onTap: Get.back,
            child: Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 2.h,),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                ClipOval(
                    child: Image.asset('assets/images/Bag pic.png',height: 15.h,width: 15.h,)),
                ClipOval(
                  child: Container(
                    height: 3.h,
                    width: 3.h,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent
                    ),
                    child: Icon(Icons.edit_note_rounded,color: Colors.white,size: 2.5.h,),
                  ),
                )
                  ],
            ),
            SizedBox(height: 2.h,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(1),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5.h),topRight: Radius.circular(5.h)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0,top: 30.0, bottom: 20.0,right: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          width: 88.w,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                              border: Border.all(color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return "This field is required";
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "First Name",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                        SizedBox(height: 3.h,),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          width: 88.w,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                              border: Border.all(color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return "This field is required";
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Last Name",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                        SizedBox(height: 3.h,),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          width: 88.w,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              border: Border.all(color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return "This field is required";
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Bank Name",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                        SizedBox(height: 3.h,),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          width: 88.w,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              border: Border.all(color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return "This field is required";
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Branch",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                        SizedBox(height: 3.h,),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          width: 88.w,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              border: Border.all(color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return "This field is required";
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Account ID",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                        SizedBox(height: 3.h,),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          width: 88.w,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              border: Border.all(color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return "This field is required";
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Holder Name",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                        SizedBox(height: 3.h,),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          width: 88.w,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              border: Border.all(color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return "This field is required";
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Phone Number",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                        SizedBox(height: 3.h,),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          width: 88.w,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              border: Border.all(color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            obscureText: true,
                            obscuringCharacter: '*',
                            validator: (value){
                              if(value!.isEmpty){
                                return "This field is required";
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Password",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                        SizedBox(height: 3.h,),
                      ],
                    ),
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
