import 'package:flutter/material.dart';
import 'package:orbit_standard_library/orbit_standard_library.dart';
import 'package:scouting_qr/data/game_data.dart';
import 'package:scouting_qr/data/teleopareted_data.dart';
import 'package:scouting_qr/enum/collection_zone.dart';
import 'package:scouting_qr/widgets/demacia_app_bar.dart';
import 'package:scouting_qr/form/autonomous_form.dart';
import 'package:scouting_qr/form/end_game_form.dart';
import 'package:scouting_qr/widgets/score_counter.dart';
import 'package:scouting_qr/widgets/selection_divider.dart';

class TeleoparetedForm extends StatefulWidget {
  const TeleoparetedForm({
    super.key,
    required this.gameData,
  });
  final GameData gameData;

  @override
  State<TeleoparetedForm> createState() => _TeleoparetedFormState();
}

class _TeleoparetedFormState extends State<TeleoparetedForm> {

  int l4Scored = 0;
  int l3Scored = 0;
  int l2Scored = 0;
  int l1Scored = 0;

  int processorScored = 0;
  int netScored = 0;
  int removeAlgae = 0;

  CollectionZone? collectionZone;

  @override
  void initState() {
    super.initState();

    if (widget.gameData.teleoparetedData != null) {
      TeleoparetedData data = widget.gameData.teleoparetedData!;

      l4Scored = data.l4Scored;
      l3Scored = data.l3Scored;
      l2Scored = data.l2Scored;
      l1Scored = data.l1Scored;

      processorScored = data.processorScored;
      netScored = data.netScored;
      removeAlgae = data.stolenAlgae;

      collectionZone = data.collectionZone;

    } else {
      l4Scored = 0;
      l3Scored = 0;
      l2Scored = 0;
      l1Scored = 0;

      processorScored = 0;
      netScored = 0;
      removeAlgae = 0;

      collectionZone = null;
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
                  children: <Widget>[
                    SectionDivider(label: "Teleopareted"),
    
                    SizedBox(
                      height: 20,
                    ),
    
                    ScoreCounter(
                      count: l4Scored,
                      label: "L4 Scored",
                      icon: Icons.looks_4,
                      onChange:(final int p0) => setState(() => l4Scored = p0),
                    ),
    
                    SizedBox(
                      height: 20,
                    ),
    
                    ScoreCounter(
                      count: l3Scored,
                      label: "L3 Scored",
                      icon: Icons.looks_3,
                      onChange:(final int p0) => setState(() => l3Scored = p0),
                    ),

                    SizedBox(
                      height: 20,
                    ),
    
                    ScoreCounter(
                      count: l2Scored,
                      label: "L2 Scored",
                      icon: Icons.looks_two,
                      onChange:(final int p0) => setState(() => l2Scored = p0),
                    ),
    
                    SizedBox(
                      height: 20,
                    ),
    
                    ScoreCounter(
                      count: l1Scored,
                      label: "L1 Scored",
                      icon: Icons.looks_one,
                      onChange:(final int p0) => setState(() => l1Scored = p0),
                    ),
    
                    SizedBox(
                      height: 30,
                    ),
    
                    ScoreCounter(
                      count: processorScored,
                      label: "processor scored",
                      icon: Icons.spoke_rounded,
                      onChange:(final int p0) => setState(() => processorScored = p0),
                    ),
    
                    SizedBox(
                      height: 20,
                    ),
    
                    ScoreCounter(
                      count: netScored,
                      label: "net Scored",
                      icon: Icons.amp_stories,
                      onChange:(final int p0) => setState(() => netScored = p0),
                    ),

                    ScoreCounter(
                      count: removeAlgae,
                      label: "Remove Algae",
                      icon: Icons.wifi_tethering_off_outlined,
                      onChange:(final int p0) => setState(() => removeAlgae = p0),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    Text(
                      "Enter From Where The Robot Pickdup Corals :",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    Selector<CollectionZone>(
                      options: CollectionZone.values,
                      placeholder: "Select Where The Robot Collected Corals",
                      makeItem: (CollectionZone collectionZone) => collectionZone.title,
                      validate: always2(null),
                      value: collectionZone,
                      onChange: (p0) => collectionZone = p0,
                    ),
    
                    SizedBox(
                      height: 20,
                    ),
    
                    Row(
                      children: [
                        RoundedIconButton(
                          icon: Icons.arrow_back, 
                          onPress: () {
                            if (collectionZone != null) {
                              widget.gameData.teleoparetedData = TeleoparetedData(
                                l4Scored: l4Scored,
                                l3Scored: l3Scored,
                                l2Scored: l2Scored,
                                l1Scored: l1Scored,
                                processorScored: processorScored,
                                netScored: netScored,
                                stolenAlgae: removeAlgae,
                                collectionZone: collectionZone!
                              );
      
                              Navigator.pushReplacement(
                                context, 
                                MaterialPageRoute(
                                  builder: (final BuildContext context) => 
                                    AutonomousForm(gameData: widget.gameData)
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
                            if (collectionZone != null) {
                              widget.gameData.teleoparetedData = TeleoparetedData(
                                l4Scored: l4Scored,
                                l3Scored: l3Scored,
                                l2Scored: l2Scored,
                                l1Scored: l1Scored,
                                processorScored: processorScored,
                                netScored: netScored,
                                stolenAlgae: removeAlgae,
                                collectionZone: collectionZone!
                              );
      
                              Navigator.pushReplacement(
                                context, 
                                MaterialPageRoute(
                                  builder: (final BuildContext context) =>
                                  EndGameForm(
                                    gameData: widget.gameData
                                  )
                                )
                              );
                            }
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
    ),
  );
}