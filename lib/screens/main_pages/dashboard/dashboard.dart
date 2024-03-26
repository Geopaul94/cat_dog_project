import 'package:flutter/material.dart';
import 'package:petapp/screens/main_pages/dashboard/aboutus.dart';
import 'package:petapp/screens/main_pages/dashboard/editprofile.dart';
import 'package:petapp/screens/main_pages/dashboard/log_out.dart';
import 'package:petapp/screens/main_pages/dashboard/privacypolicy.dart';
import 'package:petapp/screens/main_pages/dashboard/termsandcondition.dart';
import 'package:petapp/screens/main_pages/dashboard/userprofile.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromRGBO(117, 67, 191, 1),
          elevation: 10,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Row(
            children: const [
              SizedBox(width: 150),
              SizedBox(width: 8), // Adjust the spacing as needed
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
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.3,
                //
                //ad color: Colors.amber,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: const NetworkImage(
                          'https://th.bing.com/th/id/OIP.0LvP1YUJ2stgbrp2srwnFQHaHa?pid=ImgDet&w=203&h=203&c=7&dpr=1.3'),
                      radius: 70, // Adjust the color of the camera icon
                    ),
                    SizedBox(
                        height: 20), // Add some space between the icon and text
                    Text(
                      "Husky",
                      style: TextStyle(
                        fontSize: 24, // Adjust the font size of the text
                        fontWeight:
                            FontWeight.bold, // Add fontWeight if desired
                      ),
                    ),
                    Text(
                      "husky@gmail.com",
                      style: TextStyle(
                        fontSize: 20, // Adjust the font size of the text
                        // Add any other text styles as needed
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                  // width: MediaQuery.of(context).size.width * .85,
                  // height: MediaQuery.of(context).size.height * .75,
                  decoration: BoxDecoration(
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
                                builder: (context) => userProfile()),
                          );
                        },
                        leading: Icon(Icons.person),

                        title: Center(
                            child:
                                const Text('My Profile')), // Add your text here
                        trailing: const Icon(Icons
                            .keyboard_arrow_right), // Add your arrow icon here
                      ),
                      const Divider(),
                      // List tile 2
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => editProfile()),
                          );
                        },
                        leading: Icon(
                          Icons.edit_note,
                        ),
                        // Add your image here
                        title: Center(
                            child:
                                const Text('Edit Page')), // Add your text here
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
                        leading: Icon(Icons.policy),
                        title: Center(
                          child: Text(
                            'Privacy Policy',
                            textAlign: TextAlign
                                .center, // Optionally, you can specify the text alignment
                          ),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),

                      Divider(),
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
                        leading: Icon(
                          Icons.article,
                        ),
                        // Add your image here
                        title: Center(
                          child: const Text('Terms And Condition'),
                        ), // Add your text here
                        trailing: const Icon(Icons.keyboard_arrow_right),
                      ),
                      Divider(),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => AboutUs()),
                          );
                        },
                        leading: Icon(
                          Icons.policy,
                        ),
                        // Add your image here
                        title: Center(
                            child:
                                const Text('About Us')), // Add your text here
                        trailing: const Icon(Icons
                            .keyboard_arrow_right), // Add your arrow icon here
                      ),
                      Divider(),
                      ListTile(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomeAlertBox();
                            },
                          );
                        },
                        leading: Icon(
                          Icons.logout,
                          size: 32,
                          color: Colors.red,
                        ),
                        // Add your image here
                        title: Center(
                            child: const Text('Logout ')), // Add your text here
                        trailing: const Icon(Icons
                            .keyboard_arrow_right), // Add your arrow icon here
                      ),
                      Divider(),
                    ],
                  )),
            ],
          ),
        ));
  }
}
