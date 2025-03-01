import 'package:flutter/material.dart';
import 'package:scouting_qr/utils/score_counter.dart';
import 'package:scouting_qr/utils/selection_divider.dart';

class TeleoparetedForm extends StatefulWidget {
  const TeleoparetedForm({super.key});

  @override
  State<TeleoparetedForm> createState() => _TeleoparetedFormState();
}

class _TeleoparetedFormState extends State<TeleoparetedForm> {
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
                          count: 2,
                          label: "L4 Scored",
                          icon: Icons.looks_4,
                          onChange:(p0) {
                            
                          },
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        child: ScoreCounter(
                          count: 2,
                          label: "L4 Faild",
                          icon: Icons.clear,
                          onChange:(p0) {
                            
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
                          count: 2,
                          label: "L3 Scored",
                          icon: Icons.looks_3,
                          onChange:(p0) {
                            
                          },
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        child: ScoreCounter(
                          count: 2,
                          label: "L3 Faild",
                          icon: Icons.clear,
                          onChange:(p0) {
                            
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
                          count: 2,
                          label: "L2 Scored",
                          icon: Icons.looks_3,
                          onChange:(p0) {
                            
                          },
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        child: ScoreCounter(
                          count: 2,
                          label: "L2 Faild",
                          icon: Icons.clear,
                          onChange:(p0) {
                            
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
                          count: 2,
                          label: "L1 Scored",
                          icon: Icons.looks_3,
                          onChange:(p0) {
                            
                          },
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        child: ScoreCounter(
                          count: 2,
                          label: "L1 Faild",
                          icon: Icons.clear,
                          onChange:(p0) {
                            
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  ScoreCounter(
                    count: 2,
                    label: "processor scored",
                    icon: Icons.abc,
                    onChange: (p0) {
                      
                    },
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: ScoreCounter(
                          count: 2,
                          label: "net Scored",
                          icon: Icons.looks_3,
                          onChange:(p0) {
                            
                          },
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        child: ScoreCounter(
                          count: 2,
                          label: "net Faild",
                          icon: Icons.clear,
                          onChange:(p0) {
                            
                          },
                        ),
                      ),
                    ],
                  ),

                  ScoreCounter(
                    count: 2,
                    label: "stolen algae",
                    icon: Icons.wifi_tethering_off_outlined,
                    onChange: (p0) {
                      
                    },
                  ),

                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}