import 'package:af24client/Provider/NotificationProvider.dart';
import 'package:af24client/screens/Home/Home.dart';
import 'package:af24client/screens/MyPage/myPage.dart';
import 'package:af24client/screens/LatestProducts/LatestProductsScreen.dart';
import 'package:af24client/screens/Notification/notification_main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class newBar extends StatefulWidget {
  newBar({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<newBar> createState() => _newBarState();
}

class _newBarState extends State<newBar> {
  late var screens;
  int index = 0;
  int _selectedIndex = -1;

  @override
  void initState() {
    index = widget.index;
    screens = [
      home(),
      LatestProductsScreen(),
      MainPage(),
      myPage(),
    ];
    _selectedIndex = index;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
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
                  index == 0
                      ? Image.asset('assets/icons/home.png', height: 3.h)
                      : Image.asset('assets/icons/home-1.png', height: 3.h),
                  Text(
                    'Home',
                    style: TextStyle(fontSize: 9.sp),
                  )
                ],
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  index == 1
                      ? Image.asset('assets/icons/Document.png', height: 3.h)
                      : Image.asset('assets/icons/Document-1.png', height: 3.h),
                  Text(
                    'New Arrivals',
                    style: TextStyle(fontSize: 9.sp),
                  )
                ],
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  index == 2
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
                  Text(
                    'Notification',
                    style: TextStyle(fontSize: 9.sp),
                  )
                ],
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  index == 3
                      ? Image.asset('assets/icons/My Page.png', height: 3.h)
                      : Image.asset('assets/icons/My Page-1.png', height: 3.h),
                  Text(
                    'My page',
                    style: TextStyle(fontSize: 9.sp),
                  )
                ],
              ),
              label: ''),
        ],
      ),
    );
  }
}
