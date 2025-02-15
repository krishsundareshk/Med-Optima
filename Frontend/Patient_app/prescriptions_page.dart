import 'package:flutter/material.dart';

class PrescriptionsPage extends StatelessWidget {
  final List<String> prescriptions = [
    'Paracetamol - 500mg',
    'Amoxicillin - 250mg',
    'Vitamin D - 1000 IU',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Prescriptions')),
      body: ListView.builder(
        itemCount: prescriptions.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(prescriptions[index]));
        },
      ),
    );
  }
}