import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            const Text(
              "Your best buddy",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Lottie.asset(
                'assets/cat.json',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
