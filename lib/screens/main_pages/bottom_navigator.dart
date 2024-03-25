import 'package:flutter/material.dart';

import 'package:petapp/screens/main_pages/addpets/addpets.dart';
import 'package:petapp/screens/main_pages/dashboard/dashboard.dart';
import 'package:petapp/screens/main_pages/homepage/horizontalcard/homepage.dart';
import 'package:petapp/screens/main_pages/training/training.dart';

import 'package:petapp/screens/main_pages/reminder_page/reminders.dart';

// ignore: must_be_immutable
class BottomNavigator extends StatefulWidget {
  late int indexe;
  BottomNavigator({super.key, required this.indexe});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  // INDEX VALUE CHANGE TO HOME SCREEN FROM ADDPET
  int _selectedIndex = 0;
  late PageController _pageController;

  final List<Widget> _pages = [
    Training(),
    const Reminders(),
    const AddPets(),
    HomePage(),
    const DashBoard(),
  ];

  @override
  void initState() {
    super.initState();
    if (widget.indexe == 0) {
      _pageController = PageController(initialPage: _selectedIndex);
    } else {
      _pageController = PageController(initialPage: widget.indexe);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe action
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
            widget.indexe = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.deepPurple,
        selectedItemColor: const Color.fromRGBO(117, 67, 191, 1),
        unselectedItemColor:
            const Color.fromARGB(255, 145, 80, 80).withOpacity(0.6),
        currentIndex: widget.indexe,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add),
            label: 'Reminders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Pets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
