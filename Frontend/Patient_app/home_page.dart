import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/past_appointments'),
            child: Text('View Past Appointments'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/symptoms_chat'),
            child: Text('Book Current Appointment'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/prescriptions'),
            child: Text('View Prescriptions'),
          ),
        ],
      ),
    );
  }
}