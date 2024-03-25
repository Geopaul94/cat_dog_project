import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:petapp/hive/functions/pet_function/pet_hive_function.dart';
import 'package:petapp/model/petmodel/pet/pet_model.dart';
import 'package:petapp/screens/main_pages/addpets/calender.dart';
import 'package:petapp/screens/main_pages/bottom_navigator.dart';
import 'package:petapp/screens/main_pages/homepage/cat/bottom_pop_up_cat.dart';
import 'package:petapp/screens/main_pages/homepage/cat/catpage_edit_delete.dart';
import 'package:intl/intl.dart';

class EditFinalFullLidt extends StatefulWidget {
  final int? intex;
  final int? index;

  final String? dob;

  EditFinalFullLidt({this.intex, this.dob, this.index});

  @override
  State<EditFinalFullLidt> createState() => _EditFinalFullLidtState();
}

class _EditFinalFullLidtState extends State<EditFinalFullLidt> {
  @override
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  String? formattedDate;
  String? _selectedGender;
  bool isSelected = false;
  String dropdownvalue = '';
  String? _selectedDate;
  final _genderItems = ['Male', 'Female'];

  @override
  void dispose() {
    nameController.dispose();

    super.dispose();
  }

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
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = finalPetList[widget.intex!].name;
    // _selectedDate = widget.dob;
    _selectedGender = finalPetList[widget.intex!].gender;
    _selectedDate = finalPetList[widget.intex!].dob;
    DateTime dateTime = DateTime.parse(_selectedDate!);
    formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

    print('hell');
    print(_selectedGender);
    print(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,

                // Set the color to grey
              ),
              iconSize: 40,
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavigator(indexe: 0),
                    ));
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width * 0.92,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: InkWell(
                      onTap: () {
                        // Call the pickImage function when the container is tapped
                        pickImage();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: Container(
                          color: Colors.grey,
                          child: image != null
                              ? Image.file(
                                  File(image!),
                                  fit: BoxFit
                                      .cover, // Make the image cover the container
                                )
                              : Image.file(
                                  File(finalPetList[widget.intex!].image!),
                                  fit: BoxFit
                                      .cover, // Make the image cover the container
                                ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      color: Colors.white12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: 'Pet name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '''Please enter your pet's name''';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30.0),

                          CalenderDate(
                            labels: 'Birth date:$formattedDate',
                            onDateSelected: (date) {
                              setState(() {
                                _selectedDate = date.toString();
                                print(_selectedDate);
                              });
                            },
                          ),

                          const SizedBox(height: 30.0),

                          // Dropdown for Gender
                          DropdownButtonFormField<String>(
                            value: _selectedGender ??
                                finalPetList[widget.intex!]
                                    .gender, // Use finalPetList's gender if _selectedGender is null
                            hint: const Text('Select Gender'),
                            items: _genderItems
                                .map((gender) => DropdownMenuItem(
                                      value: gender,
                                      child: Text(gender),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedGender =
                                    value!; // Handle potential null value
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Gender',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select your gender';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 30.0),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Clear text fields
                                  nameController.clear();

                                  setState(() {
                                    _selectedGender = null;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text('Clear'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // Handle form submission logic here
                                    print('Name: ${nameController.text}');

                                    //   print('Age: ${ageController.text} years');
                                    print('Gender: $_selectedGender');
                                    String? updatedImagePath = _image?.path;
                                    // Assuming deletePetDataList is a function to update data
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title:
                                              const Text('Update Confirmation'),
                                          content: const Text(
                                              'Are you sure you want to update this data?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () async {
                                                await editPetDataList(
                                                  PetModel(
                                                    id: finalPetList[
                                                            widget.intex!]
                                                        .id,
                                                    //  age: finalPetList[widget.intex!].age,
                                                    name: nameController.text,
                                                    gender: _selectedGender!,
                                                    dob: _selectedDate!,
                                                    paws: finalPetList[
                                                            widget.intex!]
                                                        .paws,
                                                    // weight: double.parse(
                                                    //     weightController.text),
                                                    // image: finalPetList[widget.intex!]
                                                    //     .image,
                                                    image: updatedImagePath ??
                                                        finalPetList[
                                                                widget.intex!]
                                                            .image,
                                                  ),
                                                );

                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          BottomNavigator(
                                                              indexe: 0)),
                                                  (route) =>
                                                      false, // This will remove all existing routes from the stack
                                                );

                                                const snackBar = SnackBar(
                                                  content: Text(
                                                    ' Data updated successfully',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  backgroundColor: Colors.red,
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              },
                                              child: const Text('Update'),
                                            ),
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                              child: const Text('Cancel'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text('Save'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        )));
  }
}
