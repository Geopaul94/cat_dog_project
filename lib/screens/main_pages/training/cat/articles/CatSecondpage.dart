import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/screens/main_pages/reminder_page/add_reminder.dart';
import 'package:petapp/screens/main_pages/training/add_reminder_catanddog.dart';

class CatSecondpage extends StatelessWidget {
  const CatSecondpage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle back button press here
        // You can navigate back to the previous page or perform any other action
        // Example:
        Navigator.pop(context); // Navigate back to the previous page
        return false; // Prevent the app from closing
      },
      child: Scaffold(
        appBar: null,
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
                  'assets/dogimages/2.jpg', // Replace 'your_image.png' with your actual image name
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
                        "What disease do we \nvaccinate dogs against ?",
                        style: const TextStyle(
                          fontSize: 26.0, // Adjust font size as needed
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '''
        
      The core vaccines for dogs protect against the following diseases:
      
      Distemper
      Parvovirus
      Rabies
      Adenovirus (Hepatitis and Respiratory Disease)
      Additionally, non-core vaccines may be recommended based on the dog's risk of exposure, lifestyle, and geographic location. These include vaccines for:
      
      Bordetella bronchiseptica (Kennel Cough)
      Leptospirosis
      Lyme Disease
      Canine Influenza
      Puppies typically receive a series of vaccinations starting around 6-8 weeks of age, followed by booster shots at regular intervals throughout their life. Annual or triennial boosters are often recommended to maintain immunity against these potentially fatal diseases.
      
      Vaccinations are crucial for protecting dogs from various highly contagious and life-threatening viral and bacterial infections. Consult with your veterinarian to determine the appropriate vaccination schedule for your furry companion.  ''',
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Cat_DogReminder()),
                              );
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
      ),
    );
  }
}
