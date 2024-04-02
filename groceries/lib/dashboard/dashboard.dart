import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries/providers/dashboard_controller.dart';
import 'package:groceries/global_variables/global_variables.dart';
import 'package:groceries/screens/account/account.dart';
import 'package:groceries/screens/cart/cart.dart';
import 'package:groceries/screens/cart/cart_controller/cart_controller.dart';
import 'package:groceries/screens/favorites/favorites.dart';
import 'package:groceries/screens/home/home.dart';
import 'package:groceries/screens/search/search.dart';


class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  List<Widget> pages = const [Home(), Favorites(), Cart(), Search(), Account()];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageProv = ref.watch(page);
    return Scaffold(
      body: pages[pageProv],
      floatingActionButton: SizedBox(
        height: 50,
        width: 50,
        child: RawMaterialButton(
          onPressed: () {
            ref.read(page.notifier).onPageChnaged(0);
            pages[0];
          },
          fillColor: pageProv == 0
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
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniStartDocked,
      bottomNavigationBar: const BottomAppBar(
        elevation: 4,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
    return Consumer(
      builder: ((context, ref, child) {
        final currentIndex = ref.watch(page);
       // final cartCount = ref.watch(addToCart);
         final cartCount = ref.watch(cartCountProvider);
        return InkWell(
          onTap: () {
            ref.read(page.notifier).onPageChnaged(index);
          },
          child: 
             SizedBox(
                height: 60,
                width: 60,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 35,
                      color: index == currentIndex
                          ? Colors.green
                          : const Color.fromARGB(255, 227, 227, 205),
                    ),
                    cartCount !=0 && (index == 2)
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
                                  cartCount.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.white),
                                ))),
                          )
                        : favoritesController.favorites.isNotEmpty &&
                                (index == 1)
                            ? Positioned(
                                top: 3,
                                right: 3,
                                child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
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
          
        );
      }),
    );
  }
}


