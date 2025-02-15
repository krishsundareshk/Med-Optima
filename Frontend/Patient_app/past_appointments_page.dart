import 'package:flutter/material.dart';

class PastAppointmentsPage extends StatelessWidget {
  final List<String> appointments = [
    'Dr. Rajesh - 12 Jan 2025',
    'Dr. Priya - 20 Dec 2024',
    'Dr. Aman - 5 Dec 2024',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Past Appointments')),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(appointments[index]));
        },
      ),
    );
  }
}
