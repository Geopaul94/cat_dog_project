import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/screens/main_pages/reminder_page/add_reminder.dart';
import 'package:petapp/screens/main_pages/training/add_reminder_catanddog.dart';

class Helminths extends StatelessWidget {
  const Helminths({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomAppBarTitle("Helminths protection"),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(229, 109, 87, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Content container with padding
            Container(
              padding: const EdgeInsets.all(20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '''
     Here's a brief explanation about protecting pets against helminths (worms):

Helminths, or worms, are parasitic organisms that can infect pets, causing various health issues. There are different types of helminths, including roundworms, hookworms, tapeworms, and heartworms. Protecting pets against these parasites is essential for their overall well-being.

1. Deworming medications:
   - Deworming medications are used to eliminate existing worm infestations in pets.
   - Various dewormers are available, targeting different types of worms.
   - Puppies and kittens often require more frequent deworming due to higher susceptibility.

2. Heartworm prevention:
   - Heartworm is a serious and potentially fatal condition caused by a parasitic worm.
   - Preventative medications, given monthly, are recommended for dogs and cats in areas where heartworm is prevalent.
   - These medications help protect pets from developing heartworm infections.

3. Flea and tick control:
   - Some types of worms, like tapeworms, can be transmitted through fleas.
   - Regular use of flea and tick preventatives helps reduce the risk of worm infestations.

4. Environmental control:
   - Proper disposal of pet feces and regular cleaning of living areas can help reduce the spread of worm eggs and larvae in the environment.
   - Avoiding feeding pets raw meat or allowing them to hunt and consume prey can also reduce the risk of worm infections.

5. Regular veterinary check-ups:
   - Veterinarians can perform fecal examinations to detect the presence of worms and recommend appropriate deworming treatments.
   - They can also advise on the best preventative measures based on the pet's lifestyle and risk factors.

By following a comprehensive deworming and prevention program, pet owners can effectively protect their furry companions from the harmful effects of helminth infections.  ''',
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

class CustomAppBarTitle extends StatelessWidget {
  final String title;

  const CustomAppBarTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back, size: 24.0), // Adjust size of back arrow
          onPressed: () => Navigator.pop(context),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.18,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20.0), // Adjust font size for title
        ),
      ],
    );
  }
}
