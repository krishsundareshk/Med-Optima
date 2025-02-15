import 'package:flutter/material.dart';

class TimeslotBookingPage extends StatelessWidget {
  final List<String> timeslots = [
    '10:00 AM - 10:30 AM',
    '11:00 AM - 11:30 AM',
    '1:00 PM - 1:30 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Time Slot')),
      body: ListView.builder(
        itemCount: timeslots.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(timeslots[index]),
            onTap: () {
              Navigator.pushNamed(context, '/qr_code', arguments: timeslots[index]);
            },
          );
        },
      ),
    );
  }
}