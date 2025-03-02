import 'package:flutter/material.dart';
import 'package:orbit_standard_library/orbit_standard_library.dart';
import 'package:scouting_qr/data/detail_data.dart';
import 'package:scouting_qr/data/end_game_data.dart';
import 'package:scouting_qr/data/game_data.dart';
import 'package:scouting_qr/data/general_data.dart';
import 'package:scouting_qr/enum/algae_in_reef.dart';
import 'package:scouting_qr/enum/team_station.dart';
import 'package:scouting_qr/form/autonomous_form.dart';
import 'package:scouting_qr/form/end_game_form.dart';
import 'package:scouting_qr/qr_code/qr_code.dart';
import 'package:scouting_qr/widgets/boolean_switch.dart';
import 'package:scouting_qr/widgets/score_counter.dart';
import 'package:scouting_qr/widgets/selection_divider.dart';

class GeneralForm extends StatefulWidget {
  GeneralForm({
    super.key,
    required this.gameData,
  });
  GameData gameData;

  @override
  State<GeneralForm> createState() => _GeneralFormState();
}

class _GeneralFormState extends State<GeneralForm> {

  AlgaeInReef? algaeInReef;
  bool isAlgaeFloorCollect = false;
  bool isCoralFloorCollect = false;
  bool isTouchedCage = false;

  bool didDefense = false;
  int defenseLevel = 0;
  bool wasDefended = false;
  int copeWithDefense = 0;

  int drivingLevel = 0;
  bool isStuck = false;
  bool isFoulist = false;
  
  String comments = "";

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
                vertical: 10
              ),
              child: Column(
                children: <Widget>[
                  SectionDivider(label: "General"),

                  SizedBox(
                    height: 30,
                  ),

                  Row(
                    children: [
                      RoundedIconButton(
                        icon: Icons.arrow_back, 
                        onPress: () {
                            Navigator.pushReplacement(
                              context, 
                              MaterialPageRoute(
                                builder: (final BuildContext context) => 
                                  EndGameForm(gameData: widget.gameData)
                              )  
                            );
                        }, 
                        onLongPress: () {}
                      ),

                      SizedBox(
                        width: 80,
                      ),

                      RoundedIconButton(
                        icon: Icons.arrow_forward,
                        onPress: () {
                          widget.gameData.generalData = GeneralData(
                            algaeInReef: algaeInReef,
                            isAlgaeFloorCollect: isAlgaeFloorCollect,
                            isCoralFloorCollect: isCoralFloorCollect,
                            isTouchedCage: isAlgaeFloorCollect,
                            didDefense: didDefense,
                            defenseLevel: defenseLevel,
                            wasDefended: wasDefended,
                            copeWithDefense: copeWithDefense,
                            drivingLevel: drivingLevel,
                            isStuck: isStuck,
                            isFoulist: isFoulist,
                            comments: comments
                          );

                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(
                              builder: (final BuildContext context) =>
                                QrCode(gameData: widget.gameData)
                            ) 
                          );
                        },
                        onLongPress: () {},
                      )
                    ],
                  )

                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}