import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:huawei_push/huawei_push.dart';

class HuaweiServices{
   void initPlatformstate() {
    Logger().i('HMS');
    Push.getTokenStream.listen((event) {
      Logger().i('HMS');
      Logger().i('HMS $event');
    }).onData((data) {
      Logger().i(" Data $data");
    });
  }

  Future<void> initPlatformState() async {
    // if (!mounted) return;
    // If you want auto init enabled, after getting user agreement call this method.
    await Push.setAutoInitEnabled(true);

    Push.getTokenStream.listen(
      _onTokenEvent,
      onError: _onTokenError,
    );

    
    Push.onNotificationOpenedApp.listen(
      _onNotificationOpenedApp,
    );

    final dynamic initialNotification = await Push.getInitialNotification();
    _onNotificationOpenedApp(initialNotification);

    final String? intent = await Push.getInitialIntent();
   

    Push.onMessageReceivedStream.listen(
      _onMessageReceived,
      onError: _onMessageReceiveError,
    );
    Push.getRemoteMsgSendStatusStream.listen(
      _onRemoteMessageSendStatus,
      onError: _onRemoteMessageSendError,
    );

    bool backgroundMessageHandler = await Push.registerBackgroundMessageHandler(
      backgroundMessageCallback,
    );
    debugPrint(
      'backgroundMessageHandler registered: $backgroundMessageHandler',
    );
  }

    void _onTokenEvent(String event) {
      Logger().i(event);
  }

  void _onTokenError(Object error) {
    PlatformException e = error as PlatformException;
   Logger().i('TokenErrorEvent ${e.message!}');
  }

   void _onMessageReceived(RemoteMessage remoteMessage) {
    String? data = remoteMessage.data;
    if (data != null) {
      Push.localNotification(
        <String, String>{
          HMSLocalNotificationAttr.TITLE: 'DataMessage Received',
          HMSLocalNotificationAttr.MESSAGE: data,
        },
      );
      Logger().i('onMessageReceived $data');
    } else {
      Logger().i('onMessageReceived No data is present.');
    }
  }


  void _onIntentError(Object err) {
    PlatformException e = err as PlatformException;
    debugPrint('Error on intent stream: $e');
  }

    void _onNotificationOpenedApp(dynamic initialNotification) {
    if (initialNotification != null) {
      Logger().i('onNotificationOpenedApp ${initialNotification.toString()}');
    }
  }
  void _onMessageReceiveError(Object error) {
    Logger().i('onMessageReceiveError $error');
  }
  void _onRemoteMessageSendStatus(String event) {
     Logger().i('onMessageReceiveError $event');
  }

 void _onRemoteMessageSendError(Object error) {
    PlatformException e = error as PlatformException;
    Logger().i('RemoteMessageSendError Error: $e');
  }

  void backgroundMessageCallback(RemoteMessage remoteMessage) async {
  String? data = remoteMessage.data;
  if (data != null) {
    debugPrint(
      'Background message is received, sending local notification.',
    );
    Push.localNotification(
      <String, String>{
        HMSLocalNotificationAttr.TITLE: '[Headless] DataMessage Received',
        HMSLocalNotificationAttr.MESSAGE: data,
      },
    );
  } else {
    debugPrint(
      'Background message is received. There is no data in the message.',
    );
  }
}
}


