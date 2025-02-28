import 'package:flutter/material.dart';
import 'package:scouting_qr/qr_code.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: QrCode()
    );
  }
}
