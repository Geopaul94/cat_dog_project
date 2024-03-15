import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String text;
 

  const OnboardingPage({
    super.key,
    required this.text,
    required this.imagePath,
  });

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
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 450, width: 450, child: Image.asset(imagePath)),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
