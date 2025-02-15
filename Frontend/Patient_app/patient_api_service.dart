import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://console.aiven.io/account/a50f3d62ddda/project/bharat-4970/services/hackathon-appointment-system/overview';
/*provide the server url*/
  Future<Map<String, dynamic>> loginDoctor(
      String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/doctors/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return {'success': true, 'data': jsonDecode(response.body)};
      } else {
        return {
          'success': false,
          'message': jsonDecode(response.body)['error']
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Network error: ${e.toString()}'};
    }
  }

  Future<void> updateAvailability(int doctorId, bool isAvailable) async {
    try {
      await http.put(
        Uri.parse('$baseUrl/doctors/$doctorId/availability'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'is_available': isAvailable}),
      );
    } catch (e) {
      print('Error updating availability: $e');
    }
  }
}
