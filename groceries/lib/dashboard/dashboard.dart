import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
      body: pages[0],
      floatingActionButton: SizedBox(
        height: 50,
        width: 50,
        child: RawMaterialButton(
        onPressed: () {pages[0];},
        fillColor: Colors.green,
        shape: const CircleBorder(),
        elevation: 1.0,
        child: const Icon(Icons.home,color: Colors.white,size: 30,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartDocked,
    );
  }
}
