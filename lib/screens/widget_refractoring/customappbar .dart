// import 'package:flutter/material.dart';

// class CustomAppBar extends StatelessWidget {
//   final String? text;
//   const CustomAppBar({this.text, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         children: [
//           SizedBox(
//             width: 80,
//             height: 70,
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               elevation: 4.0,
//               color: Colors.blue,
//               child: Padding(
//                 padding: const EdgeInsets.all(7.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.arrow_back, color: Colors.white),
//                       onPressed: () {
//                         // Handle back arrow tap
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 60,
//           ),
//          text!=? SizedBox(
//             width: 250, // Set desired width
//             height: 70,
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//               elevation: 4.0,
//               color: Colors.blue,
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       text!,
//                       style:
//                           const TextStyle(color: Colors.white, fontSize: 16.0),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ):SizedBox()
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// class CustomAppBar extends StatelessWidget {
//   final String? text;

//   const CustomAppBar({this.text, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         children: [
//           SizedBox(
//             width: 15,
//           ),
//           SizedBox(
//             width: 80,
//             height: 60,
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               elevation: 4.0,
//               color: Color.fromRGBO(117, 67, 191, 1),
//               child: Padding(
//                 padding: const EdgeInsets.all(7.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.arrow_back, color: Colors.white),
//                       onPressed: () {
//                         Navigator.pop(
//                             context); // You need to call the pop function
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 20),
//           if (text != null)
//             SizedBox(
//               width: 200, // Set desired width
//               height: 60,
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 elevation: 4.0,
//                 color: Color.fromRGBO(117, 67, 191, 1),
//                 child: Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: Center(
//                     child: Text(
//                       text!,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 20.0,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final VoidCallback? onTap;

  const CustomAppBar({this.text, this.icon, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 80,
            height: 60,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 4.0,
              color: const Color.fromRGBO(117, 67, 191, 1),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (icon != null && onTap != null)
                      IconButton(
                        icon: Icon(icon),
                        onPressed: onTap,
                        color: Colors.white,
                      ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          if (text != null)
            SizedBox(
              width: 200, // Set desired width
              height: 60,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 4.0,
                color: const Color.fromRGBO(117, 67, 191, 1),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: Text(
                      text!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
