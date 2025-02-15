import 'package:flutter/material.dart';

class HospitalSelectionPage extends StatelessWidget {
  final List<Map<String, String>> hospitals = [
    {'name': 'City Hospital', 'distance': '2 km'},
    {'name': 'Metro Care', 'distance': '5 km'},
    {'name': 'HealthPlus Clinic', 'distance': '8 km'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Hospital')),
      body: ListView.builder(
        itemCount: hospitals.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(hospitals[index]['name']!),
            subtitle: Text(hospitals[index]['distance']!),
            onTap: () => Navigator.pushNamed(context, '/timeslot_booking'),
          );
        },
      ),
    );
  }
}