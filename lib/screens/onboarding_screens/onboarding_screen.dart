import 'package:flutter/material.dart';
import 'package:petapp/screens/firebase/user_auth/login_page.dart';
import 'package:petapp/screens/onboarding_screens/intro_page_three.dart';
import 'package:petapp/screens/onboarding_screens/onboarding_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool _onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _onLastPage = (index == 2); // Check if on last page
              });
            },
            children: const [
              OnboardingPage(
                imagePath: 'assets/cat22.png',
                text: ' Helping you \n to keep your bestie \n stay healthy!',
              ),
              OnboardingPage(
                imagePath: 'assets/dog11.png',
                text:
                    "  Buddy boost! Vaccines,\n  diet, & all-in-one health app.\n  Let's get wagging!",
              ),
              PageThree(),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 80,
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: const Text(
                      "SKIP",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const WormEffect(
                      // Change the effect to WormEffect for animation
                      activeDotColor: Colors.white,
                      dotColor: Color.fromARGB(255, 12, 202, 255),
                      spacing: 20, // Add spacing between the buttons
                    ),
                    onDotClicked: (index) {
                      _controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                  ),

                  // next or done
                  _onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) => const LoginPage()),
                            );
                          },
                          child: const Text(
                            "DONE",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                              duration: const Duration(microseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                          child: const Text(
                            "NEXT",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
