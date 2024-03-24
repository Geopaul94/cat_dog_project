import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/screens/main_pages/reminder_page/add_reminder.dart';
import 'package:petapp/screens/main_pages/training/add_reminder_catanddog.dart';

class CatThirdPage extends StatelessWidget {
  const CatThirdPage({super.key});

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
                'assets/dogimages/3.jpg', // Replace 'your_image.png' with your actual image name
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
                      "When should a puppy be  vaccinated ?",
                      style: const TextStyle(
                        fontSize: 26.0, // Adjust font size as needed
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '''
      
    Puppies should receive a series of vaccinations starting at around 6-8 weeks of age. Here is a typical vaccination schedule for puppies:

6-8 weeks old:
- Distemper
- Parvovirus
- Adenovirus (Hepatitis)

10-12 weeks old:
- Second set of distemper, parvovirus, and adenovirus vaccines
- Coronavirus (optional)

14-16 weeks old: 
- Third set of distemper, parvovirus, adenovirus vaccines
- Rabies vaccine

The core puppy vaccines (distemper, parvovirus, adenovirus) need to be given as a series, with boosters every 3-4 weeks until the puppy is 16 weeks old. This builds up their immunity.

After the puppy series is complete at around 4 months old, they will need booster shots for these core vaccines every 1-3 years depending on the vaccine.

Rabies vaccination is given once around 14-16 weeks old, and then requires booster shots per the local laws, usually every 1-3 years.

It's important to follow this schedule closely as puppies have immature immune systems and are very vulnerable to deadly diseases until they are fully vaccinated. Consult your veterinarian for the appropriate timing based on your puppy's risk factors.  ''',
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
