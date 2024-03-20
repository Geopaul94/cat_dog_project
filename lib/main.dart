import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:petapp/hive/functions/pet_function/pet_hive_function.dart';
import 'package:petapp/hive/functions/reminder_function/reminder_functions.dart';

import 'package:petapp/model/petmodel/pet/pet_model.dart';
import 'package:petapp/firebase_options.dart';
import 'package:petapp/model/petmodel/reminder/reminder_model.dart';

import 'package:petapp/screens/firebase/splash_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(PetModelAdapter().typeId)) {
    Hive.registerAdapter(PetModelAdapter());
  }
  if (!Hive.isAdapterRegistered(ReminderModelAdapter().typeId)) {
    Hive.registerAdapter(ReminderModelAdapter());
  }
  await getCatData();
  await getDogData();
  await addPetDataList();
  await getreminderData();
  await addreminderDataList();

  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelGroupKey: "bassic_channel_group",
      channelKey: 'basic_channel',
      channelName: 'Basic Notifications',
      channelDescription: 'Notification channel for basic tests',
      defaultColor: Colors.teal,
      ledColor: Colors.white,
      importance: NotificationImportance.High,
    )
  ], channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: "bassic_channel_group",
        channelGroupName: "Basic_group")
  ]);

  Future<bool> Function() isAllowedToSentNotification =
      AwesomeNotifications().isNotificationAllowed;

  // if (!isAllowedToSentNotification) {
  AwesomeNotifications().requestPermissionToSendNotifications();
  // }

// else {
//   // Show a message or prompt the user to enable notifications
//   print('Notifications are disabled for this app.');
// }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Barkmeow',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const SplashScreen());
  }
}
