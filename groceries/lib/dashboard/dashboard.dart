import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries/controllers/dashboard_controller.dart';
import 'package:groceries/global_variables/global_variables.dart';
import 'package:groceries/screens/account/account.dart';
import 'package:groceries/screens/cart/cart.dart';
import 'package:groceries/screens/favorites/favorites.dart';
import 'package:groceries/screens/home/home.dart';
import 'package:groceries/screens/search/search.dart';
import 'package:groceries/utilities/routes.dart';
import 'package:groceries/widgets/show_notification.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Widget> pages = const [Home(), Favorites(), Cart(), Search(), Account()];

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessageBackground(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageBackground);
  }

  void _handleMessageBackground(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    if (message.data["screen"] != null) {
      Get.toNamed('/${message.data["screen"]}');
    }

    print("notification: $notification");
    print("message data: ${message.data}");
  }

  void _handleMessageForeGround(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
     
      print("notification: $notification");
      print("message data: ${message.data}");

      // flutterLocalNotificationsPlugin?.show(notification.hashCode,
      //      notification?.title, notification?.body, const NotificationDetails());
    });
  }

  @override
  void initState() {
    setupInteractedMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.currentPageIndex.value]),
      floatingActionButton: SizedBox(
        height: 50,
        width: 50,
        child: Obx(
          () => RawMaterialButton(
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
            SizedBox(width: 15),
            BottomNavItem(icon: Icons.favorite, index: 1),
            BottomNavItem(index: 2, icon: Icons.shopping_cart),
            BottomNavItem(index: 3, icon: Icons.search),
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
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  icon,
                  size: 35,
                  color: index == controller.currentPageIndex.value
                      ? Colors.green
                      : const Color.fromARGB(255, 227, 227, 205),
                ),
                cartController.cart.isNotEmpty && (index == 2)
                    ? Positioned(
                        top: 3,
                        right: 3,
                        child: Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                            child: Center(
                                child: Text(
                              cartController.cart.length.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.white),
                            ))),
                      )
                    : favoritesController.favorites.isNotEmpty && (index == 1)
                        ? Positioned(
                            top: 3,
                            right: 3,
                            child: Container(
                                height: 20,
                                width: 20,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                                child: Center(
                                    child: Text(
                                  favoritesController.favorites.length
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.white),
                                ))),
                          )
                        : const SizedBox()
              ],
            )),
      ),
    );
  }
}

final controller = Get.put(DashBoardController());
