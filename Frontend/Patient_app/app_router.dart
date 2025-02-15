import 'package:flutter/material.dart';
import 'package:your_app/screens/login_page.dart';
import 'package:your_app/screens/signup_page.dart';
import 'package:your_app/screens/home_page.dart';
import 'package:your_app/screens/past_appointments_page.dart';
import 'package:your_app/screens/prescriptions_page.dart';
import 'package:your_app/screens/symptoms_chat_page.dart';
import 'package:your_app/screens/hospital_selection_page.dart';
import 'package:your_app/screens/timeslot_booking_page.dart';
import 'package:your_app/screens/qr_code_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignupPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/past_appointments':
        return MaterialPageRoute(builder: (_) => PastAppointmentsPage());
      case '/prescriptions':
        return MaterialPageRoute(builder: (_) => PrescriptionsPage());
      case '/symptoms_chat':
        return MaterialPageRoute(builder: (_) => SymptomsChatPage());
      case '/hospital_selection':
        return MaterialPageRoute(builder: (_) => HospitalSelectionPage());
      case '/timeslot_booking':
        return MaterialPageRoute(builder: (_) => TimeslotBookingPage());
      case '/qr_code':
        return MaterialPageRoute(builder: (_) => QRCodePage());
      default:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}

