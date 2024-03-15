import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:petapp/screens/main_pages/bottom_navigator.dart';
import 'package:petapp/screens/onboarding_screens/onboarding_screen.dart';

// class SplashScreen extends StatefulWidget {
//   final Widget? child;
//   const SplashScreen({Key? key, this.child}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreen();
// }

// class _SplashScreen extends State<SplashScreen> {
//   @override
//   // void initState() {
//   //   Future.delayed(const Duration(seconds: 6), () {
//   //     Navigator.push(
//   //       context,
//   //       MaterialPageRoute(
//   //         builder: (context) => const OnboardingScreen(),
//   //       ),
//   //     );
//   //   });
//   //   super.initState();
//   // }
//   void initState() {
//     super.initState();
//     // Check if the app has been opened before
//     // _checkFirstSeen();
//     goToLogin();
//   }
// //this code for cheking while the user installing the app first time or not

//   // Future<void> _checkFirstSeen() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   bool _seen = (prefs.getBool('seen') ?? false);

//   //   if (_seen) {
//   //     // Delay and navigate to onboarding screen
//   //     Future.delayed(const Duration(seconds: 6), () {
//   //       Navigator.pushReplacement(
//   //         context,
//   //         MaterialPageRoute(builder: (context) => const LoginPage()),
//   //       );
//   //     });
//   //     // If the app has been opened before, navigate directly to login page
//   //     // Navigator.pushReplacement(
//   //     //   context,
//   //     //   MaterialPageRoute(builder: (context) => const LoginPage()),
//   //     // );
//   //   } else {
//   //     // If it's the first time opening the app, show the splash screen
//   //     await prefs.setBool('seen', true);
//   //     // Delay and navigate to onboarding screen
//   //     Future.delayed(const Duration(seconds: 6), () {
//   //       Navigator.pushReplacement(
//   //         context,
//   //         MaterialPageRoute(builder: (context) => const OnboardingScreen()),
//   //       );
//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Center(
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.bottomCenter,
//                 end: Alignment.topCenter,
//                 colors: [
//                   Colors.blue,
//                   Colors.green,
//                 ],
//               ),
//             ),
//             padding: const EdgeInsets.all(5),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.8,
//                   width: MediaQuery.of(context).size.width * 0.9,
//                   child: Lottie.asset(
//                     'assets/full.json',
//                   ),
//                 ),
//                 const SizedBox(
//                   height:
//                       .2, // Adjust the space between the image and progress indicator
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     LinearPercentIndicator(
//                       width: MediaQuery.of(context).size.width * 0.8,
//                       lineHeight: 10,
//                       percent: 1,
//                       progressColor: Colors.amber,
//                       backgroundColor: Colors.purple[100],
//                       animation: true,
//                       animationDuration: 4000,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> goToLogin() async {
//     await Future.delayed(const Duration(seconds: 6));
//     final check = FirebaseAuth.instance.currentUser;
//     if (check == null) {
//       // ignore: use_build_context_synchronously
//       Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (ctx) => const SignUpPage()));
//     } else {
//       // ignore: use_build_context_synchronously
//       Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (ctx) => BottomNavigator()));
//     }
//   }
// }

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  Future<void> goToNextScreen() async {
    await Future.delayed(const Duration(seconds: 6));
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) =>  BottomNavigator(indexe: 0,)),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const OnboardingScreen ()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.blue,
                  Colors.green,
                ],
              ),
            ),
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Lottie.asset(
                    'assets/full.json',
                  ),
                ),
                const SizedBox(
                  height: .2, 
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width * 0.8,
                      lineHeight: 10,
                      percent: 1,
                      progressColor: Colors.amber,
                      backgroundColor: Colors.purple[100],
                      animation: true,
                      animationDuration: 4000,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
