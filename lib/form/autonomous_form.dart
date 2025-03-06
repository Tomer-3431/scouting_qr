import 'package:flutter/material.dart';
import 'package:scouting_qr/data/autonomous_data.dart';
import 'package:scouting_qr/data/game_data.dart';
import 'package:scouting_qr/widgets/demacia_app_bar.dart';
import 'package:scouting_qr/form/details_form.dart';
import 'package:scouting_qr/form/teleopareted_form.dart';
import 'package:scouting_qr/widgets/boolean_switch.dart';
import 'package:scouting_qr/widgets/score_counter.dart';
import 'package:scouting_qr/widgets/selection_divider.dart';

class AutonomousForm extends StatefulWidget {
  const AutonomousForm({
    super.key,
    required this.gameData,
  });
  final GameData gameData;

  @override
  State<AutonomousForm> createState() => _AutonomousFormState();
}

class _AutonomousFormState extends State<AutonomousForm> {
  bool isLeave = true;

  int l4Scored = 0;
  int l3Scored = 0;
  int l2Scored = 0;
  int l1Scored = 0;

  int netScored = 0;
  int removeAlgae = 0;

  @override
  void initState() {
    super.initState();

    if (widget.gameData.autonomousData != null) {
      AutonomousData data = widget.gameData.autonomousData!;

      isLeave = data.isLeave;

      l4Scored = data.l4Scored;
      l3Scored = data.l3Scored;
      l2Scored = data.l2Scored;
      l1Scored = data.l1Scored;

      netScored = data.netScored;
      removeAlgae = data.removeAlgae;
    } else {
      isLeave = true;

      l4Scored = 0;
      l3Scored = 0;
      l2Scored = 0;
      l1Scored = 0;

      netScored = 0;
      removeAlgae = 0;
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
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: <Widget>[
                        SectionDivider(label: "Autonomous"),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Check The Switch If The Team Leaved In Auto",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                                BooleanSwitch(
                                  value: isLeave,
                                  onChange: (value) =>
                                      setState(() => isLeave = value),
                                ),
                              ],
                            )),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        ScoreCounter(
                          count: l4Scored,
                          label: "L4 Scored",
                          icon: Icons.looks_4,
                          onChange: (final int p0) =>
                              setState(() => l4Scored = p0),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        ScoreCounter(
                          count: l3Scored,
                          label: "L3 Scored",
                          icon: Icons.looks_3,
                          onChange: (final int p0) =>
                              setState(() => l3Scored = p0),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        ScoreCounter(
                          count: l2Scored,
                          label: "L2 Scored",
                          icon: Icons.looks_two,
                          onChange: (final int p0) =>
                              setState(() => l2Scored = p0),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        ScoreCounter(
                          count: l1Scored,
                          label: "L1 Scored",
                          icon: Icons.looks_one,
                          onChange: (final int p0) =>
                              setState(() => l1Scored = p0),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        ScoreCounter(
                          count: netScored,
                          label: "Net Scored",
                          icon: Icons.amp_stories,
                          onChange: (final int p0) =>
                              setState(() => netScored = p0),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ScoreCounter(
                          count: removeAlgae,
                          label: "remove algae",
                          icon: Icons.spoke_outlined,
                          onChange: (final int p0) =>
                              setState(() => removeAlgae = p0),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            RoundedIconButton(
                                icon: Icons.arrow_back,
                                onPress: () {
                                  widget.gameData.autonomousData =
                                      AutonomousData(
                                    isLeave: isLeave,
                                    l4Scored: l4Scored,
                                    l3Scored: l3Scored,
                                    l2Scored: l2Scored,
                                    l1Scored: l1Scored,
                                    netScored: netScored,
                                    removeAlgae: removeAlgae,
                                  );

                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder:
                                              (final BuildContext context) =>
                                                  DetailsForm(
                                                      gameData:
                                                          widget.gameData)));
                                },
                                onLongPress: () {}),
                            SizedBox(
                              width: 120,
                            ),
                            RoundedIconButton(
                                icon: Icons.arrow_forward,
                                onPress: () {
                                  widget.gameData.autonomousData =
                                      AutonomousData(
                                    isLeave: isLeave,
                                    l4Scored: l4Scored,
                                    l3Scored: l3Scored,
                                    l2Scored: l2Scored,
                                    l1Scored: l1Scored,
                                    netScored: netScored,
                                    removeAlgae: removeAlgae,
                                  );

                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder:
                                              (final BuildContext context) =>
                                                  TeleoparetedForm(
                                                      gameData:
                                                          widget.gameData)));
                                },
                                onLongPress: () {})
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
