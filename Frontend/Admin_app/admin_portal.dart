/*import 'package:flutter/material.dart';
import 'package:first_app/AdminProfilePage.dart';
class AdminPortalPage extends StatelessWidget {
  final String username;
  final String hospitalName;
  final String hospitalAddress;
  final String specialization;
  final List<Map<String, String>> doctors;

  AdminPortalPage({
    required this.username,
    required this.hospitalName,
    required this.hospitalAddress,
    required this.specialization,
    required this.doctors, required String hospitalSpecialization,
  });

  final List<String> patients = ['Patient 1', 'Patient 2', 'Patient 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Portal')),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminProfilePage(
                      username: username,
                      hospitalName: hospitalName,
                      hospitalAddress: hospitalAddress,
                      specialization: specialization,
                      doctors: doctors,
                    ),
                  ),
                );
              },
              child: Text('View Profile'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: patients.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(patients[index]),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text('Manage'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/


/*
import 'package:flutter/material.dart';
import 'package:first_app/patientDetailsPage.dart';
import 'package:first_app/AdminProfilePage.dart';

class AdminPortalPage extends StatelessWidget {
  final List<String> patients = ['Patient A', 'Patient B', 'Patient C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Portal'),
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AdminProfilePage()));
          },
        ),
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(patients[index]),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PatientDetailsPage(patientName: patients[index])));
              },
              child: Text('View'),
            ),
          );
        },
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'patientDetailsPage.dart';
import 'AdminProfilePage.dart';


class AdminPortalPage extends StatelessWidget {
  final String username;
  final String hospitalName;
  final String hospitalAddress;
  final String specialization;
  final String doctors;

  AdminPortalPage({super.key, required this.username, required this.hospitalName, required this.hospitalAddress, required this.specialization, required this.doctors});

  final List<String> patients = ['Patient 1', 'Patient 2', 'Patient 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Portal')),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('View Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminProfilePage(
                      username: username,
                      hospitalName: hospitalName,
                      hospitalAddress: hospitalAddress,
                      specialization: specialization,
                      doctors: doctors,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(patients[index]),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PatientDetailsPage()),
                );
              },
              child: Text('View'),
            ),
          );
        },
      ),
    );
  }
}
*/


/*
class AdminPortalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Portal')),
      body: Center(child: Text('Admin Dashboard with 3 Options')),
    );
  }
}*/

/*
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AdminPortalPage extends StatefulWidget {
  @override
  _AdminPortalPageState createState() => _AdminPortalPageState();
}

class _AdminPortalPageState extends State<AdminPortalPage> {
  String username = '';
  String hospitalName = '';
  String hospitalAddress = '';
  String specialization = '';
  String doctors = '';

  @override
  void initState() {
    super.initState();
    loadAdminDetails();
  }

  Future<void> loadAdminDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
      hospitalName = prefs.getString('hospitalName') ?? '';
      hospitalAddress = prefs.getString('hospitalAddress') ?? '';
      specialization = prefs.getString('specialization') ?? '';
      doctors = prefs.getString('doctors') ?? '';
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}*/


/*CODE IMPORTANT
import 'package:first_app/feedback_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPortalPage extends StatefulWidget {
  const AdminPortalPage({super.key});

  @override
  _AdminPortalPageState createState() => _AdminPortalPageState();
}

class _AdminPortalPageState extends State<AdminPortalPage> {
  String username = '';
  String hospitalName = '';
  String hospitalAddress = '';
  String specialization = '';
  String doctors = '';

  @override
  void initState() {
    super.initState();
    loadAdminDetails();
  }

  Future<void> loadAdminDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
      hospitalName = prefs.getString('hospitalName') ?? '';
      hospitalAddress = prefs.getString('hospitalAddress') ?? '';
      specialization = prefs.getString('specialization') ?? '';
      doctors = prefs.getString('doctors') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Portal')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Admin Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Username: $username'),
            Text('Hospital Name: $hospitalName'),
            Text('Hospital Address: $hospitalAddress'),
            Text('Specialization: $specialization'),
            Text('Doctors: $doctors'),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('QR Validation')),
            ElevatedButton(onPressed: () {}, child: Text('Prescription Upload')),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackPage()));
            }, child: Text('Feedback')),
          ],
        ),
      ),
    );
  }
}*/

/* VERY VERY IMPORTANTTT!!!!
import 'package:first_app/feedback_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AdminPortalPage extends StatefulWidget {
  const AdminPortalPage({super.key});

  @override
  _AdminPortalPageState createState() => _AdminPortalPageState();
}

class _AdminPortalPageState extends State<AdminPortalPage> {
  String username = '';
  String hospitalName = '';
  String hospitalAddress = '';
  String specialization = '';
  String doctors = '';

  @override
  void initState() {
    super.initState();
    loadAdminDetails();
  }

  Future<void> loadAdminDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
      hospitalName = prefs.getString('hospitalName') ?? '';
      hospitalAddress = prefs.getString('hospitalAddress') ?? '';
      specialization = prefs.getString('specialization') ?? '';
      doctors = prefs.getString('doctors') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Portal', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade100, Colors.blue.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onPressed: () {},
                    child: Text('QR Validation', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onPressed: () {},
                    child: Text('Prescription Upload', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FeedbackPage()),
                      );
                    },
                    child: Text('Feedback', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
          SlidingUpPanel(
            panel: Padding(

              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text('Admin Profile', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Divider(),
                  Text('Username: $username', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Hospital Name: $hospitalName', style: TextStyle(fontSize: 16)),
                  Text('Hospital Address: $hospitalAddress', style: TextStyle(fontSize: 16)),
                  Text('Specialization: $specialization', style: TextStyle(fontSize: 16)),
                  Text('Doctors: $doctors', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            collapsed: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Center(
                child: Text(
                  'Swipe Up for Admin Profile',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
            
                
          ),
        ],
      ),
    );
  }

}*/

/* last
import 'package:first_app/feedback_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AdminPortalPage extends StatefulWidget {
  const AdminPortalPage({super.key});

  @override
  _AdminPortalPageState createState() => _AdminPortalPageState();
}

class _AdminPortalPageState extends State<AdminPortalPage> {
  String username = '';
  String hospitalName = '';
  String hospitalAddress = '';
  String specialization = '';
  String doctors = '';

  @override
  void initState() {
    super.initState();
    loadAdminDetails();
  }

  Future<void> loadAdminDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
      hospitalName = prefs.getString('hospitalName') ?? '';
      hospitalAddress = prefs.getString('hospitalAddress') ?? '';
      specialization = prefs.getString('specialization') ?? '';
      doctors = prefs.getString('doctors') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Portal', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade100, Colors.blue.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.qr_code, color: Colors.white),
                    label: Text('QR Validation', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.upload_file, color: Colors.white),
                    label: Text('Prescription Upload', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FeedbackPage()),
                      );
                    },
                    icon: Icon(Icons.feedback, color: Colors.white),
                    label: Text('Feedback', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.people, color: Colors.white),
                    label: Text('Patient-Doc Mapping', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
          SlidingUpPanel(
            panel: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Admin Profile', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Divider(),
                  Text('Username: $username', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Hospital Name: $hospitalName', style: TextStyle(fontSize: 16)),
                  Text('Hospital Address: $hospitalAddress', style: TextStyle(fontSize: 16)),
                  Text('Specialization: $specialization', style: TextStyle(fontSize: 16)),
                  Text('Doctors: $doctors', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            collapsed: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Center(
                child: Text(
                  'Swipe Up for Admin Profile',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
        ],
      ),
    );
  }
}
*/

import 'package:first_app/feedback_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AdminPortalPage extends StatefulWidget {
  const AdminPortalPage({super.key});

  @override
  _AdminPortalPageState createState() => _AdminPortalPageState();
}

class _AdminPortalPageState extends State<AdminPortalPage> {
  String username = '';
  String hospitalName = '';
  String hospitalAddress = '';
  String specialization = '';
  String doctors = '';

  @override
  void initState() {
    super.initState();
    loadAdminDetails();
  }

  Future<void> loadAdminDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
      hospitalName = prefs.getString('hospitalName') ?? '';
      hospitalAddress = prefs.getString('hospitalAddress') ?? '';
      specialization = prefs.getString('specialization') ?? '';
      doctors = prefs.getString('doctors') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Portal', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: [
                    _buildIconButton(Icons.qr_code, 'QR Validation'),
                    _buildIconButton(Icons.upload_file, 'Prescription Upload'),
                    _buildIconButton(Icons.feedback, 'Feedback', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FeedbackPage()),
                      );
                    }),
                    _buildIconButton(Icons.people, 'Doctor availability'),
                  ],
                ),
              ],
            ),
          ),
          SlidingUpPanel(
            panel: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Admin Profile', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Divider(),
                  Text('Username: $username', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Hospital Name: $hospitalName', style: TextStyle(fontSize: 16)),
                  Text('Hospital Address: $hospitalAddress', style: TextStyle(fontSize: 16)),
                  Text('Specialization: $specialization', style: TextStyle(fontSize: 16)),
                  Text('Doctors: $doctors', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            collapsed: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Center(
                child: Text(
                  'Swipe Up for Admin Profile',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label, [VoidCallback? onPressed]) {
    return SizedBox(
      width: 150,
      height: 150,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        ),
        onPressed: onPressed ?? () {},
        icon: Icon(icon, color: Colors.white, size: 30),
        label: Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
      ),
    );
  }
}
