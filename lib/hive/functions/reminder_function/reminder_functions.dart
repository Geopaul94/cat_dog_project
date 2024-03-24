// import 'dart:async';

// import 'package:flutter/foundation.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:petapp/model/petmodel/reminder/reminder_model.dart';

// const String reminderData = 'reminderData';
// ValueNotifier<String> reminder = ValueNotifier("reminder");

// List<ReminderModel> finalReminderList = [];
// List<ReminderModel> medicineReminderList = [];
// List<ReminderModel> vaccineReminderList = [];
// List<ReminderModel> notesReminderList = [];

// Future<void> addReminder({required ReminderModel reminderDetails}) async {
//   try {
//     final box = await Hive.openBox<ReminderModel>(reminderData);
//     await box.put(reminderDetails.id, reminderDetails);
//     // await addreminderDataList();

//     if (kDebugMode) {
//       print('Data added successfully.');
//     }
//   } catch (e) {
//     if (kDebugMode) {
//       print('Error adding data: $e');
//     }
//   }
// }

// Future<List<ReminderModel>> getreminderData() async {
//   final box = await Hive.openBox<ReminderModel>(reminderData);
//   if (kDebugMode) {
//     print(box.values);
//   }
//   return box.values.toList();
// }

// Future<void> addreminderDataList() async {
//   finalReminderList.clear();
//   final data = await getreminderData();
//   finalReminderList.addAll(data);
// }

// Future<void> deletereminderDataList(String id,
//     {required ReminderModel reminderDetails}) async {
//   final box = await Hive.openBox<ReminderModel>(reminderData);
//   await box.delete(reminderDetails.id);
//   await addreminderDataList();

//   // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
//   reminder.notifyListeners();
// }

// // Future<void> deletereminderDataList(catListId) async {
// //   final box = await Hive.openBox<ReminderModel>(reminderData);
// //   await box.delete(catListId);
// //   await addreminderDataList();
// //   //await addpets();
// //   await getCatData();
// //   await getDogData();

// //   // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
// //   Pets.notifyListeners();
// // }

// Future<void> editreminderDataList(
//     int index, ReminderModel reminderDetails) async {
//   final box = await Hive.openBox<ReminderModel>(reminderData);
//   await box.putAt(index, reminderDetails);
//   await addreminderDataList();
//   reminder.notifyListeners();
// }

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:petapp/model/petmodel/reminder/reminder_model.dart';

const String reminderData = 'reminderData';
ValueNotifier<String> reminder = ValueNotifier("reminder");

List<ReminderModel> finalReminderList = [];
List<ReminderModel> medicineReminderList = [];
List<ReminderModel> vaccineReminderList = [];
List<ReminderModel> notesReminderList = [];

Future<void> addReminder({required ReminderModel reminderDetails}) async {
  try {
    final box = await Hive.openBox<ReminderModel>(reminderData);
    await box.put(reminderDetails.id, reminderDetails);
    await addreminderDataList();

    if (kDebugMode) {
      print('Data added successfully.');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error adding data: $e');
    }
  }
}

Future<List<ReminderModel>> getreminderData() async {
  final box = await Hive.openBox<ReminderModel>(reminderData);
  if (kDebugMode) {
    print(box.values);
  }
  return box.values.toList();
}

Future<void> addreminderDataList() async {
  finalReminderList.clear();
  medicineReminderList.clear();
  vaccineReminderList.clear();
  notesReminderList.clear();

  final data = await getreminderData();
  finalReminderList.addAll(data);

  // Separate reminders based on reminder type
  for (var reminder in finalReminderList) {
    switch (reminder.remindertype) {
      case 'Medicine':
        medicineReminderList.add(reminder);
        break;
      case 'Vaccine':
        vaccineReminderList.add(reminder);
        break;
      case 'Notes':
        notesReminderList.add(reminder);
        break;
      default:
        break;
    }
  }
}

Future<void> deletereminderDataList(String id,
    {required ReminderModel reminderDetails}) async {
  final box = await Hive.openBox<ReminderModel>(reminderData);
  await box.delete(reminderDetails.id);
  await addreminderDataList();

  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  reminder.notifyListeners();
}

Future<void> editreminderDataList(
    int index, ReminderModel reminderDetails) async {
  final box = await Hive.openBox<ReminderModel>(reminderData);
  await box.putAt(index, reminderDetails);
  await addreminderDataList();
  reminder.notifyListeners();
}
