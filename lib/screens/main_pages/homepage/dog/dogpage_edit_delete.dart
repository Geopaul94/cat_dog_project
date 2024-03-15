import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petapp/hive/functions/pet_function/pet_hive_function.dart';
import 'package:petapp/model/petmodel/pet/pet_model.dart';
import 'package:petapp/screens/main_pages/homepage/dog/dog_page_list.dart';

class EditDogPage extends StatefulWidget {
  int? intex;
  EditDogPage({super.key, this.intex});

  @override
  State<EditDogPage> createState() => _EditDogPageState();
}

class _EditDogPageState extends State<EditDogPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  String? _selectedGender;
  bool isSelected = false;
  String dropdownvalue = '';

  final _genderItems = ['Male', 'Female'];

  @override
  void dispose() {
    nameController.dispose();
    weightController.dispose();
    ageController.dispose();
    super.dispose();
  }

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
  void initState() {
    // TODO: implement initState
    super.initState();

    nameController.text = DogList[widget.intex!].name;
  //  ageController.text = DogList[widget.intex!].age.toString();
   // weightController.text = DogList[widget.intex!].weight.toString();
    _selectedGender = DogList[widget.intex!].gender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
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
                        print("image contianer");
                        pickImage();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: Container(
                          color: Colors.grey,
                          child: image != null
                              ? Image.file(File(
                                  image!)) // Display the selected image if available
                              : Image.file(File(DogList[widget.intex!]
                                  .image!)), // Otherwise, display the existing image
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      color: Colors.white12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Text(
                          //   DogList[widget.intex!].name,
                          //   style: const TextStyle(
                          //     fontSize: 18,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          // Text(
                          //   DogList[widget.intex!].age.toString(),
                          //   style: const TextStyle(
                          //     fontSize: 18,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),

                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10.0),

                          // Weight TextFormField
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: weightController,
                            keyboardType:
                                TextInputType.number, // Allow only numbers
                            decoration: InputDecoration(
                              labelText: 'Weight (kg)',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your weight';
                              } else {
                                try {
                                  double weight = double.parse(value);
                                  if (weight <= 0) {
                                    return 'Weight cannot be zero or negative';
                                  }
                                } catch (e) {
                                  return 'Invalid weight format';
                                }
                                return null;
                              }
                            },
                          ),
                          // Text(
                          //   DogList[widget.intex!].weight.toString(),
                          //   style: const TextStyle(
                          //     fontSize: 18,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          // Text(
                          //   DogList[widget.intex!].gender,
                          //   style: const TextStyle(
                          //     fontSize: 18,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: ageController,
                            keyboardType:
                                TextInputType.number, // Allow only numbers
                            decoration: InputDecoration(
                              labelText:
                                  '', // Remove label text as the text is in the controller
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your age';
                              } else {
                                try {
                                  int age = int.parse(value);
                                  if (age <= 0) {
                                    return 'Age cannot be zero or negative';
                                  }
                                } catch (e) {
                                  return 'Invalid age format';
                                }
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 10.0),

                          // Dropdown for Gender
                          DropdownButtonFormField<String>(
                            value: _selectedGender ??
                                DogList[widget.intex!]
                                    .gender, // Use DogList's gender if _selectedGender is null
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
                          const SizedBox(height: 10.0),
                          // ElevatedButton(
                          //   onPressed: () {
                          //     if (_formKey.currentState!.validate()) {
                          //       // Handle form submission logic here
                          //       print('Name: ${nameController.text}');
                          //       print('Weight: ${weightController.text} kg');
                          //       print('Age: ${ageController.text} years');
                          //       print('Gender: $_selectedGender');

                          //       // Assuming deletePetDataList is a function to update data
                          //       showDialog(
                          //         context: context,
                          //         builder: (BuildContext context) {
                          //           return AlertDialog(
                          //             title: const Text('Update Confirmation'),
                          //             content: const Text(
                          //                 'Are you sure you want to update this data?'),
                          //             actions: [
                          //               TextButton(
                          //                 onPressed: () async {
                          //                   await editPetDataList(
                          //                     PetModel(
                          //                       id: DogList[widget.intex!].id,
                          //                       age: DogList[widget.intex!].age,
                          //                       name: nameController.text,
                          //                       gender: _selectedGender!,
                          //                       paws: DogList[widget.intex!].paws,
                          //                       weight: double.parse(
                          //                           weightController.text),
                          //                       image: DogList[widget.intex!].image,
                          //                     ),
                          //                   );

                          //                   // setState(() {
                          //                   //   DogList = DogList;
                          //                   // });
                          //                   Navigator.of(context).pop();
                          //                   Navigator.of(context).pop();
                          //                   Navigator.pushReplacement(
                          //                       context,
                          //                       MaterialPageRoute(
                          //                           builder: (context) => DogPage()));

                          //                   final snackBar = SnackBar(
                          //                     content: Text(
                          //                       ' Data updated successfully',
                          //                       style: TextStyle(color: Colors.white),
                          //                     ),
                          //                     backgroundColor: Colors.red,
                          //                   );
                          //                   ScaffoldMessenger.of(context)
                          //                       .showSnackBar(snackBar);
                          //                 },
                          //                 child: const Text('Update'),
                          //               ),
                          //               TextButton(
                          //                 onPressed: () =>
                          //                     Navigator.of(context).pop(),
                          //                 child: const Text('Cancel'),
                          //               ),
                          //             ],
                          //           );
                          //         },
                          //       );
                          //     }
                          //   },
                          //   child: const Text('Save'),
                          // ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Clear all text fields
                                  nameController.clear();
                                  weightController.clear();
                                  ageController.clear();
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
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromRGBO(
                                      86, 72, 215, 1), // Set the button color
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // Handle form submission logic here
                                    print('Name: ${nameController.text}');
                                    print(
                                        'Weight: ${weightController.text} kg');
                                    print('Age: ${ageController.text} years');
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
                                                    id: DogList[widget.intex!]
                                                        .id,
                                                    // age: DogList[widget.intex!]
                                                    //     .age,
                                                    name: nameController.text,
                                                    gender: _selectedGender!,
                                                    paws: DogList[widget.intex!]
                                                        .paws,
                                                    // weight: double.parse(
                                                    //     weightController.text),
                                                    // image:
                                                    //     DogList[widget.intex!]
                                                    //         .image,
                                                    image: updatedImagePath ??
                                                        DogList[widget.intex!]
                                                            .image, dob: '',
                                                  ),
                                                );

                                                // setState(() {
                                                //   DogList = DogList;
                                                // });
                                                Navigator.of(context).pop();
                                                Navigator.of(context).pop();
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const DogPage()),
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
                                child: const Text('Update'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
