/*import 'package:flutter/material.dart';

class AdminProfilePage extends StatelessWidget {
  final String username;
  final String hospitalName;
  final String hospitalAddress;
  final String specialization;
  final List<Map<String, String>> doctors;

  const AdminProfilePage({super.key, 
    required this.username,
    required this.hospitalName,
    required this.hospitalAddress,
    required this.specialization,
    required this.doctors,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Profile')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: $username', style: TextStyle(fontSize: 18)),
            Text('Hospital Name: $hospitalName', style: TextStyle(fontSize: 18)),
            Text('Hospital Address: $hospitalAddress', style: TextStyle(fontSize: 18)),
            Text('Specialization: $specialization', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Doctors:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(doctors[index]['name']!),
                    subtitle: Text(doctors[index]['specialization']!),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
/*
import 'package:flutter/material.dart';

class AdminProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Profile')),
      body: Column(
        children: [
          ListTile(title: Text('Username: Admin123')),
          ListTile(title: Text('Hospital Name: City Hospital')),
          ListTile(title: Text('Hospital Address: XYZ Street')),
          ListTile(title: Text('Specialization: General')),
          ListTile(title: Text('Doctors: Dr. Smith (Cardiologist), Dr. Lee (Orthopedic)')),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('Edit Profile'),
          ),
        ],
      ),
    );
  }
}
*/

/* important file
import 'package:flutter/material.dart';
class AdminProfilePage extends StatelessWidget {
  final String username;
  final String hospitalName;
  final String hospitalAddress;
  final String specialization;
  final String doctors;

  const AdminProfilePage({super.key, required this.username, required this.hospitalName, required this.hospitalAddress, required this.specialization, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Profile')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(title: Text('Username: $username')),
            ListTile(title: Text('Hospital: $hospitalName')),
            ListTile(title: Text('Address: $hospitalAddress')),
            ListTile(title: Text('Specialization: $specialization')),
            ListTile(title: Text('Doctors: $doctors')),
          ],
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';

class AdminProfilePage extends StatelessWidget {
  final String username;
  final String hospitalName;
  final String hospitalAddress;
  final String specialization;
  final String doctors;

  const AdminProfilePage({
    super.key,
    required this.username,
    required this.hospitalName,
    required this.hospitalAddress,
    required this.specialization,
    required this.doctors,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Profile', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileItem('Username', username),
                _buildProfileItem('Hospital', hospitalName),
                _buildProfileItem('Address', hospitalAddress),
                _buildProfileItem('Specialization', specialization),
                _buildProfileItem('Doctors', doctors),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
    
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(height: 4),
          Text(

            value,
            style: TextStyle(fontSize: 16, color: Colors.lime),
          ),
          Divider(color: const Color.fromARGB(255, 200, 4, 4)),
        ],
      ),
    );
  }
}

