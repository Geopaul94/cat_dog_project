import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petapp/screens/main_pages/training/cat/articles/CatFifthPage.dart';
import 'package:petapp/screens/main_pages/training/cat/articles/CatSecondpage.dart';
import 'package:petapp/screens/main_pages/training/cat/articles/CatThirdPage.dart';
import 'package:petapp/screens/main_pages/training/cat/articles/CatfirstPage.dart';
import 'package:petapp/screens/main_pages/training/cat/articles/catFifthPage.dart';

import 'package:petapp/screens/main_pages/training/dog/articles/fifthpage.dart';
import 'package:petapp/screens/main_pages/training/dog/articles/firstpage.dart';
import 'package:petapp/screens/main_pages/training/dog/articles/fourthpage.dart';
import 'package:petapp/screens/main_pages/training/dog/articles/secondpage.dart';
import 'package:petapp/screens/main_pages/training/dog/articles/thirdpage.dart';
import 'package:petapp/screens/main_pages/training/cat/catvideo.dart';
import 'package:petapp/screens/main_pages/training/dog/categorories/fleas.dart';
import 'package:petapp/screens/main_pages/training/dog/categorories/helminths.dart';
import 'package:petapp/screens/main_pages/training/dog/categorories/vaccination.dart';

import 'package:petapp/screens/main_pages/training/dog/dogvideos.dart';
import 'package:petapp/screens/main_pages/training/mypdf.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class Training extends StatefulWidget {
  const Training({Key? key});

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Padding(
            padding: EdgeInsets.only(top: 20.0), // Adjust top padding as needed
            child: Center(
              child: Text(
                "Health",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          backgroundColor: const Color.fromRGBO(229, 109, 87, 1),
          bottom: const TabBar(
            tabs: [
              DefaultTextStyle(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                child: Tab(
                  text: 'Dog',
                ),
              ),
              DefaultTextStyle(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
                child: Tab(
                  text: 'Cat',
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(left: 17, right: 15),
                  color: const Color.fromRGBO(247, 246, 251, 1),
                  child: Column(
                    children: [
                      //   Text(
                      // 'Dog Tab Content',
                      // style:
                      //     TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      //      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              15), // Adjust border radius as needed
                          border: Border.all(
                            color: Colors.grey, // Set border color here
                            width: 1, // Set border width
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const DogVideos()),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                height: MediaQuery.of(context).size.height * .2,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 222, 162),
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Column(
                                  children: [
                                    Image.network(
                                      'https://cdn-icons-png.flaticon.com/128/3900/3900369.png',
                                      scale: 1.4,
                                    ),
                                    const Text(
                                      'Trainings',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                print("ontouch the food diet");

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyPdfViewer(
                                        pdfPath:
                                            'assets/documents/Pet Diet Chart.pdf'),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                height: MediaQuery.of(context).size.height * .2,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 253, 135),
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Column(
                                  children: [
                                    Image.network(
                                      'https://cdn-icons-png.flaticon.com/128/8876/8876508.png',
                                      scale: 1.4,
                                    ),
                                    const Text(
                                      'Food Diet',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width * 0.92,
                            height: MediaQuery.of(context).size.height * .7,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  15), // Adjust the border radius as needed
                              border: Border.all(
                                color: Colors.grey[800] ??
                                    Colors
                                        .black, // Use Colors.black if Colors.grey[800] is null
                                width: 1, // Set border width
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    const Text(
                                      "Popular Articles",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize:
                                            20, // Adjust font size as needed
                                        fontWeight:
                                            FontWeight.bold, // Make text bold
                                        color: Colors.black, // Set text color
                                        // Add underline decoration
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03),
                                Flexible(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FirstPage()),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.15,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/dogimages/5.jpg'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            const Text(
                                              "What is \nvaccination ? ",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SecondPage()),
                                          );
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.15,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/dogimages/2.jpg'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            const Text(
                                              "What diseasses \ndo we vacciante   \ndogs against  ? ",
                                              textAlign: TextAlign
                                                  .start, // Align text in the center
                                              style: TextStyle(
                                                fontWeight: FontWeight
                                                    .bold, // Make text bold
                                                fontSize:
                                                    16, // Adjust font size
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    thirdpage()),
                                          );
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.15,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/dogimages/3.jpg'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            const Text(
                                              "When should  \na puppy be \nvaccinated ? ",
                                              textAlign: TextAlign
                                                  .start, // Align text in the center
                                              style: TextStyle(
                                                fontWeight: FontWeight
                                                    .bold, // Make text bold
                                                fontSize:
                                                    16, // Adjust font size
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    fourthpage()),
                                          );
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.15,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/dogimages/4.jpg'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            const Text(
                                              "Do we need to \nvacinate a dog \nthat does not ?  ",
                                              textAlign: TextAlign
                                                  .start, // Align text in the center
                                              style: TextStyle(
                                                fontWeight: FontWeight
                                                    .bold, // Make text bold
                                                fontSize:
                                                    16, // Adjust font size
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    fifthpage()),
                                          );
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.15,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/dogimages/5.jpg'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            const Text(
                                              "How do dogs get \nworms ? ",
                                              textAlign: TextAlign
                                                  .start, // Align text in the center
                                              style: TextStyle(
                                                fontWeight: FontWeight
                                                    .bold, // Make text bold
                                                fontSize:
                                                    16, // Adjust font size
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Text(
                                  "Categories",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                ),
                                Column(
                                  children: [
                                    // List tile 1

                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  vaccination()),
                                        );
                                      },
                                      leading: Image.asset(
                                          'assets/categories/vaccine.png'),

                                      title: const Text(
                                          'Vaccination'), // Add your text here
                                      trailing: const Icon(Icons
                                          .arrow_forward), // Add your arrow icon here
                                    ),
                                    const Divider(),
                                    // List tile 2
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Helminths()),
                                        );
                                      },
                                      leading: Image.asset(
                                          'assets/categories/anti-flea.png'),
                                      // Add your image here
                                      title: const Text(
                                          'Ticks and fleas protection'), // Add your text here
                                      trailing: const Icon(Icons
                                          .arrow_forward), // Add your arrow icon here
                                    ),

                                    const Divider(),
                                    // List tile 3
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => fleas()),
                                        );
                                      },
                                      leading: Image.asset(
                                          'assets/categories/worm.png'),
                                      // Add your image here
                                      title: const Text(
                                          'Helminths protection'), // Add your text here
                                      trailing: const Icon(Icons
                                          .arrow_forward), // Add your arrow icon here
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Cat Tab View

              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(left: 17, right: 15),
                  color: const Color.fromRGBO(247, 246, 251, 1),
                  child: Column(
                    children: [
                      //   Text(
                      // 'Dog Tab Content',
                      // style:
                      //     TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      //      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              15), // Adjust border radius as needed
                          border: Border.all(
                            color: Colors.grey, // Set border color here
                            width: 1, // Set border width
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                print("youtube video");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CatVideo()),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                height: MediaQuery.of(context).size.height * .2,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 222, 162),
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .12,
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      child: Image.network(
                                        'https://cdn-icons-png.flaticon.com/512/9961/9961089.png',
                                      ),
                                    ),
                                    const Text(
                                      'Trainings',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                print("ontouch the food diet");

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyPdfViewer(
                                          pdfPath:
                                              "assets/documents/Pet Diet Chart.pdf")),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                height: MediaQuery.of(context).size.height * .2,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 253, 135),
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Column(
                                  children: [
                                    Image.network(
                                      'https://cdn-icons-png.flaticon.com/128/8876/8876508.png',
                                      scale: 1.4,
                                    ),
                                    const Text(
                                      'Food Diet',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width * 0.92,
                            height: MediaQuery.of(context).size.height * .7,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  15), // Adjust the border radius as needed
                              border: Border.all(
                                color: Colors.grey[800] ??
                                    Colors
                                        .black, // Use Colors.black if Colors.grey[800] is null
                                width: 1, // Set border width
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    const Text(
                                      "Popular Articles",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize:
                                            20, // Adjust font size as needed
                                        fontWeight:
                                            FontWeight.bold, // Make text bold
                                        color: Colors.black, // Set text color
                                        // Add underline decoration
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03),
                                Flexible(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CatfirstPage()),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.15,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/catimages/1.jpg'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            const Text(
                                              "What is \nvaccination ? ",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CatSecondpage()),
                                          );
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.15,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/catimages/2.jpg'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            const Text(
                                              "What diseasses \ndo we vacciante   \ndogs against  ? ",
                                              textAlign: TextAlign
                                                  .start, // Align text in the center
                                              style: TextStyle(
                                                fontWeight: FontWeight
                                                    .bold, // Make text bold
                                                fontSize:
                                                    16, // Adjust font size
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CatThirdPage()),
                                          );
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.15,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/catimages/3.jpg'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            const Text(
                                              "When should  \na puppy be \nvaccinated ? ",
                                              textAlign: TextAlign
                                                  .start, // Align text in the center
                                              style: TextStyle(
                                                fontWeight: FontWeight
                                                    .bold, // Make text bold
                                                fontSize:
                                                    16, // Adjust font size
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CatfourthPage()),
                                          );
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.15,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/catimages/4.jpg'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            const Text(
                                              "Do we need to \nvacinate a dog \nthat does not ?  ",
                                              textAlign: TextAlign
                                                  .start, // Align text in the center
                                              style: TextStyle(
                                                fontWeight: FontWeight
                                                    .bold, // Make text bold
                                                fontSize:
                                                    16, // Adjust font size
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    catFifthPage()),
                                          );
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.15,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/catimages/5.jpg'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            const Text(
                                              "How do dogs get \nworms ? ",
                                              textAlign: TextAlign
                                                  .start, // Align text in the center
                                              style: TextStyle(
                                                fontWeight: FontWeight
                                                    .bold, // Make text bold
                                                fontSize:
                                                    16, // Adjust font size
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Text(
                                  "Categories",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                ),
                                Column(
                                  children: [
                                    // List tile 1

                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  vaccination()),
                                        );
                                      },
                                      leading: Image.asset(
                                          'assets/categories/vaccine.png'),

                                      title: const Text(
                                          'Vaccination'), // Add your text here
                                      trailing: const Icon(Icons
                                          .arrow_forward), // Add your arrow icon here
                                    ),
                                    const Divider(),
                                    // List tile 2
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => fleas()),
                                        );
                                      },
                                      leading: Image.asset(
                                          'assets/categories/anti-flea.png'),
                                      // Add your image here
                                      title: const Text(
                                          'Ticks and fleas protection'), // Add your text here
                                      trailing: const Icon(Icons
                                          .arrow_forward), // Add your arrow icon here
                                    ),

                                    const Divider(),
                                    // List tile 3
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Helminths()),
                                        );
                                      },
                                      leading: Image.asset(
                                          'assets/categories/worm.png'),
                                      // Add your image here
                                      title: const Text(
                                          'Helminths protection'), // Add your text here
                                      trailing: const Icon(Icons
                                          .arrow_forward), // Add your arrow icon here
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
