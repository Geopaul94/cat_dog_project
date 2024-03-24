import 'package:flutter/material.dart';
import 'package:petapp/screens/firebase/user_auth/sign_up_page.dart';
import 'package:petapp/screens/main_pages/dashboard/editprofile.dart';
import 'package:petapp/screens/main_pages/dashboard/log_out.dart';
import 'package:petapp/screens/main_pages/dashboard/userprofile.dart';
import 'package:petapp/screens/widget_refractoring/dashboard/dashboardcontainer.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromRGBO(247, 246, 251, 1),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .85,
                width: MediaQuery.of(context).size.width * .75,
                child: Column(children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .25,
                          width: MediaQuery.of(context).size.width * .25,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text('Husky',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                        const Text(
                          'Husky@gmail.com',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DashboardContainer(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => userProfile()),
                            );
                          },
                          text: 'My Profile',
                          icon: Icons.person,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DashboardContainer(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => editProfile()),
                            );
                          },
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
                ]),
              )
            ])));
  }
}
