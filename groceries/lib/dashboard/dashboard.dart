import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries/controllers/dashboard_controller.dart';
import 'package:groceries/screens/account/account.dart';
import 'package:groceries/screens/cart/cart.dart';
import 'package:groceries/screens/favorites/favorites.dart';
import 'package:groceries/screens/home/home.dart';
import 'package:groceries/screens/search/search.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Widget> pages = const [Home(), Favorites(), Cart(), Account(), Search()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.currentPageIndex.value]),
      floatingActionButton: SizedBox(
        height: 50,
        width: 50,
        child: Obx(() => 
           RawMaterialButton(
            onPressed: () {
              controller.currentPageIndex.value = 0;
              pages[0];
            },
            fillColor: controller.currentPageIndex.value == 0
                ? Colors.green
                : const Color.fromARGB(255, 230, 236, 231),
            shape: const CircleBorder(),
            elevation: 1.0,
            child: const Icon(
              Icons.home,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniStartDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 4,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            SizedBox(width: 10),
            BottomNavItem(icon: Icons.favorite, index: 1),
            BottomNavItem(index: 2, icon: Icons.shopping_cart),
            BottomNavItem(index: 3, icon: Icons.shopping_bag),
            BottomNavItem(index: 4, icon: Icons.person)
          ],
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    required this.index,
    required this.icon,
  }) : super(key: key);
  final int index;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.currentPageIndex.value = index;
      },
      child: Obx(
        () => SizedBox(
            height: 60,
            width: 60,
            child: Icon(
              icon,
              size: 35,
              color: index == controller.currentPageIndex.value
                  ? Theme.of(context).primaryColor
                  :  const Color.fromARGB(255, 227, 227, 205),
            )),
      ),
    );
  }
}

final controller = Get.put(DashBoardController());
