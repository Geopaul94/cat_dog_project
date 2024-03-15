import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petapp/hive/functions/pet_function/pet_hive_function.dart';
import 'package:petapp/screens/main_pages/homepage/cat/cat_page_list.dart';
import 'package:petapp/screens/main_pages/homepage/cat/catpage_edit_delete.dart';
import 'package:petapp/screens/main_pages/homepage/horizontalcard/pet_elevated_button.dart';

class BottomPopUpCat extends StatefulWidget {
  int? intex;
  BottomPopUpCat({super.key, this.intex});

  @override
  State<BottomPopUpCat> createState() => BottomPopUpState();
}

class BottomPopUpState extends State<BottomPopUpCat> {
  @override
  Widget build(BuildContext context) {
    print("CatList  in pop up page  $CatList");
    print("popup page catlist   $widget.intex");
    if (CatList.isNotEmpty) {
      print(CatList[0]);
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
            '${CatList[widget.intex!].name} details',
            style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),

          SizedBox(
            height: 125,
            width: 125,
            child: Expanded(
                child: Container(
                    color: Colors.pink[50],
                    child:

                        // CatList[widget.intex!].image == null
                        //     ? const Center(child: Text("Add cat image"))
                        Image.file(File(CatList[widget.intex!].image!)))),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          Row(
            children: [
              Text(
                'Name      :  ${CatList[widget.intex!].name}',
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          // Row(
          //   children: [
          //     Text('Age          :   ${CatList[widget.intex!].age.toString()}'),
          //   ],
          // ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          // Row(
          //   children: [
          //     Text('Weight    :  ${CatList[widget.intex!].weight.toString()}'),
          //   ],
          // ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          Row(
            children: [
              Text("Gender    :  ${CatList[widget.intex!].gender} "),
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

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.040,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PetElevattedButton(
                  index: widget.intex!,
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
                //   index: widget.intex!,
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
                  index: widget.intex!,
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return EditCatList(
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
                  index: widget.intex!,
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
                                await deletePetDataList(
                                    CatList[widget.intex!].id,
                                    petDetails: CatList[widget.intex!]);

                                print('a $CatList');
                                await getCatData();
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => CatPage()));
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
                                // Close the dialog
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
