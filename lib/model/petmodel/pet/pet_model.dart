import 'package:hive_flutter/hive_flutter.dart';
part 'pet_model.g.dart';

@HiveType(typeId: 1)
class PetModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String paws;

  @HiveField(3)
  final String gender;
  @HiveField(4)
  final String? image;
  @HiveField(5)
  final String dob;

  PetModel(
      {required this.id,
      required this.name,
      required this.paws,
      required this.gender,
      required this.image,
      required this.dob});
  // @HiveField(6)
  // final int? age;
}
