import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/screens/main_pages/reminder_page/add_reminder.dart';
import 'package:petapp/screens/main_pages/training/add_reminder_catanddog.dart';

class fleas extends StatelessWidget {
  const fleas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomAppBarTitle("Ticks and fleas protection"),
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

 Here's a brief note about protection against ticks and fleas for pets:

Ticks and fleas are external parasites that can cause significant discomfort, disease transmission, and health issues for pets. Effective prevention and control measures are crucial to protect your furry companions.

1. Topical treatments:
   - Spot-on treatments or monthly topical solutions are widely used for flea and tick prevention.
   - These products typically contain insecticides or insect growth regulators that kill and repel fleas and ticks.
   - Examples include fipronil, selamectin, and spinosad-based products.

2. Oral medications:
   - Oral flea and tick preventatives are available in the form of chewable tablets or flavored treats.
   - These medications work by disrupting the life cycle of fleas and ticks, preventing their development and reproduction.
   - Common active ingredients include afoxolaner, fluralaner, and sarolaner.

3. Collars and sprays:
   - Flea and tick collars can provide long-lasting protection by releasing insecticides over time.
   - Insecticide sprays can be applied directly to the pet's coat or in their environment for short-term control.

4. Environmental control:
   - Regularly vacuuming and deep cleaning pet areas can help remove flea eggs, larvae, and adults.
   - Treating outdoor areas with insecticides may be necessary in cases of severe infestations.

5. Grooming and inspection:
   - Regular grooming and coat inspection can help detect and remove any ticks or fleas present on your pet.
   - Prompt removal of ticks is essential to reduce the risk of tick-borne diseases.

6. Veterinary guidance:
   - Consult your veterinarian for the most effective and safe flea and tick prevention products for your pet's age, breed, and lifestyle.
   - Follow their recommendations for the proper dosage and application of these products.

Consistent use of flea and tick prevention measures is crucial to maintain your pet's comfort, health, and protect them from potentially serious diseases transmitted by these parasites.''',
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
          width: MediaQuery.of(context).size.width * 0.12,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20.0), // Adjust font size for title
        ),
      ],
    );
  }
}
