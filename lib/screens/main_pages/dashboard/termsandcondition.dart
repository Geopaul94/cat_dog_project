import 'package:flutter/material.dart';

class termsandconditons extends StatelessWidget {
  termsandconditons({Key? key, this.radius = 8, required this.mdFileName})
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
    
   

The terms and conditions for the "CatDog" pet application should cover the following key aspects: **[1]** User account requirements, such as providing accurate information and maintaining account security. **[2]** Permitted uses of the app and any prohibited activities like sharing inappropriate content or engaging in illegal behavior. **[3]** A statement that CatDog owns the intellectual property rights to the app and its content, while users are granted a limited, non-exclusive license for personal, non-commercial use. **[4]** User-generated content ownership, granting CatDog a license to use and distribute such content as necessary for providing the service. **[5]** Integration with third-party services and their applicable terms. **[6]** CatDog's right to terminate or suspend user accounts and access for violations. **[7]** Disclaimers of warranties and limitations of liability to protect the company from legal claims. **[8]** The governing law and jurisdiction for any legal disputes. **[9]** A note that the terms and conditions may be updated periodically, and continued app use constitutes acceptance of the revised terms.''',
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
