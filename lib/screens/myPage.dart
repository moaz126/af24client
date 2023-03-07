import 'package:af24client/models/profile.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class myPage extends StatefulWidget {
  const myPage({Key? key}) : super(key: key);

  @override
  _myPageState createState() => _myPageState();
}

class _myPageState extends State<myPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            'My page',
            style: TextStyle(color: Colors.black, fontSize: 20.sp),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 11.0),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image.asset(
                  'assets/icons/Seller app icon (6).png',
                  height: 3.7.h,
                ),
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      color: Colors.orange[700],
                      borderRadius: BorderRadius.circular(10)),
                ),
                Container(
                  padding: EdgeInsets.only(right: 1, bottom: 1),
                  //color: Colors.blue,
                  child: Text(
                    "23",
                    style: TextStyle(color: Colors.black, fontSize: 8),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.asset(Profile[0].imagePath),
                    ),
                    Text(Profile[0].userName)
                  ],
                ),
              ),
            ),
            // Row(
            //   children: [
            //     Image.asset(Profile[0].imagePath),
            //     Text(Profile[0].userName)
            //   ],
            // ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'My Af24',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  color: Colors.grey.withOpacity(0.3)),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('- My Items'),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  color: Colors.grey.withOpacity(0.3)),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('- Order History'),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'My Account',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Settings',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  color: Colors.grey.withOpacity(0.3)),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('- Push Notification'),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  color: Colors.grey.withOpacity(0.3)),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('- Privacy'),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Help',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  color: Colors.grey.withOpacity(0.3)),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('- Sell with us'),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  color: Colors.grey.withOpacity(0.3)),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('- FAQ'),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  color: Colors.grey.withOpacity(0.3)),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('- Chat with us'),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.grey),
                  bottom: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Log out',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
