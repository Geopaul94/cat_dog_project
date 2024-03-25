import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('About Us'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(projectOverview),
          ))
        ])));
  }
}

String projectOverview = """

Project Overview:

Project Name: Pebble Paws
Developer: Salmanulfaris.k
Development Platform: Flutter (Dart Programming Language)

App Functionalities:

User Management:
    The app allows users to create and manage their accounts.
    Users can log in and log out of their accounts.
    User authentication ensures secure access to the app.

Add Multiple Pet Dogs:
    Users have the ability to add multiple pet dogs to their profile.
    Each dog entry contains details such as name, breed, age, gender, and a profile picture.

Events for Dogs:
   - The app provides a feature for users to schedule and manage events related to their dogs.
   - These events could include activities like vet appointments, grooming sessions, playdates, etc.

Reminders:
   - Users can set reminders for various tasks related to their dogs, such as feeding schedules, medication times, and grooming appointments.
   - Notifications will be sent to remind users of these tasks.

Training Programs:
   - The app offers training programs designed to enhance the skills and behavior of dogs.
   - These programs could include basic obedience training, agility training, and more.

Diet Plans:
   - Users can access and follow suggested diet plans tailored to the specific needs of their dogs.
   - This feature ensures that dogs receive proper nutrition for their health and well-being.

Purpose of the Project:

The primary purpose of the "Pebble Paws" project is to provide dog owners with a comprehensive tool to manage and enhance the well-being of their pets. It aims to simplify the process of keeping track of important information, events, and activities related to their dogs.

Potential Learning Objectives:

- Developing a Flutter application for both Android and iOS platforms.
- Implementing user authentication and account management.
- Working with databases to store and retrieve user and dog-related information.
- Implementing notifications and reminders for important tasks.
- Designing a user-friendly and intuitive interface for a mobile application.

Note:

This project demonstrates the capabilities of a Flutter developer named Salmanulfaris.k in creating a practical and user-centric mobile application for managing pet dogs. It showcases proficiency in mobile app development, user interface design, and database integration. The "My Dog" app could be a valuable tool for dog owners looking to provide the best care for their furry companions.
""";
