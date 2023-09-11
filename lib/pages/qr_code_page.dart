import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../components/qr_code.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  TextEditingController targetUrlController = TextEditingController();
  late QrImage generatedQrCode;

  @override
  void initState() {
    generatedQrCode = QrCodeLogic().buildQrCode('https://www.google.com/');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(
          image: AssetImage('assets/images/nwu_logo_white.png'),
          width: 120,
        ),
        backgroundColor: const Color(0xFF6d067c),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Divider(
              height: 15,
              thickness: 20,
              color: Color(0xFF14738e),
            ),
            const Spacer(),
            /////////////////////////////////
            ///QR code
            generatedQrCode,
            /////////////////////////////////
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: targetUrlController,
              ),
            ),
            ElevatedButton(
              onPressed: (() => setState(() => generatedQrCode =
                  QrCodeLogic().buildQrCode(targetUrlController.value.text))),
              child: const Text('Generate'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
