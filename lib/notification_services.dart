import 'dart:developer';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  static final FlutterLocalNotificationsPlugin _notification =
      FlutterLocalNotificationsPlugin();
  static void initialize() {
    const InitializationSettings init = InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    _notification.initialize(init);
  }

  Future shownotfication() async {
    try {
      initialize();
      final id = DateTime.now().microsecond ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          'pushnotification',
          'pushnotificationchannel',
          importance: Importance.high,
          priority: Priority.high,
        ),
      );
      _notification.show(id, 'Warning : Looks like your parked your vehicle',
          'Click here to send parking SMS', notificationDetails);
    } catch (e) {
      log(e.toString());
    }
  }
}
