import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatelessWidget{

  const QrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: "1234",
      size: 200,
    );
  }
}