import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orbit_standard_library/orbit_standard_library.dart';
import 'package:scouting_qr/data/game_data.dart';
import 'package:scouting_qr/data/general_data.dart';
import 'package:scouting_qr/widgets/demacia_app_bar.dart';
import 'package:scouting_qr/enum/algae_in_reef.dart';
import 'package:scouting_qr/form/end_game_form.dart';
import 'package:scouting_qr/qr_code/main_qr_code.dart';
import 'package:scouting_qr/widgets/boolean_switch.dart';
import 'package:scouting_qr/widgets/score_counter.dart';
import 'package:scouting_qr/widgets/selection_divider.dart';
import 'package:scouting_qr/widgets/slider.dart';

class GeneralForm extends StatefulWidget {
  const GeneralForm({
    super.key,
    required this.gameData,
  });
  final GameData gameData;

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
  
  TextEditingController comments = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.gameData.generalData != null) {
      GeneralData data = widget.gameData.generalData!;

      algaeInReef = data.algaeInReef;
      isAlgaeFloorCollect = data.isAlgaeFloorCollect;
      isCoralFloorCollect = data.isCoralFloorCollect;
      isTouchedCage = data.isTouchedCage;

      didDefense = data.didDefense;
      defenseLevel = data.defenseLevel;
      wasDefended = data.wasDefended;
      copeWithDefense = data.copeWithDefense;

      drivingLevel = data.drivingLevel;
      isStuck = data.isStuck;
      isFoulist = data.isFoulist;

      comments.text = data.comments;
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
                  vertical: 10
                ),
                child: Column(
                  children: <Widget>[
                    SectionDivider(label: "General"),
    
                    SizedBox(
                      height: 20,
                    ),
    
                    Text(
                      "Choose What The Team Did With Algae In Reef: ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    Selector<AlgaeInReef>(
                      options: [
                        AlgaeInReef.DIDNT_TRY,
                        AlgaeInReef.DIRECT,
                        AlgaeInReef.DROP,
                      ],
                      placeholder: "Select what the team did with algae in the reef",
                      makeItem: (AlgaeInReef algaeInReef) => algaeInReef.title,
                      validate: always2(null),
                      value: algaeInReef,
                      onChange: (p0) => algaeInReef = p0,
                    ),
    
                    SizedBox(
                      height: 20,
                    ),
    
                    Text(
                      "Select If Algae In The Floor Was Collected: ", 
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    BooleanSwitch(
                      onChange: (value) => isAlgaeFloorCollect = value,
                    ),
    
                    SizedBox(
                      height: 20,
                    ),
    
                    Text(
                      "Select If Coral In The Floor Was Collected: ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    BooleanSwitch(
                      onChange: (value) => isAlgaeFloorCollect = value,
                    ),
    
                    SizedBox(
                      height: 30,
                    ),
    
                    Text(
                      "Select If The Team Did Defense: ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    BooleanSwitch(
                      onChange: (value) => didDefense = value,
                    ),
    
                    SizedBox(
                      height: 10,
                    ),
    
                    LevelSlider(
                      label: "Defense Level",
                      min: 0,
                      max: 5,
                      divisions: 5,
                      onChange: (value) => setState(() => defenseLevel = value.toInt()),
                      value: defenseLevel.toDouble(),
                    ),
    
                    SizedBox(
                      height: 30,
                    ),
    
                    Text(
                      "Select If The Team Was Defended: ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    BooleanSwitch(
                      onChange: (value) => wasDefended = value,
                    ),
    
                    SizedBox(
                      height: 10,
                    ),
    
                    LevelSlider(
                      label: "Cope With Defense Level", 
                      divisions: 5, 
                      max: 5, 
                      min: 0, 
                      onChange: (value) => setState(() => copeWithDefense = value.toInt()), 
                      value: copeWithDefense.toDouble()
                    ),
    
                    SizedBox(
                      height: 30,
                    ),
    
                    LevelSlider(
                      label: "Driving Level", 
                      divisions: 5, 
                      max: 5, 
                      min: 0, 
                      onChange: (value) => setState(() => drivingLevel = value.toInt()), 
                      value: drivingLevel.toDouble()
                    ),
    
                    SizedBox(
                      height: 20,
                    ),
    
                        Column(
                          children: [
                            Text(
                              "Select If The Robot Was Stuck: ",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                            BooleanSwitch(
                              onChange: (value) => isStuck = value,
                            )
                          ],
                        ),
    
                        SizedBox(
                          height: 20,
                        ),
    
                        Column(
                          children: [
                            Text(
                              "Select If the Robot Was Foulist",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                            BooleanSwitch(
                              onChange: (value) => isFoulist = value,
                            )
                          ],
                        ),
    
                    SizedBox(
                      height: 25,
                    ),
    
                    TextField(
                      controller: comments,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Enter Comments",
                        prefix: const Icon(Icons.comment),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: comments.clear,
                        )
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.deny(RegExp(r'[!=,(){}|<>]'))
                      ]
                    ),
    
                    SizedBox(
                      height: 30,
                    ),
    
                    Row(
                      children: [
                        RoundedIconButton(
                          icon: Icons.arrow_back, 
                          onPress: () {
                            if (algaeInReef != null) {
                              widget.gameData.generalData = GeneralData(
                                algaeInReef: algaeInReef!,
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
                                comments: comments.text
                              );
    
                              Navigator.pushReplacement(
                                context, 
                                MaterialPageRoute(
                                  builder: (final BuildContext context) => 
                                    EndGameForm(gameData: widget.gameData)
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
                            if (algaeInReef != null) {
                              widget.gameData.generalData = GeneralData(
                                algaeInReef: algaeInReef!,
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
                                comments: comments.text
                              );

                              Navigator.pushReplacement(
                                context, 
                                MaterialPageRoute(
                                  builder: (final BuildContext context) =>
                                    MainQrCode(gameData: widget.gameData)
                                ) 
                              );
                            }
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
    ),
  );
}