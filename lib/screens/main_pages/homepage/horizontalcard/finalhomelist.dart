import 'dart:io';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:petapp/hive/functions/pet_function/pet_hive_function.dart';
import 'package:petapp/screens/main_pages/homepage/cat/bottom_pop_up_cat.dart';
import 'package:petapp/screens/main_pages/homepage/cat/catpage_edit_delete.dart';
import 'package:petapp/screens/main_pages/homepage/horizontalcard/edit_final_petlist.dart';

class FinalFullList extends StatefulWidget {
  const FinalFullList({super.key});

  @override
  State<FinalFullList> createState() => _FinalFullListState();
}

class _FinalFullListState extends State<FinalFullList> {
  @override
  void initState() {
    super.initState();
    _loadData();
    addPetDataList(); // Call a function to load data
  }

  // Function to load data
  void _loadData() async {
    // Fetch reminder data
    await getPetData();

    // Update the UI by calling setState()
    setState(() {}); // This will trigger a rebuild of the widget
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ValueListenableBuilder(
        valueListenable: Pets,
        builder: (context, value, child) {
          return ListView.builder(
            // shrinkWrap: true,

            itemCount: finalPetList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(0.0),
                child: Slidable(
                  key: const ValueKey(0),
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        flex: 1,
                        onPressed: (value) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  title: Text("Delete"),
                                  content:
                                      Text("Press the confirm to  delete  "),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          await deletePetDataList(
                                              finalPetList[index].id,
                                              petDetails: finalPetList[index]);

                                          Navigator.pop(context);

                                          setState(() {
                                            FinalFullList() = FinalFullList();
                                          });
                                        },
                                        child: Text("Confirm")),
                                    TextButton(
                                        onPressed: () {}, child: Text("Cancel"))
                                  ]);
                            },
                          );
                        },
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                      SlidableAction(
                        onPressed: (value) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditFinalFullLidt(
                                  intex: index,
                                ),
                              ));
                          //   editPetDataList(FinalFullList()[index]);

                          setState(() {
                            finalPetList = finalPetList;
                          });
                        },
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Edit',
                      ),
                    ],
                  ),
                  child: Row(children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width * 1.0,
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
                                width: MediaQuery.of(context).size.width * 0.42,
                                height: finalPetList[index].image == null
                                    ? MediaQuery.of(context).size.height * 0.21
                                    : null,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: finalPetList[index].image == null
                                    ? const Center(
                                        child: Text("Add cat image"),
                                      )
                                    : ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                                15)), // Same border radius as the container
                                        child: Image.file(
                                          File(finalPetList[index].image!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.075,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // SizedBox(
                                      //   height: 5,
                                      // ),
                                      Text(
                                        finalPetList[index].name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 204, 199, 240),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
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
                                              DateFormat('dd-MM-yyyy').format(
                                                  DateTime.parse(
                                                      finalPetList[index].dob)),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    86, 72, 215, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Text(
                                      //   finalPetList[index].age.toString(),
                                      //   style: const TextStyle(
                                      //     fontSize: 18,
                                      //     fontWeight: FontWeight.bold,
                                      //   ),
                                      // ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        finalPetList[index].gender,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Row(
                                          children: [
                                            Icon(Icons.add,
                                                color: Colors.white),
                                            SizedBox(width: 3),
                                            Text("Add Record",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromRGBO(255,
                                              117, 9, 1), // background color
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 10),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
