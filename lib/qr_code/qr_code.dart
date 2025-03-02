import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scouting_qr/data/game_data.dart';

class QrCode extends StatelessWidget{

  QrCode({
    super.key,
    required this.gameData
  });
  GameData gameData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: QrImageView(
        data: gameData.toString(),
        size: 200,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
    );
  }
}