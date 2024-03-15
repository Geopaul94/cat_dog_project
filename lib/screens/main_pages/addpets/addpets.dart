import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petapp/hive/functions/pet_function/pet_hive_function.dart';
import 'package:petapp/model/petmodel/pet/pet_model.dart';
import 'package:petapp/screens/main_pages/addpets/calender.dart';
import 'package:petapp/screens/main_pages/addpets/camerapage.dart';
import 'package:petapp/screens/main_pages/addpets/genderbox.dart';
import 'package:petapp/screens/main_pages/addpets/petbox.dart';
import 'package:petapp/screens/main_pages/bottom_navigator.dart';

class AddPets extends StatefulWidget {
  const AddPets({super.key});

  @override
  State<AddPets> createState() => _AddPetsState();
}

class _AddPetsState extends State<AddPets> {
  @override
  void initState() {
    super.initState();
  }

  String? _selectedGender;
  String _selectedPet = '';
  DateTime? _selectedDate;
 // final TextEditingController _ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  bool isSelected = false;
  XFile? _image;

  String? image;
  bool isImageSelected = false;
  // Future pickImage() async {
  //   try {
  //     _image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (_image != null) {
  //       setState(() {
  //         image = _image!.path;
  //         isImageSelected = true;
  //       });
  //     }
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image: $e');
  //   }
  // }

  void onTap() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Add Pet",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          backgroundColor: const Color.fromRGBO(117, 67, 191, 1),
          foregroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomNavigator(
                            indexe: 0,
                          )),
                );
              },
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                // Handle settings action
              },
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              child: Form(
                key: _formKey,
                // add the auto validation for doing the validation simultaniously
                autovalidateMode: AutovalidateMode.always,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.020,
                      ),
                      CameraPage(
                        onImageSelected: _handleImageSelected,
                      ),

                      // InkWell(
                      //   onTap: () async {
                      //     final pickedFile = await ImagePicker()
                      //         .pickImage(source: ImageSource.gallery);
                      //     if (pickedFile != null) {
                      //       // Do something with the picked file
                      //       setState(() {
                      //         image = pickedFile.path;
                      //       });
                      //     }
                      //   },
                      //   child: Container(
                      //     width: MediaQuery.of(context).size.width * 0.42,
                      //     height: MediaQuery.of(context).size.height * 0.21,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.all(Radius.circular(15)),
                      //       color: Colors.grey[300],
                      //     ),
                      //     child: image != null
                      //         ? ClipRRect(
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(15.0)),
                      //             child: Container(
                      //               width: MediaQuery.of(context).size.width *
                      //                   0.42,
                      //               height: MediaQuery.of(context).size.height *
                      //                   0.21,
                      //               child: Image.file(
                      //                 File(image!),
                      //                 fit: BoxFit.cover,
                      //               ),
                      //             ),
                      //           )
                      //         : Container(
                      //             padding: EdgeInsets.all(40),
                      //             child: LottieBuilder.asset(
                      //               'assets/camera(1).json',
                      //               height: MediaQuery.of(context).size.height *
                      //                   0.12,
                      //               width:
                      //                   MediaQuery.of(context).size.width * .25,
                      //             ),
                      //           ),
                      //   ),
                      // ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.020,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your pet's name";
                          }
                          return null;
                        },
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: const TextStyle(color: Colors.grey),
                          hintText: "Enter pet's name",
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(86, 72, 215, 1),
                                width: 2.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Gender",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            children: [
                              GenderBox(
                                gender: 'Male',
                                icon: Icons.male,
                                isSelected: _selectedGender == 'Male',
                                onTap: () {
                                  setState(() {
                                    _selectedGender = 'Male';
                                  });
                                },
                                onGenderSelected: (selectedGender) {
                                  if (selectedGender.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Please select a gender')),
                                    );
                                  } else {
                                    // Gender selected, proceed (e.g., store the value)
                                    // ...
                                  }
                                },
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.025),
                              GenderBox(
                                gender: 'Female',
                                icon: Icons.female,
                                isSelected: _selectedGender == 'Female',
                                onTap: () {
                                  setState(() {
                                    _selectedGender = 'Female';
                                  });
                                },
                                onGenderSelected: (selectedGender) => setState(
                                    () => _selectedGender = selectedGender),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      CalenderDate(
                        onDateSelected: (date) {
                          setState(() {
                            _selectedDate = date;
                            print(_selectedDate);
                          });
                        },
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child: Text(
                                'Paws',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                PetBox(
                                  petType: 'Cat',
                                  lottiePath: 'assets/cat.json',
                                  isSelected: _selectedPet == 'Cat',
                                  onTap: () {
                                    setState(() {
                                      _selectedPet = 'Cat';
                                    });
                                  },
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.025),
                                PetBox(
                                  petType: 'Dog',
                                  lottiePath: 'assets/dog.json',
                                  isSelected: _selectedPet == 'Dog',
                                  onTap: () {
                                    setState(() {
                                      _selectedPet = 'Dog';
                                    });
                                  },
                                ),
                              ],
                            ),
                          ]),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.075,
                        child: ElevatedButton(
                          onPressed: () async {
                            // Validate form fields
                            if (!_formKey.currentState!.validate()) {
                              // If form is not valid, return without navigating
                              return;
                            }

                            // Ensure that an image is selected
                            if (isImageSelected == Null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please select an image')),
                              );
                              return;
                            }

                            // Ensure that a pet is selected
                            if (_selectedPet.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Please select a pet (Cat or Dog)')),
                              );
                              return;
                            }

                            if (_selectedDate == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Please select your birth date')),
                              );
                              return;
                            }

                            String name = nameController.text;
                            String gender = _selectedGender ?? "";
                            String paws = _selectedPet;
                            String dob = _selectedDate.toString();
                            String imagePath = _image!.path;
                            // Add pet data
                            await addPetData(
                              petDetails: PetModel(
                                id: DateTime.now()
                                    .microsecondsSinceEpoch
                                    .toString(),
                                name: name,
                                gender: gender,
                                paws: paws,
                                dob: dob,
                                image: imagePath,
                              ),
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavigator(
                                        indexe: 0,
                                      )),
                            );
                            // } catch (e) {
                            //   print('Error navigating to home page: $e');
                            //   // Handle error gracefully, e.g., show error message to user
                            // }
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100, 50),
                              backgroundColor:
                                  const Color.fromRGBO(117, 67, 191, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.check, color: Colors.white),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              const Text('Save',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  void _handleImageSelected(String imagePath) {
    setState(() {
      _image = XFile(imagePath);
    });
  }
}
