import 'package:flutter/material.dart';
import 'package:orbit_standard_library/orbit_standard_library.dart';
import 'package:scouting_qr/enum/climb_status.dart';
import 'package:scouting_qr/utils/boolean_switch.dart';
import 'package:scouting_qr/utils/selection_divider.dart';

class EndGameForm extends StatefulWidget {
  const EndGameForm({super.key});

  @override
  State<EndGameForm> createState() => _EndGameFormState();
}

class _EndGameFormState extends State<EndGameForm> {
  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: AppBar(
      centerTitle: true,
      elevation: 5,
      title: const Text(
        "Demacia Scouting",
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.deepPurple.shade700,
    ),
    body: Stack(
      children: [
        SingleChildScrollView(
          child: Form(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Column(
                children: [

                  SectionDivider(label: "End Game"),

                  SizedBox(
                    height: 20,
                  ),

                  Selector<ClimbStatus>(
                    options: ClimbStatus.values,
                    placeholder: "Select the status climb of the robot",
                    makeItem: (ClimbStatus climbStatus) => climbStatus.name,
                    validate: always2(null),
                    value: null,
                    onChange: (p0) {
                    },
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  BooleanSwitch(),

                  SizedBox(
                    height: 20,
                  ),
                ]
              ),
            ),
          ),
        )
      ]
    ),
  );
}