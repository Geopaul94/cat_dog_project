import 'package:flutter/material.dart';

class OnbordingContainers extends StatefulWidget {
  const OnbordingContainers({super.key});

  @override
  State<OnbordingContainers> createState() => _OnbordingContainersState();
}

class _OnbordingContainersState extends State<OnbordingContainers> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
          Color.fromARGB(255, 16, 24, 177),
          Color.fromARGB(255, 143, 145, 186)
        ]
        )
        )
        );
  }
}
