import 'package:flutter/material.dart';
import 'package:orbit_standard_library/orbit_standard_library.dart';
import 'package:scouting_qr/data/end_game_data.dart';
import 'package:scouting_qr/data/game_data.dart';
import 'package:scouting_qr/enum/climb_status.dart';
import 'package:scouting_qr/form/general_form.dart';
import 'package:scouting_qr/form/teleopareted_form.dart';
import 'package:scouting_qr/widgets/boolean_switch.dart';
import 'package:scouting_qr/widgets/score_counter.dart';
import 'package:scouting_qr/widgets/selection_divider.dart';

class EndGameForm extends StatefulWidget {
  EndGameForm({
    super.key,
    required this.gameData,
  });
  GameData gameData;

  @override
  State<EndGameForm> createState() => _EndGameFormState();
}

class _EndGameFormState extends State<EndGameForm> {
  
  ClimbStatus? climbStatus;
  bool isClimbSuccess = false;

  @override
  void initState() {
    super.initState();

    if (widget.gameData.endGameData != null) {
      EndGameData data = widget.gameData.endGameData!;

      climbStatus = data.climbStatus;
      isClimbSuccess = data.isClimbSuccess;
    }
  }

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

                  Text(
                    "Choose The Status Climb Of The Robot: ",
                    style: TextStyle(fontSize: 18),
                  ),
                  Selector<ClimbStatus>(
                    options: [
                      ClimbStatus.DEEP,
                      ClimbStatus.SHALLOW,
                      ClimbStatus.DIDNT
                    ],
                    placeholder: "Select The Status Climb Of The Robot",
                    makeItem: (ClimbStatus climbStatus) => climbStatus.title,
                    validate: always2(null),
                    value: climbStatus,
                    onChange: (p0) => climbStatus = p0
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Text(
                    "Check This Switch If The Climb Was Successfull: ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  BooleanSwitch(
                    onChange: (value) => setState(() => isClimbSuccess = value),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      RoundedIconButton(
                        icon: Icons.arrow_back, 
                        onPress: () {
                          if (climbStatus != null) {
                            widget.gameData.endGameData = EndGameData(
                              climbStatus: climbStatus!,
                              isClimbSuccess: isClimbSuccess
                            );
                            
                            Navigator.pushReplacement(
                              context, 
                              MaterialPageRoute(
                                builder: (final BuildContext context) => 
                                  TeleoparetedForm(gameData: widget.gameData)
                              )  
                            );
                          }
                        }, 
                        onLongPress: () {}
                      ),

                      SizedBox(
                        width: 80,
                      ),

                      RoundedIconButton(
                        icon: Icons.arrow_forward,
                        onPress: () {
                          if (climbStatus != null) {
                            widget.gameData.endGameData = EndGameData(
                              climbStatus: climbStatus!,
                              isClimbSuccess: isClimbSuccess
                            );

                            Navigator.pushReplacement(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => 
                                  GeneralForm(gameData: widget.gameData),
                              )
                            );
                          }
                        },
                        onLongPress: () {},
                      )
                    ],
                  )
                ]
              ),
            ),
          ),
        )
      ]
    ),
  );
}