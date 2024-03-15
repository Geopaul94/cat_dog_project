import 'package:flutter/material.dart';
import 'package:petapp/hive/functions/reminder_function/reminder_functions.dart';
import 'package:petapp/screens/main_pages/bottom_navigator.dart';

import 'package:petapp/screens/main_pages/reminder_page/updatereminder.dart';


class ReminderCardFullPage extends StatefulWidget {
   const ReminderCardFullPage({super.key});

  @override
  State<ReminderCardFullPage> createState() => _ReminderCardFullPageState();
}

class _ReminderCardFullPageState extends State<ReminderCardFullPage> {
  @override
  void initState() {
    super.initState();
    _loadData();
    addreminderDataList(); // Call a function to load data
  }

  // Function to load data
  void _loadData() async {
    // Fetch reminder data
    await getreminderData();

    // Update the UI by calling setState()
    setState(() {}); // This will trigger a rebuild of the widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.white, 
        backgroundColor:
            const Color.fromRGBO(117, 67, 191, 1),
        elevation: 10,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  BottomNavigator(indexe: 1,),
                  ),
                );
              },
            ),
            const SizedBox(
              width: 50,
            ),
            const SizedBox(width: 8), // Adjust the spacing as needed
            const Text(
              'Reminder List',
              style:  TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white60,
        child: SizedBox(
          child: ValueListenableBuilder(
            valueListenable: reminder,
            builder: (context, value, child) {
              return ListView.separated(
                itemCount: finalReminderList.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0075,
                ),
                itemBuilder: (context, index) {
                  double subtitleHeight =
                      60.0 + (finalReminderList[index].note!.length / 15) * 20;

                  return Container(
                    height: MediaQuery.of(context).size.height * 0.05 +
                        subtitleHeight,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(117, 67, 191, 1),
                        width: 1.5,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.75),
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
                        size: 32,
                      ),
                      subtitle: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            finalReminderList[index].remindertype.toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(finalReminderList[index].dateandtime.toString()),
                          Text(finalReminderList[index].note.toString())
                        ],
                      ),
                      trailing: Row(
                         mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return UpdateReminder(reminder: index);
                              }));
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.blue),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Delete Confirmation'),
                                    content: const Text(
                                        'Are you sure you want to delete this item?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () async {
                                          // await deletePetDataList(
                                          //     CatList[index].id);
                                          // await deletePetDataList(
                                          //     CatList[index].id);
                                          await deletereminderDataList(
                                              finalReminderList[index].id,
                                              reminderDetails:
                                                  finalReminderList[index]);
                                          setState(() {
                                            finalReminderList =
                                                finalReminderList;
                                          });

                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Delete'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
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
      ),
    );
  }
}
