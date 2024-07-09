import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:groceries/firebase_options.dart';
import 'package:groceries/screens/cart/cart.dart';
import 'package:groceries/screens/categories/fruits.dart';
import 'package:groceries/screens/favorites/favorites.dart';
import 'package:groceries/screens/home/autoussd.dart';
import 'package:groceries/screens/home/ussd_page.dart';
import 'package:groceries/theme/themes.dart';
import 'package:groceries/theme/themes_controller.dart';
import 'package:groceries/utilities/initializer.dart';
import 'package:groceries/utilities/messaging_services.dart';
import 'package:groceries/utilities/routes.dart';
import 'package:logger/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Initializer.init();
  getDeviceModel();
  setUpNotification();
  runApp(const ProviderScope(child:  MyApp()));
}

final themeController = Get.put(ThemeController());
var logger = Logger();
const platform = MethodChannel('groceries.ussd');

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: Themes.lightTheme,
      debugShowCheckedModeBanner: false,
      darkTheme: Themes.darkTheme,
      themeMode: themeController.theme,
      getPages: [
        GetPage(name: Routes.FRUITS, page: () => const Fruits()),
        GetPage(name: Routes.FAVORITES, page: () => const Favorites()),
        GetPage(name: Routes.CART, page: () => const Cart())
      ],
      home: const USSDRequest(),
    );
  }
}
