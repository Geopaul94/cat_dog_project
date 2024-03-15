import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

// class CameraPage extends StatefulWidget {
//   @override
//   State<CameraPage> createState() => _CameraPageState();
// }

// class _CameraPageState extends State<CameraPage> {
//   final _formKey = GlobalKey<FormState>();

//   XFile? _image;

//   String? image;
//   bool isImageSelected = false;
//   Future pickImage() async {
//     try {
//       _image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (_image != null) {
//         setState(() {
//           image = _image!.path;
//           isImageSelected = true;
//         });
//       }
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//         autovalidateMode: AutovalidateMode.always,
//       child: Column(
//         children: [
//           FormField<String>(
//             builder: (FormFieldState<String> state) {
//               return InkWell(
//                 onTap: () async {
//                   final pickedFile = await ImagePicker()
//                       .pickImage(source: ImageSource.gallery);
//                   if (pickedFile != null) {
//                     // Do something with the picked file
//                     setState(() {
//                       image = pickedFile.path; // Update the image variable
//                     });
//                   } 
                  
//                   // else {
//                   //   state.didChange(null);
//                   //   ScaffoldMessenger.of(context).showSnackBar(
//                   //       SnackBar(content: Text('Please select an image')));
//                   // }
//                 },
//                 child: Container(
//                   width: MediaQuery.of(context).size.width * 0.42,
//                   height: MediaQuery.of(context).size.height * 0.21,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(15)),
//                     color: Colors.grey[300],
//                   ),
//                   child: image != null
//                       ? ClipRRect(
//                           borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                           child: Container(
//                             width: MediaQuery.of(context).size.width * 0.42,
//                             height: MediaQuery.of(context).size.height * 0.21,
//                             child: Image.file(
//                               File(image!),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         )
//                       : Container(
//                           padding: EdgeInsets.all(40),
//                           child: LottieBuilder.asset(
//                             'assets/camera(1).json',
//                             height: MediaQuery.of(context).size.height * 0.12,
//                             width: MediaQuery.of(context).size.width * .25,
//                           ),
//                         ),
//                 ),
//               );
//             },
//           ),
//           //
//         ],
//       ),
//     );
//   }
// }



class CameraPage extends StatefulWidget {
  final void Function(String imagePath) onImageSelected;

  const CameraPage({super.key, required this.onImageSelected});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  XFile? _image;

  String? image;
  bool isImageSelected = false;

  Future<void> pickImage() async {
    try {
      _image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (_image != null) {
        setState(() {
          image = _image!.path;
          isImageSelected = true;
          widget.onImageSelected(image!); // Callback with the selected image path
        });
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          InkWell(
            onTap: pickImage,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.42,
              height: MediaQuery.of(context).size.height * 0.21,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: Colors.grey[300],
              ),
              child: image != null
                  ? ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                      child: Image.file(
                        File(image!),
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(40),
                      child: LottieBuilder.asset(
                        'assets/camera(1).json',
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width * .25,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
