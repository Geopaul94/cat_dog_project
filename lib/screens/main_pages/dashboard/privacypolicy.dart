import 'package:flutter/material.dart';

class privacydialoge extends StatelessWidget {
  privacydialoge({Key? key, this.radius = 8, required this.mdFileName})
      : assert(mdFileName.contains('.md')),
        super(key: key);

  final double radius;
  final String mdFileName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Column(
        children: [
          // Privacy policy text
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '''
    
    The privacy policy for your pet application should clearly outline **[1]** the types of personal information being collected from users, such as names, addresses, email addresses, payment details, and data related to their pets. **[2]** It should explain how this collected data will be used, such as for providing services, processing payments, sending communications, and analytical purposes to improve the app. **[3]** If any user data is shared with third parties like service providers, analytics companies, or advertisers, this must be disclosed along with the purposes and safeguards in place. **[4]** The policy should describe the measures taken to securely store user data and protect it from unauthorized access, loss, or misuse, mentioning industry-standard encryption and security protocols. **[5]** Users should be informed about their rights concerning their personal data, such as the ability to access, rectify, delete, or restrict its processing. **[6]** If the app collects data from minors, a separate section outlining compliance with regulations like COPPA is necessary. **[7]** Any integration with third-party services like social media or location services should be disclosed, with links to their privacy policies provided. **[8]** The policy should state that it may be updated periodically and how users will be notified of changes. Finally, **[9]** contact information should be provided for users to reach out with privacy-related questions or concerns.''',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 16), // Adjust the font size as needed
                ),
              ),
            ),
          ),
          // Close button
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius),
                ),
              ),
              alignment: Alignment.center,
              height: 50,
              width: 200,
              child: const Text(
                "Close",
                style: TextStyle(
                  color: Color.fromRGBO(117, 67, 191, 1),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
