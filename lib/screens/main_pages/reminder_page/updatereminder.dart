import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petapp/hive/functions/reminder_function/reminder_functions.dart';
import 'package:petapp/model/petmodel/reminder/reminder_model.dart';

import 'package:petapp/screens/main_pages/reminder_page/reminder_card_full_page.dart';
import 'package:petapp/screens/widget_refractoring/customappbar .dart';

class UpdateReminder extends StatefulWidget {
  int reminder;
  UpdateReminder({super.key, required this.reminder});

  @override
  State<UpdateReminder> createState() => _UpdateReminderState();
}

class _UpdateReminderState extends State<UpdateReminder> {
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
  void initState() {
// _selectedremindertype.text = widget.reminder.remindertype;
    noteController?.text = finalReminderList[widget.reminder].note!;
    dateTimeController.text = finalReminderList[widget.reminder].dateandtime;

    super.initState();
  }

  @override
  void dispose() {
    dateTimeController.dispose();
    noteController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.green[50],
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              const CustomAppBar(
                text: "Update Reminder",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                child: const Text(
                  """Update Your 
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
                          errorStyle: TextStyle(
                              color: Color.fromRGBO(229, 109, 87, 1)),
                          border: InputBorder.none,
                          hintText: '     Reminder Note',
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
                      foregroundColor: Colors.white,
                    ), // Use 'black' from Colors class

                    child: const Text('Clear'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Get the new values from the text controllers
                        String newDateTime = dateTimeController.text;
                        String newNote = noteController!.text;
                        String? newReminderType = _selectedremindertype;

                        ReminderModel updatedReminder = ReminderModel(
                          id: finalReminderList[widget.reminder].id,
                          // remindertype:
                          //     finalReminderList[widget.reminder].remindertype,
                          remindertype: newReminderType ??
                              finalReminderList[widget.reminder].remindertype,
                          note: newNote,
                          dateandtime: newDateTime,
                        );

                        await editreminderDataList(
                            widget.reminder, updatedReminder);

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Update Confirmation'),
                              content: const Text(
                                  'Are you sure you want to update this data?'),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    await editreminderDataList(
                                        widget.reminder,
                                        ReminderModel(
                                          id: finalReminderList[widget.reminder]
                                              .id,
                                          remindertype:
                                              finalReminderList[widget.reminder]
                                                  .remindertype,
                                          note:
                                              finalReminderList[widget.reminder]
                                                  .note,
                                          dateandtime:
                                              finalReminderList[widget.reminder]
                                                  .dateandtime,
                                        ));

                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return const ReminderCardFullPage();
                                      }),
                                    );
                                    dateTimeController.clear();
                                    noteController!.clear();
                                    print("reminder ");
                                    const snackBar = SnackBar(
                                      content: Text(
                                        'Data updated successfully',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: Colors.red,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                  child: const Text('Update'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('Cancel'),
                                ),
                              ],
                            );
                          },
                        );
                        dateTimeController.clear();
                        noteController!.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(117, 67, 191, 1),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Update',
                    ),
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
