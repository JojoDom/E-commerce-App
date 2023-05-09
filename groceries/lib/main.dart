import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:groceries/dashboard/dashboard.dart';
import 'package:groceries/firebase_options.dart';
import 'package:groceries/screens/cart/cart.dart';
import 'package:groceries/screens/categories/fruits.dart';
import 'package:groceries/screens/favorites/favorites.dart';
import 'package:groceries/theme/themes.dart';
import 'package:groceries/theme/themes_controller.dart';
import 'package:groceries/utilities/routes.dart';
import 'package:groceries/widgets/show_notification.dart';
import 'package:logger/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  NotificationSettings settings = await messaging.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);
print('User granted permission: ${settings.authorizationStatus}');
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.instance.onTokenRefresh.listen((messaging) {
    logger.i('REFRESH ' + messaging);
  }).onError((err) {});
  messaging.getToken().then(
    (value) {
      logger.i('TOKEN ' + value!);
    },
  );

  // Lisitnening to the background messages
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}
FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

// Listneing to the foreground messages
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
      showNotification(
          title: notification?.title,
          body: notification?.body,
          image: message.data["image"],
          route: message.data["screen"]);    
    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  runApp(const MyApp());
}

final themeController = Get.put(ThemeController());
var logger = Logger();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: themeController.theme,
      getPages: [
        GetPage(name: Routes.FRUITS, page: () => const Fruits()),
        GetPage(name: Routes.FAVORITES, page: () => const Favorites()),
        GetPage(name: Routes.CART, page: () => const Cart())
      ],
      home: const Dashboard(),
    );
  }
}
