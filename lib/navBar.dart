import 'package:af24client/Api/globalVariables.dart';
import 'package:af24client/screens/AppLanguageSettings/languageMain.dart';
import 'package:af24client/screens/AppLanguageSettings/languageOptions.dart';
import 'package:af24client/screens/Brand/brand.dart';
import 'package:af24client/screens/Home/Home.dart';
import 'package:af24client/screens/MyPage/myPage.dart';
import 'package:af24client/screens/Notification/notification_main_page.dart';
import 'package:af24client/screens/Product%20Detail/ProductDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'Provider/NotificationProvider.dart';
import 'newBar.dart';

class newNavBar extends StatefulWidget {
  int index = -1;

  newNavBar({this.index = -1});

  @override
  _newNavBarState createState() => _newNavBarState();
}

class _newNavBarState extends State<newNavBar> {
  int _selectedIndex = -1;

  @override
  void initState() {
    // TODO: implement initState
    _selectedIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (index) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => newBar(
                    index: index,
                  )));
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(.60),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  _selectedIndex == 1
                      ? Image.asset('assets/icons/home.png', height: 3.h)
                      : Image.asset('assets/icons/home-1.png', height: 3.h),
                  Text('Home',
                      style: TextStyle(
                        fontSize: 9.sp,
                      ))
                ],
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  _selectedIndex == 2
                      ? Image.asset('assets/icons/Document.png', height: 3.h)
                      : Image.asset('assets/icons/Document-1.png', height: 3.h),
                  Text('New Arrivals',
                      style: TextStyle(
                        fontSize: 9.sp,
                      ))
                ],
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  _selectedIndex == 3
                      ? Consumer<MyNotification>(
                          builder: (context, value, child) {
                          return Stack(
                            children: [
                              Image.asset('assets/icons/Notification.png',
                                  height: 3.h),
                              Positioned(
                                right: 0,
                                child: Container(
                                  height: 1.9.h,
                                  width: 1.9.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.orange[700],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    value.getNotificationLength().toString(),
                                    style: TextStyle(fontSize: 6.sp),
                                  ),
                                ),
                              ),
                            ],
                          );
                        })
                      : Consumer<MyNotification>(
                          builder: (context, value, child) {
                          return Stack(
                            children: [
                              Image.asset('assets/icons/Notification-1.png',
                                  height: 3.h),
                              Positioned(
                                right: 0,
                                child: Container(
                                  height: 1.9.h,
                                  width: 1.9.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.orange[700],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    value.getNotificationLength().toString(),
                                    style: TextStyle(fontSize: 6.sp),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  Text('Notification',
                      style: TextStyle(
                        fontSize: 9.sp,
                      ))
                ],
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  _selectedIndex == 4
                      ? Image.asset('assets/icons/My Page.png', height: 3.h)
                      : Image.asset('assets/icons/My Page-1.png', height: 3.h),
                  Text('My page',
                      style: TextStyle(
                        fontSize: 9.sp,
                      ))
                ],
              ),
              label: ''),
        ]);
  }
}
