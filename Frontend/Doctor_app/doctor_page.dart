import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:doctor_app/api_service.dart';

class DoctorPage extends StatefulWidget {
  final int doctorId;
  const DoctorPage({
    super.key,
    required this.doctorId,
  });

  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  bool _isAvailable = false;
  //final ApiService _apiService = ApiService();
  final Map<int, bool> _checkedPatients = {};
  final Map<int, String> _timestampRecords = {}; // Stores timestamps

  void _updateAvailabilityOnServer(bool value) async {
    //await _apiService.updateAvailability(widget.doctorId, value);
  }

  final List<Map<String, dynamic>> patients = [
    {'name': 'Rajesh Verma', 'age': 51, 'symptoms': 'Fever, Cough'},
    {'name': 'R Manikandan', 'age': 25, 'symptoms': 'Knee Pain ,Heavy Sweating'},
    {'name': 'Vandita Singh', 'age': 42, 'symptoms': 'Fatigue, Blood Loss'},
    {'name': 'Virumandi Hassan', 'age': 19, 'symptoms': 'yellowish pigment on tongue,skin'},
    {'name': 'Micheal Bigil', 'age': 34, 'symptoms': 'high fever,loose motions'},
    {'name': 'Rayappan Vijay', 'age': 49, 'symptoms': 'fever,nausea,pain or discomfort in the lower abdomen'},
    {'name': 'Vikram Vedha', 'age': 22, 'symptoms': 'weight loss, diarrhea'},
    {'name': 'Mark Antony', 'age': 44, 'symptoms': 'pain in upper abdomen, vomitting,indigestion'},
    {'name': 'Cristiano Ronaldo', 'age': 42, 'symptoms': 'joint pain,bleeding gums'},


  ];

  void _handleCheckboxChanged(int index, bool? value) {
    setState(() {
      _checkedPatients[index] = value ?? false;
      if (value == true) {
        _timestampRecords[index] =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
        print(
            'Doctor checked patient ${patients[index]['name']} at ${_timestampRecords[index]}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Container(
        color: Color.fromARGB(252, 11, 32, 49),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Active Consultation',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255))),
              value: _isAvailable,
              onChanged: (value) {
                setState(() {
                  _isAvailable = value;
                  _updateAvailabilityOnServer(value);
                });
              },
              activeColor: Colors.white,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color.fromARGB(255, 255, 255, 255),
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(patients[index]['name'],
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Age: ${patients[index]['age']}'),
                          if (_checkedPatients[index] == true) ...[
                            Text('Symptoms: ${patients[index]['symptoms']}',
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 218, 87, 78))),
                            Text(
                                'Previous Record: ${patients[index]['prevRecord']}',
                                style: TextStyle(color: Colors.blue)),
                          ],
                        ],
                      ),
                      trailing: Checkbox(
                        value: _checkedPatients[index] ?? false,
                        onChanged: (value) =>
                            _handleCheckboxChanged(index, value),
                        activeColor: const Color.fromARGB(252, 11, 32, 49),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
