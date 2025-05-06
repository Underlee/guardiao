import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../lib/services/qr_code_service.dart';

void main() {
  testWidgets('QR Code is generated correctly', (WidgetTester tester) async {
    final qrCodeService = QRCodeService();
    final qrCodeWidget = qrCodeService.generateQRCode('Test Data');

    await tester.pumpWidget(MaterialApp(home: Scaffold(body: qrCodeWidget)));

    expect(find.byType(QrImage), findsOneWidget);
    expect(find.text('Test Data'), findsNothing); // Data is encoded, not visible
  });
}