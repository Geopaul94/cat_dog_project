import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:intl/intl.dart';

import 'package:petapp/hive/functions/pet_function/pet_hive_function.dart';

import 'package:petapp/screens/main_pages/homepage/cat/cat_page_list.dart';

import 'package:petapp/screens/main_pages/homepage/dog/dog_page_list.dart';

import 'package:petapp/screens/main_pages/homepage/horizontalcard/edit_final_petlist.dart';
import 'package:petapp/screens/main_pages/reminder_page/add_reminder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  String searchQuery = '';
  bool isSearching = false;

  @override
  void initState() {
    super.initState();

    _loadData();

    addPetDataList();
  }

  void _loadData() async {
    await getPetData();

    setState(() {
      petList = finalPetList;
    });
  }

  AppBar buildAppBar() {
    if (isSearching) {
      return AppBar(
        title: TextField(
          onChanged: (query) {
            setState(() {
              searchQuery = query;
            });
          },
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
        ),
      );
    } else {
      return AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "PAWS",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        backgroundColor: const Color.fromRGBO(117, 67, 191, 1),
        foregroundColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ValueListenableBuilder(
          valueListenable: Pets,
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: finalPetList.length,
              itemBuilder: (context, index) {
                if (!finalPetList[index].name.contains(searchQuery)) {
                  return const SizedBox.shrink();
                }
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
                                    title: const Text("Delete"),
                                    content: const Text(
                                        "Press the confirm to  delete  "),
                                    actions: [
                                      TextButton(
                                          onPressed: () async {
                                            await deletePetDataList(
                                                finalPetList[index].id,
                                                petDetails:
                                                    finalPetList[index]);

                                            Navigator.pop(context);

                                            setState(() {
                                              HomePage() = const HomePage();
                                            });
                                          },
                                          child: const Text("Confirm")),
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text("Cancel"))
                                    ]);
                              },
                            );
                          },
                          backgroundColor: Colors.red,
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
                                    index: index,
                                  ),
                                ));

                            //   editPetDataList(HomePage()[index]);

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
                                  width:
                                      MediaQuery.of(context).size.width * 0.42,
                                  height: finalPetList[index].image == null
                                      ? MediaQuery.of(context).size.height *
                                          0.21
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
                                                        finalPetList[index]
                                                            .dob)),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      86, 72, 215, 1),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

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
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  AddReminder(),
                                            ));
                                          },
                                          child: const Row(
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
                                            backgroundColor:
                                                const Color.fromRGBO(255, 117,
                                                    9, 1), // background color
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            padding: const EdgeInsets.symmetric(
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
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.search_ellipsis,
        backgroundColor: const Color.fromRGBO(117, 67, 191, 1),
        foregroundColor: Colors.white,
        openCloseDial: isDialOpen,
        overlayOpacity: 0.1,
        spacing: 25,
        spaceBetweenChildren: 20,
        children: [
          SpeedDialChild(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CatPage()),
              );
            },
            child: Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/catimages/3.jpg'),
                  fit: BoxFit.fill, // Adjust as needed
                ),
              ),
            ),
            label: 'Cat',
          ),
          SpeedDialChild(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const DogPage()),
              );
            },
            child: Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/dog smile.png'),
                  fit: BoxFit.cover, // Adjust as needed
                ),
              ),
            ),
            label: 'Dog',
          ),
          SpeedDialChild(
            onTap: () {
              setState(() {
                isSearching = true;
              });
            },
            child: Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/search.jpg'),
                  fit: BoxFit.cover, // Adjust as needed
                ),
              ),
            ),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
