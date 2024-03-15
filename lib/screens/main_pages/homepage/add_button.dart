import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:petapp/screens/main_pages/homepage/cat/cat_page_list.dart';
import 'package:petapp/screens/main_pages/homepage/dog/dog_page_list.dart';

class AnimatedPetIcon extends StatefulWidget {
  const AnimatedPetIcon({
    super.key,
  });

  @override
  State<AnimatedPetIcon> createState() => _AnimatedPetIconState();
}

class _AnimatedPetIconState extends State<AnimatedPetIcon> {
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // Can pop only when the dial is closed
      canPop: !isDialOpen.value,
      onPopInvoked: (didPop) {
        if (isDialOpen.value) {
          isDialOpen.value = false;
        }
      },
      child: Scaffold(
        floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.list_view,
            backgroundColor: const Color.fromRGBO(117, 67, 191, 1),
            foregroundColor: Colors.white,
            openCloseDial: isDialOpen,
            overlayOpacity: 0.1,
            spacing: 25,
            spaceBetweenChildren: 25,
            children: [
              SpeedDialChild(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => CatPage()),
                  );
                },
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/cat11.png'),
                      fit: BoxFit.cover, // Adjust as needed
                    ),
                  ),
                ),
                label: 'Cat',
              ),
              SpeedDialChild(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DogPage()),
                  );
                },
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/dog smile.png'),
                      fit: BoxFit.cover, // Adjust as needed
                    ),
                  ),
                ),
                label: 'Dog',
              ),
            ]),
      ),
    );
  }
}
