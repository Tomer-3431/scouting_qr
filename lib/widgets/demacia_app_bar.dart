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
  final Color backgroundColor = Colors.deepPurple.shade700;
}