import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petapp/screens/main_pages/dashboard/aboutus.dart';
import 'package:petapp/screens/main_pages/dashboard/editprofile.dart';
import 'package:petapp/screens/main_pages/dashboard/log_out.dart';
import 'package:petapp/screens/main_pages/dashboard/privacypolicy.dart';
import 'package:petapp/screens/main_pages/dashboard/termsandcondition.dart';
import 'package:petapp/screens/main_pages/dashboard/userprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';

String username = '';
String useremail = '';
String useraddress = '';
String userphone = '';
String userimage = '';

class DashBoard extends StatefulWidget {
  DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String? _userName;
  String? userEmail;
  String uid = '';
  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  Future<void> _getUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userEmail = user.email;
        if (user.displayName != null && user.displayName!.isNotEmpty) {
          _userName = user.displayName;
        } else {
          // If display name is null or empty, set a default value
          _userName = "User"; // You can set any default name here
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromRGBO(117, 67, 191, 1),
          elevation: 10,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Row(
            children: [
              SizedBox(width: 150),
              SizedBox(width: 8),
              Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.3,

                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("userdata")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else {
                              if (snapshot.hasData) {
                                List<QueryDocumentSnapshot> user =
                                    snapshot.data!.docs;
                                for (var u in user) {
                                  if (u["email"] ==
                                      FirebaseAuth
                                          .instance.currentUser!.email) {
                                    userimage = u['userimage'];
                                    // userimage = "";
                                  }
                                }
                                if (userimage != "") {
                                  return CircleAvatar(
                                    backgroundImage: NetworkImage(userimage),

                                    radius:
                                        70, // Adjust the color of the camera icon
                                  );
                                } else {
                                  return const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://th.bing.com/th/id/OIP.0LvP1YUJ2stgbrp2srwnFQHaHa?pid=ImgDet&w=203&h=203&c=7&dpr=1.3'),

                                    radius:
                                        70, // Adjust the color of the camera icon
                                  );
                                }
                              } else {
                                return const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://th.bing.com/th/id/OIP.0LvP1YUJ2stgbrp2srwnFQHaHa?pid=ImgDet&w=203&h=203&c=7&dpr=1.3'),

                                  radius:
                                      70, // Adjust the color of the camera icon
                                );
                              }

//                               if(snapshot.hasData){

//                                  List<QueryDocumentSnapshot> user =
//                                     snapshot.data!.docs;

//                                 for( QueryDocumentSnapshot  u in user){
//                                     if (u["email"] ==
//                                        FirebaseAuth
//                                           .instance.currentUser!.email){
//  return CircularProgressIndicator();
//                                           }else{
//                                              return CircularProgressIndicator();
//                                           }
//                                 }

//                               }else{
                              //  return const CircleAvatar(
                              //           backgroundImage: NetworkImage(
                              //               'https://th.bing.com/th/id/OIP.0LvP1YUJ2stgbrp2srwnFQHaHa?pid=ImgDet&w=203&h=203&c=7&dpr=1.3'),

                              //           radius:
                              //               70, // Adjust the color of the camera icon
                              //         );
//                               }
                            }
                          }),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ), // Add some space between the icon and text
                      StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("userdata")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else {
                            if (snapshot.hasData) {
                              List<QueryDocumentSnapshot> user =
                                  snapshot.data!.docs;

                              for (var u in user) {
                                uid = u.id;
                                if (u["email"] ==
                                    FirebaseAuth.instance.currentUser!.email) {
                                  username = u["user"];
                                  useremail = u["email"];
                                  useraddress = u["address"];
                                  userphone = u["phone"];
                                  userimage = u["userimage"];

                                  if (u["address"] == null) {
                                    print(
                                        "====================================");
                                  } else {
                                    print("+++++++++++++++++value ");
                                  }
                                }
                              }

                              return Text(
                                username ??
                                    '', // Displaying userName, if null display empty string
                                style: const TextStyle(
                                  fontSize:
                                      24, // Adjust the font size of the text
                                  fontWeight: FontWeight
                                      .bold, // Add fontWeight if desired
                                ),
                              );
                            } else {
                              return Text("no data ");
                            }
                          }
                        },
    
                      ),

                      Text(
                        userEmail ?? '',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ]),
              ),
              const Divider(),
              Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        // Specify border for the right side
                        color: Colors.black, // Choose the color of the border
                        width: 1.0, // Specify the width of the border
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      // List tile 1

                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => userProfile(
                                      uid: uid,
                                    )),
                          );
                        },
                        leading: const Icon(Icons.person),

                        title: const Center(
                            child: Text('My Profile')), // Add your text here
                        trailing: const Icon(Icons
                            .keyboard_arrow_right), // Add your arrow icon here
                      ),
                      const Divider(),
                      // List tile 2
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => editProfile(
                                      uid: uid,
                                    )),
                          );
                        },
                        leading: const Icon(
                          Icons.edit_note,
                        ),
                        // Add your image here
                        title: const Center(
                            child: Text('Edit Page')), // Add your text here
                        trailing: const Icon(Icons
                            .keyboard_arrow_right), // Add your arrow icon here
                      ),

                      const Divider(),
                      // List tile 3
                      ListTile(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return privacydialoge(
                                  mdFileName: 'privacy_policy.md');
                            },
                          );
                        },
                        leading: const Icon(Icons.policy),
                        title: const Center(
                          child: Text(
                            'Privacy Policy',
                            textAlign: TextAlign
                                .center, // Optionally, you can specify the text alignment
                          ),
                        ),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                      ),

                      const Divider(),
                      ListTile(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return termsandconditons(
                                  mdFileName: 'privacy_policy.md');
                            },
                          );
                        },
                        leading: const Icon(
                          Icons.article,
                        ),
                        // Add your image here
                        title: const Center(
                          child: Text('Terms And Condition'),
                        ), // Add your text here
                        trailing: const Icon(Icons.keyboard_arrow_right),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const AboutUs()),
                          );
                        },
                        leading: const Icon(
                          Icons.policy,
                        ),
                        // Add your image here
                        title: const Center(
                            child: Text('About Us')), // Add your text here
                        trailing: const Icon(Icons
                            .keyboard_arrow_right), // Add your arrow icon here
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomeAlertBox();
                            },
                          );
                        },
                        leading: const Icon(
                          Icons.logout,
                          size: 32,
                          color: Colors.red,
                        ),
                        // Add your image here
                        title: const Center(
                            child: Text('Logout ')), // Add your text here
                        trailing: const Icon(Icons
                            .keyboard_arrow_right), // Add your arrow icon here
                      ),
                      const Divider(),
                    ],
                  )),
            ],
          ),
        ));
  }
}
