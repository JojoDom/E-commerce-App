import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries/controllers/home_controller.dart';
import 'package:groceries/theme/themes_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final themeController = Get.find<ThemeController>();
  late HomeController homeController;
  bool _isVisible = true;

  void switchIcon() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  void initState() {
    homeController = Get.put(HomeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: const ListTile(
              title: Text('Hey'),
              subtitle: Text('Start shopping!'),
            ),
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Obx(() => 
                   TextFormField(
                      textAlign: TextAlign.center,
                      controller: homeController.searchController,
                      decoration: InputDecoration(
                    prefixIcon: Visibility(
                      visible: homeController.isVisible.value,
                      replacement: IconButton(
                          onPressed: () {
                            homeController.searchController.clear();
                            homeController.isVisible.value = true;
                          },
                          icon: const Icon(Icons.close)),
                      child: IconButton(
                          onPressed: () {
                            homeController.switchIcon();
                          },
                          icon: const Icon(Icons.search)),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:  const BorderSide(
                          color: Colors.green
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        )),
                    hintText: 'Search your daily fresh foods',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 12),
                      ),
                     ),
                ),
              ),
            ),
          ),
          body: ListView(

          )),
    );
  }
}
