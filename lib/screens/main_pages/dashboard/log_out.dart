import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petapp/screens/firebase/user_auth/login_page.dart';

class CustomeAlertBox extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

   CustomeAlertBox({super.key});

  // Function to handle logout
  Future<void> _logout(BuildContext context) async {
    try {
      await _auth.signOut(); // Sign out the current user
      // Navigate to login screen or any other screen after logout
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginPage()
      ));
    } catch (e) {
      
      // Handle any errors that occur during logout
      print('Error logging out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Logout'),
      content: const Text('Are you sure you want to log out?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the alert dialog
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            // Log out the user
            try {
              await _logout(context); // Call logout function
            } catch (e) {
              // Handle any errors that occur during logout
              print('Error logging out: $e');
            }
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}
