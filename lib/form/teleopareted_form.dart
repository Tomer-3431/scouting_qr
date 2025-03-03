import 'package:flutter/material.dart';
import 'package:scouting_qr/data/game_data.dart';
import 'package:scouting_qr/data/teleopareted_data.dart';
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
  int l4Failed = 0;
  int l3Scored = 0;
  int l3Failed = 0;
  int l2Scored = 0;
  int l2failed = 0;
  int l1Scored = 0;
  int l1Failed = 0;

  int processorScored = 0;
  int netScored = 0;
  int netFailed = 0;
  int stolenAlgae = 0;

  @override
  void initState() {
    super.initState();

    if (widget.gameData.teleoparetedData != null) {
      TeleoparetedData data = widget.gameData.teleoparetedData!;

      l4Scored = data.l4Scored;
      l4Failed = data.l4Failed;
      l3Scored = data.l3Scored;
      l3Failed = data.l3Failed;
      l2Scored = data.l2Scored;
      l2failed = data.l2Failed;
      l1Scored = data.l1Scored;
      l1Failed = data.l1Failed;

      processorScored = data.processorScored;
      netScored = data.netScored;
      netFailed = data.netFailed;
      stolenAlgae = data.stolenAlgae;
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
                            icon: Icons.looks_4_outlined,
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
                            icon: Icons.looks_3_outlined,
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
                            icon: Icons.looks_two,
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
                            icon: Icons.looks_two_outlined,
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
                            icon: Icons.looks_one,
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
                            icon: Icons.looks_one_outlined,
                            onChange:(final int p0) => setState(() => l1Failed = p0),
                          ),
                        ),
                      ],
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
    
                    Row(
                      children: [
                        Expanded(
                          child: ScoreCounter(
                            count: netScored,
                            label: "net Scored",
                            icon: Icons.amp_stories,
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
    
                    ScoreCounter(
                      count: stolenAlgae,
                      label: "stolen algae",
                      icon: Icons.wifi_tethering_off_outlined,
                      onChange:(final int p0) => setState(() => stolenAlgae = p0),
                    ),
    
                    SizedBox(
                      height: 20,
                    ),
    
                    Row(
                      children: [
                        RoundedIconButton(
                          icon: Icons.arrow_back, 
                          onPress: () {
                            widget.gameData.teleoparetedData = TeleoparetedData(
                              l4Scored: l4Scored,
                              l4Failed: l4Failed,
                              l3Scored: l3Scored,
                              l3Failed: l3Failed,
                              l2Scored: l2Scored,
                              l2Failed: l2failed,
                              l1Scored: l1Scored,
                              l1Failed: l1Failed,
                              processorScored: processorScored,
                              netScored: netScored,
                              netFailed: netFailed,
                              stolenAlgae: stolenAlgae,
                            );
    
                            Navigator.pushReplacement(
                              context, 
                              MaterialPageRoute(
                                builder: (final BuildContext context) => 
                                  AutonomousForm(gameData: widget.gameData)
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
                            widget.gameData.teleoparetedData = TeleoparetedData(
                              l4Scored: l4Scored,
                              l4Failed: l4Failed,
                              l3Scored: l3Scored,
                              l3Failed: l3Failed,
                              l2Scored: l2Scored,
                              l2Failed: l2failed,
                              l1Scored: l1Scored,
                              l1Failed: l1Failed,
                              processorScored: processorScored,
                              netScored: netScored,
                              netFailed: netFailed,
                              stolenAlgae: stolenAlgae,
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