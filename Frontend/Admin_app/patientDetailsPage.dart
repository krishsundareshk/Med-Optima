/*import 'package:flutter/material.dart';
import 'package:first_app/feedback_page.dart';

class PatientDetailsPage extends StatelessWidget {
  final String patientName;
  PatientDetailsPage({required this.patientName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$patientName Details')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('QR Validation'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Upload Prescription'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackPage()));
            },
            child: Text('Feedback'),
          ),
        ],
      ),
    );
  }
}*/

import 'package:flutter/material.dart';

class PatientDetailsPage extends StatelessWidget {
  const PatientDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Patient Details')),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text('QR Validation')),
            SizedBox(height: 15),
            ElevatedButton(onPressed: () {}, child: Text('Upload Prescription')),
            SizedBox(height: 15),
            ElevatedButton(onPressed: () {}, child: Text('Feedback')),
          ],
        ),
      ),
    );
  }
}
