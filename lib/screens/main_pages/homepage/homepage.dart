// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:petapp/screens/main_pages/homepage/add_button.dart';
import 'package:petapp/screens/main_pages/homepage/cat/cat_page_list.dart';
import 'package:petapp/screens/main_pages/homepage/dog/dog_page_list.dart';
import 'package:petapp/screens/main_pages/homepage/horizontalcard/finalhomelist.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "PAWS",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        backgroundColor: const Color.fromRGBO(117, 67, 191, 1),
        foregroundColor: Colors.white,
      ),
      body: const SizedBox(
        width: double.infinity, // Set width to match parent
        height: double.infinity,
        child: Column(
          children: [
            // SizedBox(height: 10),
            // Padding(
            //   padding: EdgeInsets.all(25.0),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       focusColor: Color.fromRGBO(117, 67, 191, 1),
            //       hintText: 'Search...',
            //       filled: true,
            //       fillColor: Colors.white,
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 10),
            // FinalFullList(),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: 70,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Text(
            //           'pppppp',
            //           style: TextStyle(color: Colors.amber),
            //         ),
            //       );
            //     },
            //   ),
            // )
            Expanded(child: FinalFullList())
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.list_view,
          backgroundColor: const Color.fromRGBO(117, 67, 191, 1),
          foregroundColor: Colors.white,
          openCloseDial: isDialOpen,
          overlayOpacity: 0.1,
          spacing: 25,
          spaceBetweenChildren: 25,
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
                    image: AssetImage('assets/cat11.png'),
                    fit: BoxFit.cover, // Adjust as needed
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
          ]),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
