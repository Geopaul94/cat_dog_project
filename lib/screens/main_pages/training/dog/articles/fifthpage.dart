import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/screens/main_pages/reminder_page/add_reminder.dart';
import 'package:petapp/screens/main_pages/training/add_reminder_catanddog.dart';

class fifthpage extends StatelessWidget {
  const fifthpage({super.key});

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
                'assets/catimages/5.jpg', // Replace 'your_image.png' with your actual image name
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
                      "How do cats get worms ? ",
                      style: const TextStyle(
                        fontSize: 26.0, // Adjust font size as needed
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '''
      
    Dogs can get worms (intestinal parasites) through various routes:

1. Ingestion of infected prey: Dogs can get worms by eating small rodents, birds, or other animals that are already harboring worm larvae or eggs.

2. From the environment: Worm eggs or larvae can contaminate soil, water sources, or vegetation. Dogs can ingest these while digging, playing, or eating grass/plants.

3. From other dogs: Some worms can be transmitted directly from an infected dog through feces, licking, or skin contact.

4. From fleas: Certain types of worms, like tapeworms, use fleas as intermediate hosts. Dogs can get infected by ingesting fleas carrying tapeworm larvae.

5. In utero transmission: Puppies can get worms from their mother before birth or through her milk if she is infected.

6. Eating contaminated raw meat: Dogs fed raw meat infected with worm larvae or eggs can become infected.

Regular deworming, practicing good hygiene, promptly disposing of feces, using flea prevention, and avoiding letting dogs eat prey animals or contaminated materials can help prevent worm infections in dogs. ''',
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
