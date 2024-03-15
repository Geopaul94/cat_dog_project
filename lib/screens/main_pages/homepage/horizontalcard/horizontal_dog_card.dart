import 'dart:io';

import 'package:flutter/material.dart';

import 'package:petapp/hive/functions/pet_function/pet_hive_function.dart';

class HorizontalDogCard extends StatefulWidget {
  const HorizontalDogCard({
    super.key,
  });

  @override
  State<HorizontalDogCard> createState() => _HorizontalDogCardState();
}

class _HorizontalDogCardState extends State<HorizontalDogCard> {
  @override
  void initState() {
    //  getDogData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      width: 400,
      child: ValueListenableBuilder(
        valueListenable: Pets,
        builder: (context, value, child) {
          return ListView.builder(
            // shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: DogList.length,
            itemBuilder: (context, index) {
              return Row(children: [
                // SizedBox(
                //   height: 200,
                //   width: 175,
                //   child: Container(
                //     color: Color.fromARGB(179, 217, 215, 215),
                //     child: CatList[index].image == null
                //         ? const Center(
                //             child: Text("Add cat image"),
                //           )
                //         : Image.file(
                //             File(CatList[index].image!),
                //           ),
                //   ),
                // ),
                SizedBox(
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
                            width: MediaQuery.of(context).size.width * 0.42,
                            height: DogList[index].image == null
                                ? MediaQuery.of(context).size.height * 0.21
                                : null,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: DogList[index].image == null
                                ? const Center(
                                    child: Text("Add Dog image"),
                                  )
                                : ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                            15)), // Same border radius as the container
                                    child: Image.file(
                                      File(CatList[index].image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.075,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    DogList[index].name,
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
                                      color: Color.fromARGB(255, 204, 199, 240),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.cake_rounded,
                                          color: Color.fromRGBO(86, 72, 215, 1),
                                          size: 14.0,
                                        ),
                                        const SizedBox(width: 5.0),
                                        Text(
                                          DogList[index].dob.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(86, 72, 215, 1),
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
              ]);
            },
          );
        },
      ),
    );
  }
}
