import 'package:af24client/Api/Auth_af24.dart';
import 'package:af24client/Provider/NotificationProvider.dart';
import 'package:af24client/Api/globalVariables.dart';
import 'package:af24client/screens/Chat%20Screen/chatBox.dart';
import 'package:af24client/screens/Home/Home.dart';
import 'package:af24client/screens/LoginCreateAccount/homePage.dart';
import 'package:af24client/screens/MakeAnOffer/offer.dart';
import 'package:af24client/screens/OrderHistory/OrderDetails.dart';
import 'package:af24client/screens/Product%20Detail/ProductDetailsScreen.dart';
import 'package:af24client/screens/Splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'Provider/cartProvider.dart';
import 'localization/locale_constants.dart';
import 'localization/localizations_delegate.dart';
import 'newBar.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  Notification_type = message.data.containsKey("notify_type")
      ? message.data["notify_type"]
      : '';
  print(Notification_type);
  Notification_slug = message.data.containsKey('product_slug')
      ? message.data["product_slug"]
      : '';
  Notification_OrderID =
      message.data.containsKey('order_id') ? message.data["order_id"] : '';
  Notification_shopImage =
      message.data.containsKey('shop_image') ? message.data["shop_image"] : '';
  Notification_shopName =
      message.data.containsKey('shop_name') ? message.data["shop_name"] : '';
  Notification_sellerid =
      message.data.containsKey('seller_id') ? message.data["seller_id"] : '';
  print("Handling a background message: ${message.data}");
  FirebaseMessaging.onMessageOpenedApp.listen((_handleMessage));
}

void _handleMessage(RemoteMessage message) {
  print("in app open");
  Notification_type = message.data.containsKey("notify_type")
      ? message.data["notify_type"]
      : '';
  Notification_title = message.data["title"];
  print(Notification_type);
  Notification_slug = message.data.containsKey('product_slug')
      ? message.data["product_slug"]
      : '';
  Notification_OrderID =
      message.data.containsKey('order_id') ? message.data["order_id"] : '';
  Notification_shopImage =
      message.data.containsKey('shop_image') ? message.data["shop_image"] : '';
  Notification_shopName =
      message.data.containsKey('shop_name') ? message.data["shop_name"] : '';
  Notification_sellerid =
      message.data.containsKey('seller_id') ? message.data["seller_id"] : '';
  Notification_type == '2' ||
          Notification_type == '3' ||
          Notification_type == '8' ||
          Notification_type == '10'
      ? ProductNav()
      : Notification_title == "Order"
          ? OrderNav()
          : Notification_type == '9'
              ? Get.to(chatBox(Notification_shopName, Notification_shopImage,
                  Notification_sellerid))
              : Notification_type == '1'
                  ? Get.to(() => offers(Notification_slug))
                  : Get.to(() => newBar(index: 0));
  print(message.data['winner']);
}

ProductNav() async {
  Get.to(() => ProductDetailsScreen(Notification_slug));
}

OrderNav() async {
  Get.to(() => OrderDetails(Notification_OrderID));
}

void onSelectNotification(String? payload) {
  print("abc");
  print(payload);
  print(Notification_type);
  print(Notification_slug);
  Notification_type == '2' ||
          Notification_type == '3' ||
          Notification_type == '8' ||
          Notification_type == '10'
      ? ProductNav()
      : Notification_title == 'Order'
          ? OrderNav()
          : Notification_type == '9'
              ? Get.to(chatBox(Notification_shopName, Notification_shopImage,
                  Notification_sellerid))
              : Notification_type == '1'
                  ? Get.to(() => offers(Notification_slug))
                  : Get.to(() => newBar(index: 0));
}

Future<void> setupInteractedMessage() async {
  // Get any messages which caused the application to open from
  // a terminated state.
  print('terminated');
  RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();

  // If the message also contains a data property with a "type" of "chat",
  // navigate to a chat screen
  if (initialMessage != null) {
    _handleMessage(initialMessage);
  }

  // Also handle any interaction when the app is in the background via a
  // Stream listener
  FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
}

Future<void> _selectNotification(RemoteMessage message) async {
  AndroidNotificationDetails androidPlatformChannelSpecifics =
      const AndroidNotificationDetails(
          'high_importance_channel', 'High Importance Notifications',
          importance: Importance.high,
          priority: Priority.high,
          icon: "@mipmap/app_icon");
  NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  print("message.data");
  print(message.data);
  Notification_type = message.data.containsKey("notify_type")
      ? message.data["notify_type"]
      : '';
  Notification_OrderID =
      message.data.containsKey("order_id") ? message.data["order_id"] : '';
  Notification_shopImage =
      message.data.containsKey('shop_image') ? message.data["shop_image"] : '';
  Notification_shopName =
      message.data.containsKey('shop_name') ? message.data["shop_name"] : '';
  Notification_sellerid =
      message.data.containsKey('seller_id') ? message.data["seller_id"] : '';
  Notification_title = message.data["title"];
  print(Notification_type);
  Notification_slug = message.data.containsKey('product_slug')
      ? message.data["product_slug"]
      : '';

  print('Testing something.');
  print('Testing something.');
  await FlutterLocalNotificationsPlugin().show(123, message.notification!.title,
      message.notification!.body, platformChannelSpecifics,
      payload: 'data');
  String initialRoute = '1';
  notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
    initialRoute = '2';
  }

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings();
  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  FlutterLocalNotificationsPlugin().initialize(initializationSettings,
      onSelectNotification: onSelectNotification);

  await DataApiService.instance.getSellerInfo();
  MyNotification().setNotificationLength(sellerinfo!.notify_count_unseen!);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  setupInteractedMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessageOpenedApp.listen((_handleMessage));
  FirebaseMessaging.onMessage.listen((_selectNotification));

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title // description
      importance: Importance.high,
      playSound: true);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.instance.requestPermission(
      sound: true, badge: true, alert: true, provisional: true);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MyCart()),
    ChangeNotifierProvider(create: (_) => MyNotification()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  // Locale _locale = Locale(DEVICE_LOCALE.value, '');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
      // _locale = Locale(DEVICE_LOCALE.value, '');
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
        // _locale = Locale(DEVICE_LOCALE.value, '');
      });
    });

    super.didChangeDependencies();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        locale: _locale,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "PoppinsRegular",
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ),
        supportedLocales: const [
          Locale('en', ''),
          // Locale('ar', ''),
          // Locale('hi', '')
        ],
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode &&
                supportedLocale.countryCode == locale?.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        // builder: (context, child) {
        // return Directionality(
        //   textDirection: _locale == null
        //       ? TextDirection.ltr
        //       : (_locale!.languageCode == "en"
        //       ? TextDirection.ltr
        //       : TextDirection.rtl),
        //   child: child!,
        // );
        // },
      );
    });
  }
}
