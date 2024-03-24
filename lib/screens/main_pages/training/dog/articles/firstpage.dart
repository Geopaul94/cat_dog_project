import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/screens/main_pages/reminder_page/add_reminder.dart';
import 'package:petapp/screens/main_pages/training/add_reminder_catanddog.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.amberAccent,
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pink colored container
            Container(
              width: MediaQuery.of(context).size.width *
                  1, // Adjust width as needed
              height: MediaQuery.of(context).size.height *
                  0.35, // Adjust height as needed

              child: Image.asset(
                'assets/dogimages/5.jpg', // Replace 'your_image.png' with your actual image name
                fit: BoxFit
                    .cover, // Adjust fit as needed (e.g., BoxFit.fill, BoxFit.contain)
              ),
            ),

            // Content container with padding
            Container(
              padding: const EdgeInsets.all(15),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What is vaccination ?",
                      style: const TextStyle(
                        fontSize: 26.0, // Adjust font size as needed
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '''
      
      Dog vaccinations are essential for protecting your pet against potentially life-threatening diseases. The core vaccines recommended for all dogs include:
      
      Distemper vaccine: Protects against canine distemper virus, a highly contagious and often fatal disease.
      Parvovirus vaccine: Helps prevent parvovirus, a severe and highly contagious gastrointestinal disease.
      Rabies vaccine: Required by law in most areas, this vaccine protects against the fatal rabies virus.
      Adenovirus vaccine: Helps prevent infectious canine hepatitis and respiratory disease caused by adenoviruses.
      Puppies typically receive a series of vaccinations starting at around 6-8 weeks of age, with booster shots given at regular intervals throughout their life. Annual or triennial boosters may be recommended depending on the vaccine and your dog's risk factors.
      
      It's essential to follow your veterinarian's recommended vaccination schedule to ensure your dog's optimal protection against these dangerous diseases.   ''',
                      style: const TextStyle(
                        fontSize: 18.0, // Adjust font size as needed
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            print('notification');
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Cat_DogReminder()));
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color.fromRGBO(
                                117, 67, 191, 1), // Text color
                          ),
                          child: const SizedBox(
                            width: 122,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add, color: Colors.white),
                                SizedBox(width: 8),
                                Text('Add Reminder'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
