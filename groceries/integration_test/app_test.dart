
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:groceries/dashboard/dashboard.dart';
import 'package:groceries/main.dart';
import 'package:groceries/screens/account/account.dart';
import 'package:groceries/screens/cart/cart.dart';
import 'package:groceries/screens/favorites/favorites.dart';
import 'package:groceries/screens/home/home.dart';
import 'package:groceries/screens/search/search.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('MyApp integration test', (WidgetTester tester) async {
    // Initialize Firebase and other necessary dependencies
    await Firebase.initializeApp();
    await GetStorage.init();

    // Pump the MyApp widget
    await tester.pumpWidget(const MyApp());

    // Verify the initial state of the screen
    expect(find.byType(Dashboard), findsOneWidget);

    // Rest of the test code...
  });

  testWidgets('Dashboard widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    
    // Verify that the initial page is the Home page
    expect(find.byType(Home), findsOneWidget);

    // Tap on the Favorites bottom navigation item
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pumpAndSettle();

    // Verify that the Favorites page is displayed
    expect(find.byType(Favorites), findsOneWidget);

    // Tap on the Cart bottom navigation item
    await tester.tap(find.byIcon(Icons.shopping_cart));
    await tester.pumpAndSettle();

    // Verify that the Cart page is displayed
    expect(find.byType(Cart), findsOneWidget);

    // Tap on the Search bottom navigation item
    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();

    // Verify that the Search page is displayed
    expect(find.byType(Search), findsOneWidget);

    // Tap on the Account bottom navigation item
    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();

    // Verify that the Account page is displayed
    expect(find.byType(Account), findsOneWidget);
  });

  
}
