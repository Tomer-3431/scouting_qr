import 'package:flutter/material.dart';
import 'package:scouting_qr/data/game_data.dart';
import 'package:scouting_qr/form/details_form.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Demacia Scouting",
        home: DetailsForm(gameData: GameData()),
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
      );
  }
}
