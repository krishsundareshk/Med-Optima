import 'package:flutter/material.dart';
import 'package:your_app/routes/app_router.dart';
import 'package:your_app/theme.dart';
import 'package:your_app/screens/login_page.dart';
import 'package:your_app/screens/signup_page.dart';
import 'package:your_app/screens/home_page.dart';
import 'package:your_app/screens/past_appointments_page.dart';
import 'package:your_app/screens/prescriptions_page.dart';
import 'package:your_app/screens/symptoms_chat_page.dart';
import 'package:your_app/screens/hospital_selection_page.dart';
import 'package:your_app/screens/timeslot_booking_page.dart';
import 'package:your_app/screens/qr_code_page.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const PatientApp());
}

class PatientApp extends StatelessWidget {
  const PatientApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patient App',
      theme: appTheme,
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}