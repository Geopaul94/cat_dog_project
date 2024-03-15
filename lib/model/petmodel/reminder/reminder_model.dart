import 'package:hive_flutter/hive_flutter.dart';
part 'reminder_model.g.dart';

@HiveType(typeId: 2)
class ReminderModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String remindertype;
  @HiveField(2)
  final String? note;
  @HiveField(3)
  final String dateandtime;

  ReminderModel(
      {required this.id,
      required this.remindertype,
      required this.note,
      required this.dateandtime});
}
