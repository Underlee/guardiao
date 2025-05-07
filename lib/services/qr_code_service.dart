import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

class QRCodeService {
  Widget generateQRCode(String data) {
    return QrImage(
      data: data,
      version: QrVersions.auto,
      size: 200.0,
    );
  }
}