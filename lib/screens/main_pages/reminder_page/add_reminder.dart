import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petapp/hive/functions/pet_function/pet_hive_function.dart';
import 'package:petapp/hive/functions/reminder_function/reminder_functions.dart';
import 'package:petapp/model/petmodel/reminder/reminder_model.dart';
import 'package:petapp/screens/main_pages/bottom_navigator.dart';
import 'package:petapp/screens/main_pages/reminder_page/reminder_card_full_page.dart';
import 'package:petapp/screens/widget_refractoring/customappbar .dart';

class AddReminder extends StatefulWidget {
  const AddReminder({super.key});

  @override
  State<AddReminder> createState() => _AddReminderState();
}

class _AddReminderState extends State<AddReminder> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController? noteController = TextEditingController();
  String? _selectedremindertype;

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      final TimeOfDay? timePicked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (timePicked != null) {
        final DateTime combinedDate = DateTime(
          picked.year,
          picked.month,
          picked.day,
          timePicked.hour,
          timePicked.minute,
        );
        setState(() {
          dateTimeController.text =
              DateFormat.yMd().add_jm().format(combinedDate);
        });
      }
    }
  }

  @override
  void dispose() {
    dateTimeController.dispose();
    noteController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    TextEditingController dateTimeController = TextEditingController();
    TextEditingController? noteController = TextEditingController();
    String? selectedremindertype;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("auto validation");
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromRGBO(247, 246, 251, 1),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              CustomAppBar(
                text: 'Add Reminder',
                icon: Icons.arrow_back,
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => BottomNavigator(
                      indexe: 1,
                    ),
                  ));
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                child: const Text(
                  """Set New 
Reminders
Here .......  """,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.085,
              ),
              Form(
                key: _formKey,

                // add the auto validation for doing the validation simultaniously
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.075,
                      width: MediaQuery.of(context).size.width * 0.85,
                      padding: const EdgeInsets.only(
                          left: 30.0, top: 5.0, right: 5.0, bottom: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        border: Border.all(
                            color: _selectedremindertype == null
                                ? const Color.fromRGBO(117, 67, 191, 1)
                                : Colors.transparent),
                        color: Colors.grey[400],
                      ),
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        value: _selectedremindertype,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedremindertype = value;
                          });
                        },
                        items: <String>['Vaccine', 'Medicine', 'Notes']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: const Text(
                          "     Vaccine  or Medicine",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please select a reminder type";
                          }
                          return null;
                        },
                      ),
                    ),
                    // Container(
                    //   height: MediaQuery.of(context).size.height * 0.075,
                    //   width: MediaQuery.of(context).size.width * 0.85,
                    //   padding: const EdgeInsets.only(
                    //       left: 30.0, top: 5.0, right: 5.0, bottom: 5.0),
                    //   decoration: BoxDecoration(
                    //     borderRadius: const BorderRadius.only(
                    //       topLeft: Radius.circular(25),
                    //       bottomRight: Radius.circular(25),
                    //       topRight: Radius.circular(25),
                    //     ),
                    //     border: Border.all(
                    //         color: _selectedremindertype == null
                    //             ? const Color.fromRGBO(117, 67, 191, 1)
                    //             : Colors.transparent),
                    //     color: Colors.grey[400],
                    //   ),
                    // ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.075,
                      width: MediaQuery.of(context).size.width * 0.85,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        border: Border.all(
                            color: dateTimeController.text.isEmpty
                                ? const Color.fromRGBO(117, 67, 191, 1)
                                : Colors.transparent),
                        color: Colors.grey[400],
                      ),
                      child: TextFormField(
                        controller: dateTimeController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 5.0),
                          border: InputBorder.none,
                          labelText: '        Date & Time',
                          suffixIcon: Icon(Icons.calendar_month),
                        ),
                        onTap: () {
                          _selectDateTime(context);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "   Please select a date and time";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    Container(
                      //  height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.85,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        border: Border.all(
                            color: noteController == null
                                ? const Color.fromRGBO(117, 67, 191, 1)
                                : Colors.transparent),
                        color: Colors.grey[400],
                      ),
                      child: TextFormField(
                        // minLines: 1, // Minimum number of lines
                        // maxLines: 5,
                        controller: noteController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 3.0),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: InputBorder.none,
                          hintText: '  Notes',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a reminder note';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Clear text fields
                      dateTimeController.clear();
                      noteController!.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(229, 109, 87, 1),

                      foregroundColor:
                          Colors.white, // Use 'black' from Colors class
                    ),
                    child: const Text('Clear'),
                  ),
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     if (_formKey.currentState!.validate()) {
                  //       String remindertype = _selectedremindertype ?? "";
                  //       String note = noteController!.text;
                  //       String dateAndTime = dateTimeController.text;

                  //       await addReminder(
                  //         reminderDetails: ReminderModel(
                  //           id: DateTime.now()
                  //               .microsecondsSinceEpoch
                  //               .toString(),
                  //           remindertype: remindertype,
                  //           note: note,
                  //           dateandtime: dateAndTime,
                  //         ),
                  //       );

                  //       int parsed = int.parse(dateAndTime);

                  //       AwesomeNotifications().createNotification(
                  //           content: NotificationContent(
                  //             id: 1,
                  //             channelKey: 'basic_channel',
                  //             title: 'notification',
                  //             body: 'the body',
                  //           ),
                  //           schedule: NotificationCalendar(
                  //             minute: parsed,
                  //             year: parsed,
                  //             month: parsed,
                  //             hour: parsed,
                  //           ));

                  //       Navigator.pushReplacement(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => ReminderCardFullPage()),
                  //       );
                  //     }
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: const Color.fromRGBO(117, 67, 191, 1),
                  //     foregroundColor:
                  //         Colors.white, // Use 'black' from Colors class
                  //   ),
                  //   child: const Text('Add'),
                  // ),

                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // if (_formKey.currentState!.validate()) {
                        //                   String remindertype = _selectedremindertype ?? "";
                        //                   String note = noteController!.text;
                        //                   String dateAndTime = dateTimeController.text;

                        // Retrieve user inputs
                        String remindertype = _selectedremindertype ?? "";
                        String note = noteController!.text;
                        String dateAndTime = dateTimeController.text;
                        print('pickedtime$dateAndTime');
                        await addReminder(
                          reminderDetails: ReminderModel(
                            id: DateTime.now()
                                .microsecondsSinceEpoch
                                .toString(),
                            remindertype: remindertype,
                            note: note,
                            dateandtime: dateAndTime,
                          ),
                        );

                        // Parse the selected date and time
                        DateTime selectedDateTime =
                            DateFormat.yMd().add_jm().parse(dateAndTime);

                        // Schedule the notification
                        AwesomeNotifications().createNotification(
                          content: NotificationContent(
                            id: 1,
                            channelKey: 'basic_channel',
                            title: remindertype,
                            body: note,
                          ),
                          schedule: NotificationCalendar(
                            year: selectedDateTime.year,
                            month: selectedDateTime.month,
                            day: selectedDateTime.day,
                            hour: selectedDateTime.hour,
                            minute: selectedDateTime.minute,

                            // Optional: You can set seconds if needed
                          ),
                        );

                        // Navigate to the reminder page or do any other action
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReminderCardFullPage()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(117, 67, 191, 1),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Add'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
