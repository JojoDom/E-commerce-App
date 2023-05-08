import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:groceries/dashboard/dashboard.dart';
import 'package:groceries/theme/themes.dart';
import 'package:groceries/theme/themes_controller.dart';
import 'package:logger/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final fcmToken = await FirebaseMessaging.instance;
  FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
    logger.i('REFRESH' + fcmToken);
  }).onError((err) {
  });
  fcmToken.getToken().then(
    (value) {
      logger.i(fcmToken);
    },
  );
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
      home: const Dashboard(),
    );
  }
}
