import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petapp/hive/functions/pet_function/pet_hive_function.dart';
import 'package:petapp/screens/main_pages/bottom_navigator.dart';
import 'package:petapp/screens/main_pages/homepage/dog/bottom_pop_up_dog.dart';

class DogPage extends StatefulWidget {
  const DogPage({
    super.key,
  });

  @override
  State<DogPage> createState() => _DogPageState();
}

class _DogPageState extends State<DogPage> {
  @override
  void initState() {
    super.initState();
    _loadData();
    addPetDataList(); // Call a function to load data
  }

  // Function to load data
  void _loadData() async {
    // Fetch reminder data
    await getDogData();

    // Update the UI by calling setState()
    setState(() {}); // This will trigger a rebuild of the widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Dog List",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        )),
        backgroundColor: const Color.fromRGBO(117, 67, 191, 1),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
      // body: ValueListenableBuilder(
      //   valueListenable: Pets,
      //   builder: (context, value, child) {
      //     return Container(
      //       padding: const EdgeInsets.all(10),
      //       color: Colors.white,
      //       child: SizedBox(
      //         child: Scrollbar(
      //           thumbVisibility: true,
      //           trackVisibility: true,
      //           thickness: 10,
      //           radius: const Radius.circular(10),
      //           interactive: true,
      //           child: ListView.builder(
      //             itemCount: DogList.length,
      //             itemBuilder: (context, index) {
      //               return InkWell(
      //                   onTap: () {
      //                     print(DogList[index].id);
      //                     showModalBottomSheet(
      //                       context: context,
      //                       builder: (context) => BottomPopUpDog(
      //                         intex: index,
      //                       ),
      //                     );
      //                   },
      //                   child: SizedBox(
      //                       width: MediaQuery.of(context).size.width * 0.85,
      //                       height: MediaQuery.of(context).size.height * 0.25,
      //                       child: Card(
      //                         elevation: 4,
      //                         shape: RoundedRectangleBorder(
      //                           borderRadius: BorderRadius.circular(10),
      //                         ),
      //                         color: const Color.fromRGBO(243, 244, 244, 1),
      //                         child: Padding(
      //                           padding: const EdgeInsets.all(12),
      //                           child: Row(
      //                             children: [
      //                               Container(
      //                                 width: MediaQuery.of(context).size.width *
      //                                     0.42,
      //                                 height: DogList[index].image == null
      //                                     ? MediaQuery.of(context).size.height *
      //                                         0.21
      //                                     : null,
      //                                 decoration: const BoxDecoration(
      //                                   borderRadius: BorderRadius.all(
      //                                       Radius.circular(15)),
      //                                 ),
      //                                 child: DogList[index].image == null
      //                                     ? const Center(
      //                                         child: Text("Add cat image"),
      //                                       )
      //                                     : ClipRRect(
      //                                         borderRadius: const BorderRadius
      //                                             .all(Radius.circular(
      //                                                 15)), // Same border radius as the container
      //                                         child: Image.file(
      //                                           File(DogList[index].image!),
      //                                           fit: BoxFit.cover,
      //                                         ),
      //                                       ),
      //                               ),
      //                               SizedBox(
      //                                 width: MediaQuery.of(context).size.width *
      //                                     0.075,
      //                               ),
      //                               Expanded(
      //                                 child: SizedBox(
      //                                   height: 200,
      //                                   child: Column(
      //                                     crossAxisAlignment:
      //                                         CrossAxisAlignment.start,
      //                                     children: [
      //                                       Text(
      //                                         DogList[index].name,
      //                                         style: const TextStyle(
      //                                           fontWeight: FontWeight.bold,
      //                                           fontSize: 24,
      //                                         ),
      //                                       ),
      //                                       const SizedBox(
      //                                         height: 8,
      //                                       ),
      //                                       Container(
      //                                         padding: const EdgeInsets.all(5),
      //                                         decoration: const BoxDecoration(
      //                                           color: Color.fromARGB(
      //                                               255, 204, 199, 240),
      //                                           borderRadius: BorderRadius.all(
      //                                               Radius.circular(8)),
      //                                         ),
      //                                         child: Row(
      //                                           children: [
      //                                             const Icon(
      //                                               Icons.cake_rounded,
      //                                               color: Color.fromRGBO(
      //                                                   86, 72, 215, 1),
      //                                               size: 14.0,
      //                                             ),
      //                                             const SizedBox(width: 5.0),
      //                                             Text(
      //                                               DateFormat('dd-MM-yyyy')
      //                                                   .format(DateTime.parse(
      //                                                       DogList[index]
      //                                                           .dob)),
      //                                               style: const TextStyle(
      //                                                 fontWeight:
      //                                                     FontWeight.bold,
      //                                                 color: Color.fromRGBO(
      //                                                     86, 72, 215, 1),
      //                                               ),
      //                                             ),
      //                                           ],
      //                                         ),
      //                                       ),
      //                                       // Text(
      //                                       //   DogList[index].age.toString(),
      //                                       //   style: const TextStyle(
      //                                       //     fontSize: 18,
      //                                       //     fontWeight: FontWeight.bold,
      //                                       //   ),
      //                                       // ),

      //                                       Text(
      //                                         DogList[index].gender,
      //                                         style: const TextStyle(
      //                                           fontSize: 18,
      //                                           fontWeight: FontWeight.bold,
      //                                         ),
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                       )));
      //             },
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),

      body: ValueListenableBuilder(
        valueListenable: Pets,
        builder: (context, value, child) {
          if (DogList.isEmpty) {
            // If the dog list is empty, display a message
            return Center(
              child: Text(
                'No dog data available',
                style: TextStyle(fontSize: 18),
              ),
            );
          } else {
            // If the dog list is not empty, display the list of dogs
            return Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: SizedBox(
                child: Scrollbar(
                  thumbVisibility: true,
                  trackVisibility: true,
                  thickness: 10,
                  radius: const Radius.circular(10),
                  interactive: true,
                  child: ListView.builder(
                    itemCount: DogList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          print(DogList[index].id);
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => BottomPopUpDog(
                              intex: index,
                            ),
                          );
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: const Color.fromRGBO(243, 244, 244, 1),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.42,
                                    height: DogList[index].image == null
                                        ? MediaQuery.of(context).size.height *
                                            0.21
                                        : null,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: DogList[index].image == null
                                        ? const Center(
                                            child: Text("Add dog image"),
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(15),
                                            ), // Same border radius as the container
                                            child: Image.file(
                                              File(DogList[index].image!),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.075,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 200,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            DogList[index].name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 204, 199, 240),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.cake_rounded,
                                                  color: Color.fromRGBO(
                                                      86, 72, 215, 1),
                                                  size: 14.0,
                                                ),
                                                const SizedBox(width: 5.0),
                                                Text(
                                                  DateFormat('dd-MM-yyyy')
                                                      .format(DateTime.parse(
                                                          DogList[index].dob)),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromRGBO(
                                                        86, 72, 215, 1),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            DogList[index].gender,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
