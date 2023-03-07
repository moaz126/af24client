import 'package:af24client/models/BoutiquesNews.dart';
import 'package:af24client/models/HomeBrandList.dart';
import 'package:af24client/screens/New_Screens/activity/activity_page.dart';
import 'package:af24client/screens/New_Screens/boutique_page/botiques_page.dart';
import 'package:af24client/screens/New_Screens/favorite_screen/favorite_page.dart';
import 'package:af24client/screens/New_Screens/home_screen/home_page.dart';
import 'package:af24client/screens/New_Screens/setting/setting.dart';
import 'package:af24client/screens/New_Screens/auth_screens/shipping_country_screen.dart';
import 'package:af24client/screens/Widgets/page_transition.dart';
import 'package:flutter/material.dart';

class CommonNavigationBar extends StatefulWidget {
  CommonNavigationBar({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<CommonNavigationBar> createState() => _CommonNavigationBarState();
}

class _CommonNavigationBarState extends State<CommonNavigationBar> {
  int index = -1;

  @override
  void initState() {
    index = widget.index;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.black, width: 1.5))),
      child: BottomNavigationBar(
        elevation: 0,
        // currentIndex: index,
        onTap: (value) {
          if (value == 0) {
            // Get.off(() => const HomePage());
            PageTransition.fadeInNavigation(page: const HomePage());
          } else if (value == 1) {
            // Get.off(() => const ShopScreen());
            PageTransition.fadeInNavigation(page: BoutiquesPage());
          } else if (value == 2) {
            // Get.off(() => const Discovery_Page());
            PageTransition.fadeInNavigation(page: const ActivityScreen());
          } else if (value == 3) {
            // Get.off(() => const LikePage());
            PageTransition.fadeInNavigation(page: const FavoriteScreen());
          } else if (value == 4) {
            // Get.off(() => const LikePage());
            PageTransition.fadeInNavigation(page: const SettingPage());
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: Colors.black,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  border: index==0?Border.all(
                    width: 1.5
                  ):Border.all(color: Colors.transparent)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5,top: 3,bottom: 3),
                  child: Text('New',style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold
                  ),
                  ),

                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                    border: index==1?Border.all(width: 1.5):Border.all(color: Colors.transparent)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5,top: 3,bottom: 3),
                  child: Text('Boutiques',style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold
                  ),),

                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                    border: index==2?Border.all(width: 1.5):Border.all(color: Colors.transparent)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5,top: 3,bottom: 3),
                  child: Text('Activities',style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold
                  ),),

                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                    border: index==3?Border.all(width: 1.5):Border.all(color: Colors.transparent)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5,top: 3,bottom: 3),
                  child: Text('Favorites',style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold
                  ),),

                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                    border: index==4?Border.all(width: 1.5):Border.all(color: Colors.transparent)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5,top: 3,bottom: 3),
                  child: Text('Setting',style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold
                  ),),

                ),
              ),
              label: ''),
        ],
      ),
    );
  }
}
