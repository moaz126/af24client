

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthenticateProvider extends ChangeNotifier {
  GoogleSignInAccount? _currentUser;
  // AuthController auth = Get.put(AuthController());
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );

  GoogleSigInIntroduce() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      _currentUser = account;
      print("account");
      print(account);
      // setState(() {
      //   _currentUser = account;
      // });
    });
    _googleSignIn.signInSilently();
    // notifyListeners();
  }

  Future<void> signIn(BuildContext context, bool fromLogin) async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        _currentUser = googleUser;
        final googleAuth = await googleUser.authentication;
        print("check");
        print(googleAuth);
        final credentials = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        print(credentials);
        // setUserType(type: "Google");
        // setUserLoggedIn(true);
        // _onRegister(fromLogin,_currentUser!.id,_currentUser!.displayName!.split(" ")[0].toString(), _currentUser!.displayName!.split(" ")[1].toString(), _currentUser!.email,"","google", context);
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return AlertDialog(
        //       //insetPadding:EdgeInsets.all(20) ,
        //       titlePadding:
        //           const EdgeInsets.only(left: 30, right: 30, top: 22, bottom: 10),
        //       // contentPadding: EdgeInsets.all(20),
        //       title: const Text("Your Gmail Email"),
        //       content: Column(
        //         children: [
        //           Text(_currentUser!.email.toString()),
        //           Text(_currentUser!.displayName.toString()),
        //           Text(_currentUser!.photoUrl.toString()),
        //         ],
        //       ),
        //       actions: [
        //         ElevatedButton(
        //             onPressed: () {
        //               Navigator.pop(context);
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => const BottomNavigation()),
        //               );
        //             },
        //             child: const Text("ok"),
        //             style: ElevatedButton.styleFrom()),
        //       ],
        //     );
        //   },
        // );
        notifyListeners();
      }
    } catch (e) {
      print('Error is $e');
    }
  }

  // Future _onRegister(bool fromLogin,String Uname,String fname, String Sname, String email, String pass, String registerType,BuildContext context) async {
  //   if(fromLogin){
  //     String tokenValue =
  //     Provider.of<AppProvider>(context, listen: false)
  //         .getToken();
  //     final Login_API_Results =
  //     await auth.userLogin(email: email, pass: "", tokens: tokenValue,loginType: "google",socialId: Uname);
  //     if (Login_API_Results) {
  //       LoginType.value = "login";
  //       showDialog(
  //         context: context,
  //         builder: (ctx) => AlertDialog(
  //           content: Text(auth.Msg.value.toString()),
  //         ),
  //       );
  //
  //       postMethod(context, logInApi, {'email': email, 'password': pass},
  //           false, loginDataRepo);
  //
  //       Timer(
  //           Duration(seconds: 1),
  //               () => Get.offAll(()=>BottomNavigation())
  //       );
  //     }
  //     else {
  //       showDialog(
  //         context: context,
  //         builder: (ctx) => AlertDialog(
  //           content: Text(auth.Msg.value.toString()),
  //           actions: <Widget>[
  //             ElevatedButton(
  //               onPressed: () {
  //                 Navigator.of(ctx).pop();
  //               },
  //               child: Text("okay"),
  //             ),
  //           ],
  //         ),
  //       );
  //     }
  //   }
  //   else{
  //     final SignUP_API_Results = await auth.userRegister(
  //         userName: Uname,
  //         fName: fname,
  //         lName: Sname,
  //         email: email,
  //         pass: pass,
  //         registerType:registerType
  //     );
  //     if (SignUP_API_Results) {
  //       showDialog(
  //         context: context,
  //         builder: (ctx) => AlertDialog(
  //           content: Text(auth.Msg.value.toString()),
  //         ),
  //       );
  //       String tokenValue =
  //       Provider.of<AppProvider>(context, listen: false)
  //           .getToken();
  //       final Login_API_Results =
  //       await auth.userLogin(email: email, pass: "", tokens: tokenValue,loginType: "google",socialId: Uname);
  //       if (Login_API_Results) {
  //         LoginType.value = "login";
  //         showDialog(
  //           context: context,
  //           builder: (ctx) => AlertDialog(
  //             content: Text(auth.Msg.value.toString()),
  //           ),
  //         );
  //
  //         postMethod(context, logInApi, {'email': email, 'password': pass},
  //             false, loginDataRepo);
  //
  //         Timer(
  //             Duration(seconds: 1),
  //                 () => Get.offAll(()=>BottomNavigation())
  //         );
  //       }
  //       else {
  //         showDialog(
  //           context: context,
  //           builder: (ctx) => AlertDialog(
  //             content: Text(auth.Msg.value.toString()),
  //             actions: <Widget>[
  //               ElevatedButton(
  //                 onPressed: () {
  //                   Navigator.of(ctx).pop();
  //                 },
  //                 child: Text("okay"),
  //               ),
  //             ],
  //           ),
  //         );
  //       }
  //     }
  //     else {
  //       showDialog(
  //         context: context,
  //         builder: (ctx) => AlertDialog(
  //           content: Text(auth.Msg.value.toString()),
  //         ),
  //       );
  //     }
  //   }
  // }

  Future<void> signout() async {
    _googleSignIn.disconnect();
    // setUserLoggedIn(false);
    notifyListeners();
  }

}

// class FBAuthenticateProvider extends ChangeNotifier {
//   AccessToken? _accessToken;
//   UserModel? _currentUsers;
//
//   Future<void> signInFB(BuildContext context) async {
//     final LoginResult result = await FacebookAuth.i.login();
//
//     print("checkFB");
//     print(result);
//
//
//     if(result.status == LoginStatus.success){
//       print("hello");
//       _accessToken = result.accessToken;
//       setUserLoggedIn(true);
//       setUserType(type: "FB");
//
//       final data = await FacebookAuth.i.getUserData();
//       UserModel model = UserModel.fromJson(data);
//
//       _currentUsers = model;
//       print("checkEmail");
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             //insetPadding:EdgeInsets.all(20) ,
//             titlePadding: const EdgeInsets.only(
//                 left: 30, right: 30, top: 22, bottom: 10),
//             // contentPadding: EdgeInsets.all(20),
//             title: const Text("Your FB Email"),
//             content: Text(_currentUsers!.email.toString()),
//             actions: [
//               ElevatedButton(onPressed: (){
//                 Navigator.pop(context);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const BottomNavigation()),
//                 );
//               }, child: const Text("ok"), style: ElevatedButton.styleFrom()),
//             ],
//
//           );
//         },
//       );
//       print(_currentUsers!.email.toString());
//       // setState(() {
//       //
//       // });
//     }
//   }
//   Future<void> signOutFB() async {
//     await FacebookAuth.i.logOut();
//     _currentUsers = null;
//     _accessToken = null;
//     setUserLoggedIn(false);
//     // setState(() {
//     //
//     // });
//   }
//
// }
// class UserModel{
//   final String? email;
//   final String? id;
//   final String? name;
//   final PictureModel? pictureModel;
//
//   const UserModel({this.name, this.pictureModel, this.email, this.id});
//
//   factory UserModel.fromJson(Map<String, dynamic> json) =>
//       UserModel(
//           email: json['email'],
//           id: json['id'] as String?,
//           name: json['name'],
//           pictureModel: PictureModel.fromJson(json['picture']['data'])
//       );
//
//
//
// }
// class PictureModel{
//   final String? url;
//   final int? width;
//   final int? height;
//
//   const PictureModel({this.width, this.height, this.url});
//
//   factory PictureModel.fromJson(Map<String, dynamic> json) =>
//       PictureModel(
//           url: json['url'],
//           width: json['width'],
//           height: json['height']
//       );
// }