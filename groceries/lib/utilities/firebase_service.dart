import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:groceries/widgets/show_notification.dart';
import 'package:logger/logger.dart';

class FirebaseService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  // FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  notificationSettings() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    Logger().i('User granted permission: ${settings.authorizationStatus}');
  }

  getFirebaseToken() async {
    FirebaseMessaging.instance.onTokenRefresh.listen((messaging) {
      Logger().i('REFRESH $messaging');
    }).onError((err) {});
    messaging.getToken().then(
      (value) {
        Logger().i('TOKEN ${value!}');
      },
    );
  }

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

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    Logger().i('Got a message whilst in the foreground!');
    Logger().i('Message data: ${message.data}');
      showNotification(
          title: notification?.title,
          body: notification?.body,
          image: message.data["image"],
          route: message.data["screen"]);    
    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  }

  void _handleMessageBackground(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    if (message.data["screen"] != null) {
      Get.toNamed('/${message.data["screen"]}');
    }

    Logger().i("notification: $notification");
    Logger().i("message data: ${message.data}");
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
}
