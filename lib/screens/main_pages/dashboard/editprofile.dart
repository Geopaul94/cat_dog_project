import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class editProfile extends StatefulWidget {
  editProfile({
    super.key,
  });

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();

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
                      color: Color.fromRGBO(117, 67, 191, 1),
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
                      color: Color.fromRGBO(117, 67, 191, 1),
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
                padding: EdgeInsets.only(top: 15, left: 30, right: 30),
                child: Container(
                  child: Form(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: CircleAvatar(
                            backgroundImage: const NetworkImage(
                                'https://th.bing.com/th/id/OIP.0LvP1YUJ2stgbrp2srwnFQHaHa?pid=ImgDet&w=203&h=203&c=7&dpr=1.3'),
                            radius: 70,
                            child: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Pick image"),
                                        actions: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                  Icons.browse_gallery)),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.camera))
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                )),
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
                          controller: lastName,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              fillColor: Colors.grey.shade900,
                              focusColor: Colors.white,
                              filled: true,
                              hintText: '  Last Name',
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255))),
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
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(117, 67, 191, 1),
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
