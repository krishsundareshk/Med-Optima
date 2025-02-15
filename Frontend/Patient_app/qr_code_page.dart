import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String bookingDetails = ModalRoute.of(context)?.settings.arguments as String? ?? 'Unknown';
    return Scaffold(
      appBar: AppBar(title: Text('Appointment QR Code')),
      body: Center(
        child: QrImage(
          data: 'Appointment Confirmed: $bookingDetails',
          version: QrVersions.auto,
          size: 200.0,
        ),
      ),
    );
  }
}
