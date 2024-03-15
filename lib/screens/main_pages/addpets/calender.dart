import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalenderDate extends StatefulWidget {
  final void Function(DateTime?) onDateSelected;

  const CalenderDate({
    super.key,
    required this.onDateSelected,
  });

  @override
  _CalenderDateState createState() => _CalenderDateState();
}

class _CalenderDateState extends State<CalenderDate> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: _selectedDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        );

        if (pickedDate != null) {
          setState(() {
            _selectedDate =
                DateTime(pickedDate.year, pickedDate.month, pickedDate.day);
            print(
                _selectedDate); // Create a new DateTime object with time set to midnight
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Picked date: ${DateFormat('dd/MM/yy').format(_selectedDate!)}'),
            ),
          );
          widget.onDateSelected(
              _selectedDate); // Pass selected date back to AddPets widget
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.07,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(117, 67, 191, 1),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: _selectedDate != null
            ? Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.cake, size: 28, color: Colors.red),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Text(
                        'Birth date: ${DateFormat('dd/MM/yy').format(_selectedDate!)}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              )
            : const Text(
                'BIRTH DAY ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
      ),
    );
  }
}
