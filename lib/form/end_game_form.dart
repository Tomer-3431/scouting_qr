import 'package:flutter/material.dart';
import 'package:orbit_standard_library/orbit_standard_library.dart';
import 'package:scouting_qr/data/end_game_data.dart';
import 'package:scouting_qr/data/game_data.dart';
import 'package:scouting_qr/widgets/demacia_app_bar.dart';
import 'package:scouting_qr/enum/climb_status.dart';
import 'package:scouting_qr/form/general_form.dart';
import 'package:scouting_qr/form/teleopareted_form.dart';
import 'package:scouting_qr/widgets/score_counter.dart';
import 'package:scouting_qr/widgets/selection_divider.dart';

class EndGameForm extends StatefulWidget {
  const EndGameForm({
    super.key,
    required this.gameData,
  });
  final GameData gameData;

  @override
  State<EndGameForm> createState() => _EndGameFormState();
}

class _EndGameFormState extends State<EndGameForm> {
  
  ClimbStatus? climbStatus;

  @override
  void initState() {
    super.initState();

    if (widget.gameData.endGameData != null) {
      EndGameData data = widget.gameData.endGameData!;

      climbStatus = data.climbStatus;
    }
  }

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: false,
    child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: DemaciaAppBar(),
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
    
                    Row(
                      children: [
                        RoundedIconButton(
                          icon: Icons.arrow_back, 
                          onPress: () {
                            if (climbStatus != null) {
                              widget.gameData.endGameData = EndGameData(
                                climbStatus: climbStatus!,
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
    ),
  );
}