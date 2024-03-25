import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:petapp/model/petmodel/pet/pet_model.dart';

const String petData = 'PetData';
ValueNotifier<String> Pets = ValueNotifier("Pet");
List<String> nameofPets = [];

List<PetModel> finalPetList = [];
List<PetModel> petList = [];
// ignore: non_constant_identifier_names
List<PetModel> CatList = [];
// ValueNotifier<List<PetModel>> CatList = ValueNotifier([]);
// ignore: non_constant_identifier_names
List<PetModel> DogList = [];
Future<void> addPetData({required PetModel petDetails}) async {
  try {
    final box = await Hive.openBox<PetModel>(petData);
    await box.put(petDetails.id, petDetails);
    // await addPetDataList();
    print('s');
    if (kDebugMode) {
      print('Data added successfully.');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error adding data: $e');
    }
  }
}

Future<List<PetModel>> getPetData() async {
  final box = await Hive.openBox<PetModel>(
      petData); // Use correct type for opening the box
  if (kDebugMode) {
    print(box.values);
  }
  return box.values.toList();
}

Future<void> addPetDataList() async {
  finalPetList.clear();
  final data = await getPetData();
  finalPetList.addAll(data);

  // Populate the list of pet names
  nameofPets.clear();
  for (var pet in finalPetList) {
    nameofPets.add(
        pet.name); // Assuming 'name' is the property that holds the pet's name
  }
}

Future<List<String>> getPetNames() async {
  // Ensure that the list of pet names is populated
  await addPetDataList();
  return nameofPets;
}

Future<List<PetModel>> getCatData() async {
  CatList.clear();
  print('kj');
  final box = await Hive.openBox<PetModel>(petData);
  final List<PetModel> allPets = box.values.toList();
  var a = allPets.where((pet) => pet.paws == 'Cat').toList();
  for (var b in a) {
    print(b);
  }

  // CatList.clear();
  CatList = a;
  if (CatList.isNotEmpty) {
    print(CatList[0]);
  } else {
    print(" cat List is empty");
  }
  print(a);
  return a;
}

Future<List<PetModel>> getDogData() async {
  DogList.clear();
  print('kkkkkkkkkkkkkkkkkkj');
  final box = await Hive.openBox<PetModel>(petData);
  final List<PetModel> allPets = box.values.toList();
  var a = allPets.where((pet) => pet.paws == 'Dog').toList();

  DogList = a;
  if (DogList.isNotEmpty) {
    print(DogList[0]);
  } else {
    print("dog List is empty checking in function");
  }
  return a;
}

Future<void> deletePetDataList(String id,
    {required PetModel petDetails}) async {
  final box = await Hive.openBox<PetModel>(petData);
  await box.delete(petDetails.id);
  await addPetDataList();

  await getCatData();
  await getDogData();

  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  Pets.notifyListeners();
}

Future<void> editPetDataList(PetModel petDetails) async {
  final box = await Hive.openBox<PetModel>(petData);
  await box.put(petDetails.id, petDetails);
  await addPetDataList();
  await getCatData();
  await getDogData();
  Pets.notifyListeners();
}
