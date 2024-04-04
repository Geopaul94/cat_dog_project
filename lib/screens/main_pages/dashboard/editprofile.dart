import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:petapp/screens/main_pages/bottom_navigator.dart';
import 'package:petapp/screens/main_pages/dashboard/dashboard.dart';
import 'package:petapp/screens/main_pages/dashboard/userprofile.dart';

String? imagelink;

class editProfile extends StatefulWidget {
  String uid;

  editProfile({
    required this.uid,
    super.key,
  });

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  TextEditingController firstName = TextEditingController();

  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  File? pickedImage; // Store the picked image

  final picker = ImagePicker();

  @override
  void initState() {
    firstName.text = username;
    address.text = useraddress;
    phone.text = userphone;

    super.initState();
  }

  Future<void> _getFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        pickedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              // SizedBox(height: 30,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Hero(
                    tag: kBackBtn,
                    child: Card(
                      color: const Color.fromRGBO(117, 67, 191, 1),
                      elevation: 10,
                      shape: kBackButtonShape,
                      child: MaterialButton(
                        height: 50,
                        minWidth: 50,
                        elevation: 10,
                        shape: kBackButtonShape,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: kBackBtn,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 50,
                  // ),
                  Hero(
                    tag: 'title',
                    transitionOnUserGestures: true,
                    child: Card(
                      color: const Color.fromRGBO(117, 67, 191, 1),
                      elevation: 10,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      child: InkWell(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 50,
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  // color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
                child: Container(
                  child: Form(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: CircleAvatar(
                            backgroundImage: pickedImage == null
                                ? const NetworkImage(
                                        'https://th.bing.com/th/id/OIP.0LvP1YUJ2stgbrp2srwnFQHaHa?pid=ImgDet&w=203&h=203&c=7&dpr=1.3')
                                    as ImageProvider
                                : FileImage(pickedImage!),
                            radius: 70,
                            child: IconButton(
                              onPressed: _getFromGallery,
                              icon: const Icon(
                                Icons.add_a_photo,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: firstName,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    fillColor: Colors.grey.shade900,
                                    focusColor: Colors.white,
                                    filled: true,
                                    hintText: '  First Name',
                                    hintStyle: const TextStyle(
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          controller: address,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              fillColor: Colors.grey.shade900,
                              focusColor: Colors.white,
                              filled: true,
                              hintText: '  Address',
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255))),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          controller: phone,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              fillColor: Colors.grey.shade900,
                              focusColor: Colors.white,
                              filled: true,
                              hintText: '  Phone',
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255))),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (pickedImage != null) {
                              Reference upload =
                                  FirebaseStorage.instance.ref().child("edit");
                              Reference reupload =
                                  upload.child(pickedImage!.path);

                              try {
                                await reupload.putFile(File(pickedImage!.path));
                                imagelink = await reupload.getDownloadURL();
                              } catch (e) {
                                print("------------$e");
                              }
                            }
                            await FirebaseFirestore.instance
                                .collection("userdata")
                                .doc(widget.uid)
                                .update({
                              "user": firstName.text,
                              "phone": phone.text,
                              "address": address.text,
                              "userimage": imagelink ?? "false"
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavigator(indexe: 4,)),
                            );
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(117, 67, 191, 1),
                          )),
                          child: const Text(
                            'Save Changes',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
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

ShapeBorder kBackButtonShape = const RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(30),
  ),
);

Widget kBackBtn = const Icon(
  Icons.arrow_back_ios,
  color: Colors.white,
);
