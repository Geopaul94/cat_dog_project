import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:petapp/hive/functions/pet_function/pet_hive_function.dart';
import 'package:petapp/hive/functions/reminder_function/reminder_functions.dart';
import 'package:petapp/local_notifier.dart';
import 'package:petapp/model/petmodel/pet/pet_model.dart';
import 'package:petapp/firebase_options.dart';
import 'package:petapp/model/petmodel/reminder/reminder_model.dart';
import 'package:petapp/screens/firebase/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  await LocalNotification.init();

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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Barkmeow',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const SplashScreen());
  }
}
