// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationService {
//   final FlutterLocalNotificationsPlugin notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> initNotification() async {
//     AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings("defaultIcon");
//     var initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: IOSInitializationSettings(),
//     );

//     await notificationsPlugin.initialize(initializationSettings);

//     // Request permissions for alert, badge, and sound notifications
//     var platformSpecifics = NotificationSettings(
//       android: AndroidNotificationSettings(
//         channelShowBadge: true,
//         importance: Importance.max,
//         priority: Priority.high,
//         channelAction: AndroidNotificationChannelAction.update,
//       ),
//       iOS: IOSNotificationSettings(
//         requestSoundPermission: true,
//         requestBadgePermission: true,
//         requestAlertPermission: true,
//       ),
//     );
//     await notificationsPlugin.resolvePlatformSpecificImplementation<
//         IOSF
// 6666666666666666666666666666666666666666666666666666666lutterLocalNotificationsPlugin>()?.requestPermissions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
// }
