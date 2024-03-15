import 'package:flutter/material.dart';
import 'package:petapp/screens/firebase/user_auth/sign_up_page.dart';
import 'package:petapp/screens/main_pages/dashboard/log_out.dart';
import 'package:petapp/screens/widget_refractoring/dashboard/dashboardcontainer.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.bottomCenter,
          //     end: Alignment.topCenter,
          //     colors: [
          //       Color.fromARGB(153, 193, 190, 190),
          //       Color.fromARGB(153, 130, 128, 128)
          //     ],
          //   ),
          // ),
          color: Colors.green[50],
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                // const CustomAppBar(
                //   text: 'Profile',
                // ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      height: 70,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 4.0,
                        color: Colors.blue,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              "Profile",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .051,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .65,
                  width: MediaQuery.of(context).size.width * .75,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * .1,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('demo data',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        )),
                                    Text(
                                      'demo subtitle',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const DashboardContainer(
                          text: 'My Profile',
                          icon: Icons.person,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const DashboardContainer(
                          text: 'Edit  Profile',
                          icon: Icons.edit_note,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const DashboardContainer(
                          text: 'Privacy Policy ',
                          icon: Icons.policy,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // const DashboardContainer(
                        //   text: 'Terms And Condition',
                        //   icon: Icons.article,
                        // ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.075,
                          width: MediaQuery.of(context).size.width,
                          child: GestureDetector(
                            // onTap: () {
                            //   showDialog(
                            //     context: context,
                            //     builder: (BuildContext context) {
                            //       return ; // Show the CustomAlertBox
                            //     },
                            //   );
                            // },
                            child: const Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                ),
                                Icon(
                                  Icons.article,
                                  size: 22,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Terms And Condition",
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  size: 22,
                                  Icons.keyboard_arrow_right,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DashboardContainer(
                          text: 'About Us',
                          icon: Icons.help,
                          onTap: () {
                            print('Container tapped');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ));
                          },
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.075,
                          width: MediaQuery.of(context).size.width,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CustomeAlertBox();
                                },
                              );
                            },
                            child: const Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                ),
                                Icon(
                                  Icons.logout,
                                  size: 32,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 35,
                                ),
                                Text("Log Out",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.red)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ])),
    );
  }
}
