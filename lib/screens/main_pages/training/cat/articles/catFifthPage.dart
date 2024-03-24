import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/screens/main_pages/reminder_page/add_reminder.dart';
import 'package:petapp/screens/main_pages/training/add_reminder_catanddog.dart';

class catFifthPage extends StatelessWidget {
  const catFifthPage({super.key});

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
              color: Colors.pinkAccent,
              child: Image.asset(
                'assets/dogimages/4.jpg', // Replace 'your_image.png' with your actual image name
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
                      "Do we need to vaccinate a dog that does not ? ",
                      style: const TextStyle(
                        fontSize: 26.0, // Adjust font size as needed
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '''
      
     Yes, even indoor dogs that do not go outside or interact with other dogs still need to be vaccinated against certain diseases. Here's a short note on why:

While the risk of exposure is lower for indoor dogs, they still need certain core vaccinations for protection against deadly diseases that can find their way inside the home. These include:

1. Rabies: This fatal viral disease can be transmitted through bites from infected wildlife that may enter homes, like bats. Rabies vaccination is legally required in most areas.

2. Distemper: This highly contagious viral disease can be brought inside on people's clothes or shoes and can survive for a short time in the environment.

3. Parvovirus: This extremely robust virus can live in the environment for months and be carried inside accidentally.

While lifestyle vaccines like those for Bordetella, Lyme disease, and Leptospirosis may not be necessary for strictly indoor dogs, the core vaccines provide critical protection even for pets that never go outside.

Indoor dogs are still at risk, though lower, because these viruses can be tracked inside inadvertently. Vaccination is a safe, effective way to guard against potentially fatal diseases for all dogs, regardless of their lifestyle.  ''',
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
