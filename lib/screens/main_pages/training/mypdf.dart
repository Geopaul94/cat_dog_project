import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPdfViewer extends StatefulWidget {
  final String pdfPath;
  const MyPdfViewer({super.key, required this.pdfPath});
  @override
  _MyPdfViewerState createState() => _MyPdfViewerState();
}

class _MyPdfViewerState extends State<MyPdfViewer> {
  DateTime selectedDate = DateTime.now();
  final Uri _url = Uri.parse(
      'https://drive.google.com/file/d/1skcD571sSwuh6sQ5d5JsinkNSLCxXgfX/view?usp=sharing');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(117, 67, 191, 1),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(
                left: 60.0), // Adjust the left padding as needed
            child: Text(
              "Diet Plan ",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: SfPdfViewer.asset('assets/documents/Pet Diet Chart.pdf'));
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
