import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:groceries/screens/home/home.dart';
import 'package:groceries/theme/themes.dart';
import 'package:groceries/theme/themes_controller.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

final themeController = Get.put(ThemeController());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: themeController.theme,
      home: const MyHomePage(),
    );
  }
}
