import 'package:flutter/material.dart';

class DemaciaAppBar extends AppBar {
  DemaciaAppBar({super.key});

  @override
  final bool centerTitle = true;

  @override
  final double elevation = 7;

  @override
  final Widget title = Text(
    "Demacia Scouting",
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );

  @override
  final Widget leading = Text(
    "2.1.0",
    textAlign: TextAlign.end,
    style: TextStyle(
      color: Colors.white
    )
  );

  @override
  final Color backgroundColor = Colors.deepPurple.shade700;
}
