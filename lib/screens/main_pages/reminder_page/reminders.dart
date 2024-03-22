import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:petapp/hive/functions/reminder_function/reminder_functions.dart';
import 'package:petapp/model/petmodel/reminder/reminder_model.dart';
import 'package:petapp/screens/main_pages/reminder_page/notifications/notification.dart';

import 'package:petapp/screens/main_pages/reminder_page/add_reminder.dart';
import 'package:petapp/screens/main_pages/reminder_page/reminder_card_full_page.dart';
import 'package:petapp/screens/main_pages/reminder_page/updatereminder.dart';
import 'package:petapp/screens/main_pages/reminder_page/widgetrefractor_reminder/threebox_image.dart';

class Reminders extends StatefulWidget {
  const Reminders({super.key});

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  @override
  void initState() {
    super.initState();
    _loadData();
    addreminderDataList();

    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
  }

  void _loadData() async {
    await getreminderData();

    setState(() {});
  }

  Future<void> scheduleNotificationsFromHive() async {
    // Open the Hive box containing ReminderModel objects
    final box = await Hive.openBox<ReminderModel>('reminderBox');

    // Fetch ReminderModel objects from the box
    List<ReminderModel> reminders = box.values.toList();

    // Iterate over each ReminderModel object
    for (ReminderModel reminder in reminders) {
      // Extract the date and time string from the ReminderModel
      String notificationDateTimeString = reminder.dateandtime;

      // Convert the date and time string to a DateTime object
      DateTime notificationDateTime =
          DateTime.parse(notificationDateTimeString);

      // Schedule the notification using AwesomeNotifications

      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: reminder.id.hashCode, // Use a unique ID for each notification
          channelKey: 'basic_channel',
          title: 'Reminder',
          body: 'This is your reminder: ${reminder.remindertype}',
        ),
        schedule: NotificationInterval(
          interval: 1,
          //    timeZone: , // Use the device's time zone
          // Schedule at the specified date and time
          repeats: false, // Do not repeat the notification
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              "Health",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
          backgroundColor: const Color.fromRGBO(229, 109, 87, 1)

          //  Color.fromRGBO(176, 83, 30, 0),
          ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromRGBO(247, 246, 251, 1),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Card(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 2,
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Center(
                            child: Text(
                              "Reminder Types",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color.fromRGBO(117, 67, 191, 1)),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Boxes(
                                text: 'Vaccine',
                                color: Color.fromRGBO(243, 220, 151,
                                    1), // Create a Color object using hexadecimal value
                                imagePath:
                                    'assets/reminder/vaccine.json', // Image path
                              ),
                              Boxes(
                                text: 'Medicine',
                                color: Color.fromRGBO(240, 133, 116, 1),
                                // Create a Color object using hexadecimal value
                                imagePath:
                                    'assets/reminder/medicne2.json', // Image path
                              ),
                              Boxes(
                                text: 'Notes',
                                color: Color.fromRGBO(178, 251, 255, 1),

                                imagePath: 'assets/reminder/Notes.json',

                                // imagePath:
                                //   'assets/reminder/Note.json',
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.42,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Card(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                const Text(
                                  "Reminders",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                InkWell(
                                  onTap: () {
                                    print("seeallll");
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return const ReminderCardFullPage();
                                    }));
                                  },
                                  child: const Text(
                                    "See All",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Color.fromRGBO(117, 67, 191, 1)),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.001,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.33,
                              child: ValueListenableBuilder(
                                valueListenable: reminder,
                                builder: (context, value, child) {
                                  print(finalReminderList);
                                  return ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: finalReminderList.length,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.0075,
                                    ),
                                    itemBuilder: (context, index) {
                                      double subtitleHeight = 40.0 +
                                          (finalReminderList[index]
                                                      .note!
                                                      .length /
                                                  15) *
                                              20;

                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                    0.05 +
                                                subtitleHeight,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color.fromRGBO(
                                                117, 67, 191, 1),
                                            width: 0.85,
                                          ),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.75),
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: ListTile(
                                          leading: const Icon(
                                            Icons.alarm,
                                            color: Colors.red,
                                            size: 25,
                                          ),
                                          subtitle: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                finalReminderList[index]
                                                    .remindertype
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(finalReminderList[index]
                                                  .dateandtime
                                                  .toString()),
                                              Text(finalReminderList[index]
                                                  .note
                                                  .toString())
                                            ],
                                          ),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                icon: const Icon(Icons.edit),
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return UpdateReminder(
                                                        reminder: index);
                                                  }));
                                                },
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.delete,
                                                    color: Colors.blue),
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      // Return the AlertDialog
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Delete Confirmation'),
                                                        content: const Text(
                                                            'Are you sure you want to delete this item?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed:
                                                                () async {
                                                              // await deletePetDataList(
                                                              //     CatList[index].id);
                                                              // await deletePetDataList(
                                                              //     CatList[index].id);
                                                              await deletereminderDataList(
                                                                  finalReminderList[
                                                                          index]
                                                                      .id,
                                                                  reminderDetails:
                                                                      finalReminderList[
                                                                          index]);
                                                              setState(() {
                                                                finalReminderList =
                                                                    finalReminderList;
                                                              });
                                                              // print('a $CatList');
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: const Text(
                                                                'Delete'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              // Close the dialog
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: const Text(
                                                                'Cancel'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                ElevatedButton(
                  onPressed: () {
                    print('notification');
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => AddReminder()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                        const Color.fromRGBO(117, 67, 191, 1), // Text color
                  ),
                  child: const SizedBox(
                    width: 122,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Colors.white),
                        SizedBox(width: 8),
                        Text('Add Reminder'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
