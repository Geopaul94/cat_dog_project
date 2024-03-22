import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:petapp/hive/functions/pet_function/pet_hive_function.dart';

import 'package:petapp/model/petmodel/pet/pet_model.dart';
import 'package:petapp/screens/main_pages/bottom_navigator.dart';
import 'package:petapp/screens/main_pages/homepage/homepage.dart';
// ignore: unused_import
import 'package:image_picker/image_picker.dart';
import 'package:petapp/screens/main_pages/homepage/horizontalcard/finalhomelist.dart';

class AddPet extends StatefulWidget {
  const AddPet({super.key});

  @override
  State<AddPet> createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  final _focusNode = FocusNode();
  String? _selectedGender;
  bool isSelected = false;
  String dropdownvalue = '';
  String? _selectedPaws;
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  XFile? _image;

  String? image;
  bool isImageSelected = false;
  Future pickImage() async {
    try {
      _image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (_image != null) {
        setState(() {
          image = _image!.path;
          isImageSelected = true;
        });
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void onTap() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          // add the auto validation for doing the validation simultaniously
          autovalidateMode: AutovalidateMode.always,
          child: Container(
            color: Colors.green[50],
            child: Column(children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 4.0,
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: IconButton(
                        icon: const Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 25.0,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavigator(
                                        indexe: 0,
                                      )));
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 4.0,
                    color: Colors.blue,
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Add Your Pet Pal",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  pickImage();
                },
                child: _image != null
                    ? Container(
                        width: 112.0,
                        height: 112.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                          image: DecorationImage(
                            image: FileImage(File(_image!.path)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        width: 72.0,
                        height: 72.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          size: 48.0,
                          color: Colors.white,
                        ),
                      ),
              ),
              const SizedBox(height: 10),
              _image != null
                  ? const Text(' ')
                  : const Text('No image selected.'),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    shadowColor: Colors.black,
                    elevation: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(20), // Border radius
                        color: Colors.white, // Background color
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Name    :",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter your pet's name";
                                    }
                                    return null;
                                  },
                                  controller: nameController,
                                  focusNode: _focusNode,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    labelText: 'Enter your pet\'s name',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Age        :",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: TextFormField(
                                  controller: ageController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter your pet's age.";
                                    }
                                    try {
                                      final age = int.parse(value);
                                      if (age < 0) {
                                        return "Age cannot be negative.";
                                      }
                                    } catch (e) {
                                      return "Invalid age. Please enter a positive number.";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    labelText: 'Enter your pet\'s age',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Paws  ?  :",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _selectedPaws,
                                    items: ["Cat", "Dog"].map((name) {
                                      return DropdownMenuItem<String>(
                                        value: name,
                                        child: Text(
                                          name,
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedPaws = value!;
                                      });
                                    },
                                    isExpanded: true,
                                    hint: const Text(
                                      "Cat or Dog",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Weight   :",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: TextFormField(
                                  controller: weightController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the weight.';
                                    }
                                    if (double.tryParse(value) == null) {
                                      return 'Please enter a valid weight (e.g., 4.5 or 12)';
                                    }
                                    return null; // Valid input
                                  },
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^[0-9]+(\.[0-9]*)?')),
                                  ],
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    labelText: 'Enter your pet\'s weight',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Gender   :",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _selectedGender,
                                    items: ["Male", "Female"].map((name) {
                                      return DropdownMenuItem<String>(
                                        value: name,
                                        child: Text(
                                          name,
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value!;
                                      });
                                    },
                                    isExpanded: true,
                                    hint: const Text(
                                      "Choose Gender",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (!isImageSelected) {
                                // Check if image is not selected
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please select an image.'),
                                  ),
                                );
                                return;
                              }

                              if (_selectedPaws == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Please select the type of paws your pet has (Cat or Dog).'),
                                  ),
                                );
                                return;
                              }
                              if (_selectedGender == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Please select a gender for your pet.'),
                                  ),
                                );
                                return;
                              }

                              if (_formKey.currentState!.validate()) {
                                String name = nameController.text;
                                int? age = int.tryParse(ageController.text);

                                String gender = _selectedGender ?? "";

                                String paws = _selectedPaws ?? "";
                                await addPetData(
                                  petDetails: PetModel(
                                    id: DateTime.now()
                                        .microsecondsSinceEpoch
                                        .toString(),
                                    name: name,
                                    //  age: age,
                                    gender: gender,

                                    paws: paws, image: '', dob: '',
                                  ),
                                );

                                await getCatData();
                                await getDogData();

                                //clear the fields after save the data
                                setState(() {
                                  nameController.clear();
                                  ageController.clear();
                                  weightController.clear();
                                  _selectedPaws = null;
                                  _selectedGender = null;
                                  _image = null;
                                  isImageSelected = false;
                                });
                                // Navigate to the home page after saving
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue), // Set button background color
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black), // Set button text color
                            ),
                            child: const Text(
                              'Save',
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
