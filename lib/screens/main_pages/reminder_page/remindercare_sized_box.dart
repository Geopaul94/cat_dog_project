import 'package:flutter/material.dart';
import 'package:petapp/hive/functions/reminder_function/reminder_functions.dart';

class ReminderCardSizedBox extends StatefulWidget {
  const ReminderCardSizedBox({super.key});

  @override
  State<ReminderCardSizedBox> createState() => _ReminderCardSizedBoxState();
}

class _ReminderCardSizedBoxState extends State<ReminderCardSizedBox> {
  @override
  void initState() {
    super.initState();
    _loadData();
    addreminderDataList(); 
  }

  void _loadData() async {
  
    await getreminderData();

    // Update the UI by calling setState()
    setState(() {}); // This will trigger a rebuild of the widget
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: SizedBox(
        // height: 225,
        // width: 400,

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
                    leading:
                        const Icon(Icons.lock_clock_sharp, color: Colors.red),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                            // Implement edit functionality here
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.blue),
                          onPressed: () {
                            // Implement delete functionality here
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
    );
  }
}
