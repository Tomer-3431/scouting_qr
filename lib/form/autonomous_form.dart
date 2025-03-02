import 'package:flutter/material.dart';
import 'package:orbit_standard_library/orbit_standard_library.dart';
import 'package:scouting_qr/data/autonomous_data.dart';
import 'package:scouting_qr/data/game_data.dart';
import 'package:scouting_qr/enum/autonomous_position.dart';
import 'package:scouting_qr/enum/collection_zone.dart';
import 'package:scouting_qr/form/details_form.dart';
import 'package:scouting_qr/form/teleopareted_form.dart';
import 'package:scouting_qr/widgets/boolean_switch.dart';
import 'package:scouting_qr/widgets/score_counter.dart';
import 'package:scouting_qr/widgets/selection_divider.dart';

class AutonomousForm extends StatefulWidget {
  AutonomousForm({
    required this.gameData,
    super.key
  });
  GameData gameData;

  @override
  State<AutonomousForm> createState() => _AutonomousFormState();
}

class _AutonomousFormState extends State<AutonomousForm> {

  AutonomousPosition? autoStartingPosition;
  bool isLeave = false;

  int l4Scored = 0;
  int l4Failed = 0;
  int l3Scored = 0;
  int l3Failed = 0;
  int l2Scored = 0;
  int l2failed = 0;
  int l1Scored = 0;
  int l1Failed = 0;

  int netScored = 0;
  int netFailed = 0;
  int removeAlgae = 0;

  CollectionZone? collectionZone;

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
                  SectionDivider(label: "Autonomous"),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: BooleanSwitch(
                          onChange: (value) => setState(() {
                            isLeave = value;
                          }),
                        )
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        child: Selector<AutonomousPosition>(
                          options: AutonomousPosition.values,
                          placeholder: "Select autonomation start",
                          makeItem: (AutonomousPosition autoPosition) => autoPosition.name,
                          validate: always2(null),
                          value: autoStartingPosition,
                          onChange: (p0) => autoStartingPosition = p0,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: ScoreCounter(
                          count: l4Scored,
                          label: "L4 Scored",
                          icon: Icons.looks_4,
                          onChange:(final int p0) => setState(() => l4Scored = p0),
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        child: ScoreCounter(
                          count: l4Failed,
                          label: "L4 Failed",
                          icon: Icons.clear,
                          onChange:(final int p0) => setState(() => l4Failed = p0),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: ScoreCounter(
                          count: l3Scored,
                          label: "L3 Scored",
                          icon: Icons.looks_3,
                          onChange:(final int p0) => setState(() => l3Scored = p0),
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        child: ScoreCounter(
                          count: l3Failed,
                          label: "L3 Failed",
                          icon: Icons.clear,
                          onChange:(final int p0) => setState(() => l3Failed = p0),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: ScoreCounter(
                          count: l2Scored,
                          label: "L2 Scored",
                          icon: Icons.looks_3,
                          onChange:(final int p0) => setState(() => l2Scored = p0),
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        child: ScoreCounter(
                          count: l2failed,
                          label: "L2 Failed",
                          icon: Icons.clear,
                          onChange:(final int p0) => setState(() => l2failed = p0),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: ScoreCounter(
                          count: l1Scored,
                          label: "L1 Scored",
                          icon: Icons.looks_3,
                          onChange:(final int p0) => setState(() => l1Scored = p0),
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        child: ScoreCounter(
                          count: l1Failed,
                          label: "L1 Failed",
                          icon: Icons.clear,
                          onChange:(final int p0) => setState(() => l1Failed = p0),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: ScoreCounter(
                          count: netScored,
                          label: "net Scored",
                          icon: Icons.looks_3,
                          onChange:(final int p0) => setState(() => netScored = p0),
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        child: ScoreCounter(
                          count: netFailed,
                          label: "net Failed",
                          icon: Icons.clear,
                          onChange:(final int p0) => setState(() => netFailed = p0),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  ScoreCounter(
                    count: removeAlgae,
                    label: "remove algae",
                    icon: Icons.ballot,
                    onChange:(final int p0) => setState(() => removeAlgae = p0),
                  ),

                  Selector<CollectionZone>(
                    options: CollectionZone.values,
                    placeholder: "Select where the robot collected corals",
                    makeItem: (CollectionZone collectionZone) => collectionZone.name,
                    validate: always2(null),
                    value: collectionZone,
                    onChange: (p0) {
                      collectionZone = p0;
                    },
                  ),

                  SizedBox(
                    height: 20,
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
                                  DetailsForm(gameData: widget.gameData)
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
                          widget.gameData.autonomousData = AutonomousData(
                            startingAuto: autoStartingPosition,
                            isLeave: isLeave,
                            l4Scored: l4Scored,
                            l4Failed: l4Failed,
                            l3Scored: l3Scored,
                            l3Failed: l3Failed,
                            l2Scored: l2Scored,
                            l2Failed: l2failed,
                            l1Scored: l1Scored,
                            l1Failed: l1Failed,
                            netScored: netScored,
                            netFailed: netFailed,
                            removeAlgae: removeAlgae,
                            collectionZone: collectionZone
                          );

                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(
                              builder: (final BuildContext context) =>
                                TeleoparetedForm(gameData: widget.gameData)
                            )
                          );
                        }, 
                        onLongPress: () {}
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