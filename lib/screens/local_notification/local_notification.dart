import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotifications {
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static final onClickNotification =BehaviorSubject<String>();
// on tap any notification
static void onNotificationTap (NotificationResponse notificationResponse){
  onClickNotification.add(notificationResponse.payload!);
}


  static Future  init ()async{
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
final DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(
        // ignore: avoid_returning_null_for_void
        onDidReceiveLocalNotification: (id, title, body, payload) => null,);
const LinuxInitializationSettings initializationSettingsLinux =
    LinuxInitializationSettings(
        defaultActionName: 'Open notification');
final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
    linux: initializationSettingsLinux);
_flutterLocalNotificationsPlugin.initialize(initializationSettings,
    onDidReceiveNotificationResponse: onNotificationTap,
    onDidReceiveBackgroundNotificationResponse: onNotificationTap);


  }
  //simple notification
  static Future showSimpleNotification({
    required String tittle,
    required String body ,
    required String payload,
  })async{
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);
await _flutterLocalNotificationsPlugin.show(
    0, tittle, body, notificationDetails,
    payload: payload);


  }


  static Future periodicNotification ({
    required String title,
    required String body,
    required String payload,
  })async{
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('channel-2', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.periodicallyShow(1, title, body, RepeatInterval.hourly, notificationDetails);
  } 
  // close a specefic channel notification

  static Future cancelNotification(int id) async{
    await _flutterLocalNotificationsPlugin.cancel(id);
  }
  //close all notification
  static Future cancelAllNotifications()async{
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
 // to schedulenotification

static Future scheduleNotification({
  required String title,
  required String body,
  required String payload,
  required TimeOfDay scheduledTime,
  required List<int> daysOfWeek,
}) async {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

  for (int day in daysOfWeek) {
    int daysUntilNextDay = (day - now.weekday + 7) % 7;
    tz.TZDateTime scheduledTimeZoneDateTime = now.add(Duration(days: daysUntilNextDay));
    scheduledTimeZoneDateTime = tz.TZDateTime(
      tz.local,
      scheduledTimeZoneDateTime.year,
      scheduledTimeZoneDateTime.month,
      scheduledTimeZoneDateTime.day,
      scheduledTime.hour,
      scheduledTime.minute,
    );

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'your_channel_id',
      'channel-2',
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      fullScreenIntent: true,
      
      
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      title,
      body,
      scheduledTimeZoneDateTime,
      notificationDetails,
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );
  }
}
 static Future periodicNotification2 ({
    required String title,
    required String body,
    required String payload,
  })async{
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('channel-4', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.periodicallyShow(4, title, body, RepeatInterval.hourly,  notificationDetails);
  } 

          
  }