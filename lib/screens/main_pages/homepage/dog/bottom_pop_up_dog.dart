import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petapp/hive/functions/pet_function/pet_hive_function.dart';
import 'package:petapp/screens/main_pages/homepage/dog/dog_page_list.dart';
import 'package:petapp/screens/main_pages/homepage/dog/dogpage_edit_delete.dart';
import 'package:petapp/screens/main_pages/homepage/horizontalcard/pet_elevated_button.dart';

class BottomPopUpDog extends StatefulWidget {
  int intex;
  BottomPopUpDog({super.key, required this.intex});

  @override
  State<BottomPopUpDog> createState() => _BottomPopUpDogState();
}

class _BottomPopUpDogState extends State<BottomPopUpDog> {
  @override
  // void initState() async {

  //   super.initState();
  //   await getDogData();
  // }

  @override
  Widget build(BuildContext context) {
    print("DogList  $DogList");
    print(widget.intex);

    if (DogList.isNotEmpty) {
      print(DogList[0]);
    } else {
      print("List is empty");
    }
    return Container(
      color: Colors.blue[50],
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(
            '${DogList[widget.intex].name} details'.toString(),
            style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),

          GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: 125,
              width: 125,
              child: Expanded(
                  child: Container(
                      color: Colors.pink[50],
                      child:

                          // DogList[widget.intex!].image == null
                          //     ? const Center(child: Text("Add cat image"))
                          Image.file(File(DogList[widget.intex].image!)))),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          Row(
            children: [
              Text(
                'Name      :  ${DogList[widget.intex].name}',
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          // Row(
          //   children: [
          //     Text('Age          :   ${DogList[widget.intex!].age.toString()}'),
          //   ],
          // ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          // Row(
          //   children: [
          //     Text('Weight    :  ${DogList[widget.intex!].weight.toString()}'),
          //   ],
          // ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          Row(
            children: [
              Text("Gender    :  ${DogList[widget.intex].gender} "),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          // const Row(
          //   children: [
          //     Text("Reminder: "),
          //   ],
          // ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.015,
          // ),
          // const Row(
          //   children: [
          //     Text("Note: "),
          //   ],
          // ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.15,
          // ),

          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PetElevattedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the bottom sheet
                  },
                  icon: Icons.remove_red_eye,
                  text: "View",
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.015,
                ),
                // PetElevattedButton(
                //   onPressed: () {
                //     Navigator.pop(context); // Close the bottom sheet
                //   },
                //   icon: Icons.notification_add,
                //   text: "Reminder",
                // ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.015,
                ),
                PetElevattedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return EditDogPage(
                        intex: widget.intex,
                      );
                    }));
                  },
                  text: "Edit",
                  icon: Icons.edit,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.015,
                ),
                PetElevattedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // Return the AlertDialog
                        return AlertDialog(
                          title: const Text('Delete Confirmation'),
                          content: const Text(
                              'Are you sure you want to delete this item?'),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                // await deletePetDataList(
                                //     DogList[index].id);
                                // await deletePetDataList(
                                //     DogList[index].id);

                                await deletePetDataList(
                                    DogList[widget.intex].id,
                                    petDetails: DogList[widget.intex]);
                                print('a $DogList');
                                await getCatData();
                                await getDogData();

                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => const DogPage()));
                                const snackBar = SnackBar(
                                  content: Text(
                                    ' Deleted successfully',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              child: const Text('Delete'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icons.delete,
                  text: 'Delete',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
