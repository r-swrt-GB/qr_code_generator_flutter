import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeLogic {
  buildQrCode(String targetUrl) {
    return QrImage(
      data: targetUrl,
      version: QrVersions.auto,
      backgroundColor: Colors.white,
      size: 250,
      gapless: true,
    );
  }
}
