import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/screens/main_pages/reminder_page/add_reminder.dart';
import 'package:petapp/screens/main_pages/training/add_reminder_catanddog.dart';

class vaccination extends StatelessWidget {
  const vaccination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomAppBarTitle("Vaccination"),
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
      
     

Vaccinations are crucial for protecting pets against various infectious diseases caused by viruses, bacteria, and other pathogens. They work by exposing the pet's immune system to weakened or inactive forms of the disease-causing agents, allowing the body to develop antibodies and memory cells to fight off future infections.

There are different types of vaccines used for pets:

1. Core vaccines: These are considered essential for all pets and protect against severe, life-threatening diseases. For dogs, core vaccines include distemper, parvovirus, rabies, and adenovirus. For cats, core vaccines are rabies, feline panleukopenia, feline calicivirus, and feline herpesvirus.

2. Non-core vaccines: These are recommended based on the pet's risk of exposure, lifestyle, and geographic location. Examples include vaccines for Bordetella (kennel cough), Leptospirosis, Lyme disease, and Canine Influenza for dogs, and Feline Leukemia Virus (FeLV) and Feline Immunodeficiency Virus (FIV) for cats.

3. Killed or inactivated vaccines: These contain killed or inactivated forms of the pathogen, unable to cause disease but capable of triggering an immune response.

4. Modified-live vaccines: These contain weakened but live forms of the pathogen, providing a more robust and longer-lasting immune response.

Puppies and kittens typically receive a series of vaccinations starting at around 6-8 weeks of age, followed by booster shots at regular intervals throughout their life to maintain immunity. Vaccination schedules are tailored to each pet's individual needs and risk factors, as recommended by veterinarians.   ''',
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
