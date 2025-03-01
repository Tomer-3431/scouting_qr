import 'package:flutter/material.dart';
import 'package:scouting_qr/data/game_data.dart';
import 'package:scouting_qr/data/teleopareted_data.dart';
import 'package:scouting_qr/form/autonomous_form.dart';
import 'package:scouting_qr/qr_code/qr_code.dart';
import 'package:scouting_qr/widgets/score_counter.dart';
import 'package:scouting_qr/widgets/selection_divider.dart';

class TeleoparetedForm extends StatefulWidget {
  TeleoparetedForm({
    super.key,
    required this.gameData,
  });
  GameData gameData;

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
                          onChange:(p0) {
                            l4Scored = p0;
                          },
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        child: ScoreCounter(
                          count: l4Failed,
                          label: "L4 Faild",
                          icon: Icons.clear,
                          onChange:(p0) {
                            l4Failed = p0;
                          },
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
                          onChange:(p0) {
                            l3Scored = p0;
                          },
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        child: ScoreCounter(
                          count: l3Failed,
                          label: "L3 Faild",
                          icon: Icons.clear,
                          onChange:(p0) {
                            l3Failed = p0;
                          },
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
                          onChange:(p0) {
                            l2Scored = p0;
                          },
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        child: ScoreCounter(
                          count: l2failed,
                          label: "L2 Faild",
                          icon: Icons.clear,
                          onChange:(p0) {
                            l2failed = p0;
                          },
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
                          onChange:(p0) {
                            l1Scored = p0;
                          },
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        child: ScoreCounter(
                          count: l1Failed,
                          label: "L1 Faild",
                          icon: Icons.clear,
                          onChange:(p0) {
                            l1Failed = p0;
                          },
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
                    icon: Icons.abc,
                    onChange: (p0) {
                      processorScored = p0;
                    },
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
                          icon: Icons.looks_3,
                          onChange:(p0) {
                            netScored = p0;
                          },
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        child: ScoreCounter(
                          count: netFailed,
                          label: "net Faild",
                          icon: Icons.clear,
                          onChange:(p0) {
                            netFailed = p0;
                          },
                        ),
                      ),
                    ],
                  ),

                  ScoreCounter(
                    count: stolenAlgae,
                    label: "stolen algae",
                    icon: Icons.wifi_tethering_off_outlined,
                    onChange: (p0) {
                      stolenAlgae = p0;
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
                            Navigator.pop(
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

                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (final BuildContext context) =>
                              QrCode()
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