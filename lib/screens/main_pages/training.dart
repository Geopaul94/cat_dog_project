import 'package:flutter/material.dart';

import '../widget_refractoring/customappbar .dart';

class Training extends StatelessWidget {
  const Training({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      color: const Color.fromARGB(226, 224, 218, 218),
      child: const Column(children: [
        SizedBox(height: 60,),
        CustomAppBar(),
      ]),
    ));
  }
}
