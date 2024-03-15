import 'dart:io';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:petapp/hive/functions/pet_function/pet_hive_function.dart';
import 'package:petapp/screens/main_pages/bottom_navigator.dart';
import 'package:petapp/screens/main_pages/homepage/cat/bottom_pop_up_cat.dart';
import 'package:petapp/screens/main_pages/homepage/cat/catpage_edit_delete.dart';

class CatPage extends StatefulWidget {
  int? intex;
  CatPage({super.key});

  @override
  State<CatPage> createState() => _CatPageState();
}

class _CatPageState extends State<CatPage> {
  @override
  void initState() {
    super.initState();
    _loadData();
    addPetDataList(); // Call a function to load data
  }

  // Function to load data
  void _loadData() async {
    // Fetch reminder data
    await getCatData();

    // Update the UI by calling setState()
    setState(() {}); // This will trigger a rebuild of the widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Cat List",
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
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: SizedBox(
          child: Scrollbar(
            thumbVisibility: true,
            trackVisibility: true,
            thickness: 5,
            radius: const Radius.circular(10),
            interactive: true,
            child: ListView.builder(
              itemCount: CatList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
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
                                                CatList[index].id,
                                                petDetails: CatList[index]);

                                            Navigator.pop(context);

                                            setState(() {
                                              CatList = CatList;
                                            });
                                          },
                                          child: Text("Confirm")),
                                      TextButton(
                                          onPressed: () {},
                                          child: Text("Cancel"))
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
                                  builder: (context) => EditCatList(
                                    intex: index,
                                  ),
                                ));
                            //   editPetDataList(CatList[index]);

                            setState(() {
                              CatList = CatList;
                            });
                          },
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'Edit',
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        print(CatList[index].id);
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => BottomPopUpCat(
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.42,
                                  height: CatList[index].image == null
                                      ? MediaQuery.of(context).size.height *
                                          0.21
                                      : null,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: CatList[index].image == null
                                      ? const Center(
                                          child: Text("Add cat image"),
                                        )
                                      : ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15)),
                                          child: Image.file(
                                            File(CatList[index].image!),
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
                                        Text(
                                          CatList[index].name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
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
                                                        CatList[index].dob)),
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
                                        //   CatList[index].age.toString(),
                                        //   style: const TextStyle(
                                        //     fontSize: 18,
                                        //     fontWeight: FontWeight.bold,
                                        //   ),
                                        // ),

                                        Text(
                                          CatList[index].gender,
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
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
