/*import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';
import 'package:first_app/logo.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Text controllers to handle user input
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Color for the button
  final Color _buttonColor = Color.fromARGB(255, 11, 32, 49);

  // Show password feature
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          GradientContainer([
            Color.fromARGB(255, 11, 32, 49),
            Color.fromARGB(255, 11, 32, 49)
          ]),

          // Top-left logo
          const Positioned(
            top: 10,
            left: 10,
            child: LogoImage(),
          ),

          // Signup form
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 11, 32, 49),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    // Quote text
                    const Text(
                      '“Your journey to health begins here!”',
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),

                    // Username TextField with decoration
                    _buildTextField(_usernameController, 'Username'),
                    const SizedBox(height: 20),

                    // Name TextField with decoration
                    _buildTextField(_nameController, 'Name'),
                    const SizedBox(height: 20),

                    // Phone Number TextField with decoration
                    _buildTextField(_phoneController, 'Phone Number'),
                    const SizedBox(height: 20),

                    // Password TextField with show password feature
                    TextField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Sign Up Button with customizable color
                    ElevatedButton(
                      onPressed: () {
                        // Handle signup logic here
                        print('Sign Up Button Pressed');
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _buttonColor, // Button background color
                        padding: EdgeInsets.symmetric(
                            vertical: 15), // Button padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create a text field with the provided controller and label
  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
*/
/*
// admin_signup.dart
import 'package:first_app/login_page.dart';
import 'package:flutter/material.dart';
//import 'package:first_app/admin_portal.dart';

class AdminSignupPage extends StatefulWidget {
  @override
  _AdminSignupPageState createState() => _AdminSignupPageState();
}

class _AdminSignupPageState extends State<AdminSignupPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController hospitalNameController = TextEditingController();
  final TextEditingController hospitalAddressController = TextEditingController();
  final TextEditingController hospitalSpecializationController = TextEditingController();
  final List<Map<String, String>> doctors = [];
  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController doctorSpecializationController = TextEditingController();

  void addDoctor() {
    setState(() {
      doctors.add({
        'username': doctorNameController.text,
        'specialization': doctorSpecializationController.text,
      });
      doctorNameController.clear();
      doctorSpecializationController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Signup')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              TextField(
                controller: hospitalNameController,
                decoration: InputDecoration(labelText: 'Hospital Name'),
              ),
              TextField(
                controller: hospitalAddressController,
                decoration: InputDecoration(labelText: 'Hospital Address'),
              ),
              TextField(
                controller: hospitalSpecializationController,
                decoration: InputDecoration(labelText: 'Hospital Specialization'),
              ),
              SizedBox(height: 20),
              Text('Add Doctors', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                controller: doctorNameController,
                decoration: InputDecoration(labelText: 'Doctor Username'),
              ),
              TextField(
                controller: doctorSpecializationController,
                decoration: InputDecoration(labelText: 'Doctor Specialization'),
              ),
              ElevatedButton(
                onPressed: addDoctor,
                child: Text('Add Doctor'),
              ),
              SizedBox(height: 20),
              Text('Doctors List:'),
              Column(
                children: doctors.map((doctor) {
                  return ListTile(
                    title: Text(doctor['username']!),
                    subtitle: Text(doctor['specialization']!),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage()
                        /*username: usernameController.text,
                        hospitalName: hospitalNameController.text,
                        hospitalAddress: hospitalAddressController.text,
                        hospitalSpecialization: hospitalSpecializationController.text,
                        doctors: doctors, specialization: '',
                      )*/,
                    ),
                  );
                },
                child: Text('Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

/*
import 'package:flutter/material.dart';
import 'package:first_app/login_page.dart';

class AdminSignupPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController hospitalNameController = TextEditingController();
  final TextEditingController hospitalAddressController = TextEditingController();
  final TextEditingController specializationController = TextEditingController();
  final TextEditingController doctorListController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Signup')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: usernameController, decoration: InputDecoration(labelText: 'Username')),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            TextField(controller: hospitalNameController, decoration: InputDecoration(labelText: 'Hospital Name')),
            TextField(controller: hospitalAddressController, decoration: InputDecoration(labelText: 'Hospital Address')),
            TextField(controller: specializationController, decoration: InputDecoration(labelText: 'Specialization')),
            TextField(controller: doctorListController, decoration: InputDecoration(labelText: 'Doctors List (comma separated)')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdminLoginPage()));
              },
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'login_page.dart';

class AdminSignupPage extends StatefulWidget {
  const AdminSignupPage({super.key});

  @override
  _AdminSignupPageState createState() => _AdminSignupPageState();
}

class _AdminSignupPageState extends State<AdminSignupPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController hospitalNameController = TextEditingController();
  final TextEditingController hospitalAddressController = TextEditingController();
  final TextEditingController specializationController = TextEditingController();
  final TextEditingController doctorDetailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Signup')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: usernameController, decoration: InputDecoration(labelText: 'Username')),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            TextField(controller: hospitalNameController, decoration: InputDecoration(labelText: 'Hospital Name')),
            TextField(controller: hospitalAddressController, decoration: InputDecoration(labelText: 'Hospital Address')),
            TextField(controller: specializationController, decoration: InputDecoration(labelText: 'Specialization')),
            TextField(controller: doctorDetailsController, decoration: InputDecoration(labelText: 'Doctors List')),            
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminLoginPage(
                      username: usernameController.text,
                      password: passwordController.text,
                      hospitalName: hospitalNameController.text,
                      hospitalAddress: hospitalAddressController.text,
                      specialization: specializationController.text,
                      doctors: doctorDetailsController.text,
                    ),
                  ),
                );
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AdminSignupPage extends StatefulWidget {
  const AdminSignupPage({super.key});

  @override
  _AdminSignupPageState createState() => _AdminSignupPageState();
}

class _AdminSignupPageState extends State<AdminSignupPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController hospitalNameController = TextEditingController();
  final TextEditingController hospitalAddressController = TextEditingController();
  final TextEditingController specializationController = TextEditingController();
  final TextEditingController doctorDetailsController = TextEditingController();

  Future<void> saveAdminDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', usernameController.text);
    await prefs.setString('password', passwordController.text);
    await prefs.setString('hospitalName', hospitalNameController.text);
    await prefs.setString('hospitalAddress', hospitalAddressController.text);
    await prefs.setString('specialization', specializationController.text);
    await prefs.setString('doctors', doctorDetailsController.text);
    await prefs.setBool('isFirstTime', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Signup')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: usernameController, decoration: InputDecoration(labelText: 'Username')),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            TextField(controller: hospitalNameController, decoration: InputDecoration(labelText: 'Hospital Name')),
            TextField(controller: hospitalAddressController, decoration: InputDecoration(labelText: 'Hospital Address')),
            TextField(controller: specializationController, decoration: InputDecoration(labelText: 'Specialization')),
            TextField(controller: doctorDetailsController, decoration: InputDecoration(labelText: 'Doctors List')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await saveAdminDetails();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AdminLoginPage()),
                );
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}