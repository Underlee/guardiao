import 'package:flutter/material.dart';
import '../services/qr_code_service.dart';

class QRCodeTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test QR Code'),
      ),
      body: Center(
        child: QRCodeService().generateQRCode(
          'Visitante: João Silva, Data: 2025-05-10, Hora: 14:00',
        ),
      ),
    );
  }
}