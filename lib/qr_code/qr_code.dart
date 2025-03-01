import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatelessWidget{

  const QrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: QrImageView(
        data: "<html><b>abc</b></html>",
        size: 200,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
    );
  }
}