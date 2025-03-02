import 'package:flutter/material.dart';
import 'package:orbit_standard_library/orbit_standard_library.dart';
import 'package:scouting_qr/data/detail_data.dart';
import 'package:scouting_qr/data/game_data.dart';
import 'package:scouting_qr/enum/team_station.dart';
import 'package:scouting_qr/form/autonomous_form.dart';
import 'package:scouting_qr/widgets/boolean_switch.dart';
import 'package:scouting_qr/widgets/score_counter.dart';
import 'package:scouting_qr/widgets/selection_divider.dart';

class DetailsForm extends StatefulWidget {
  DetailsForm({
    super.key,
    required this.gameData,
  });
  GameData gameData;

  @override
  State<DetailsForm> createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsForm> {

  final TextEditingController scouterName = TextEditingController();
  final TextEditingController teamNumber = TextEditingController();
  final TextEditingController matchNumber = TextEditingController();
  TeamStation teamStation = TeamStation.BLUE_1;
  bool isPlayed = true;

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
                  SectionDivider(label: "Details"),

                  TextField(
                    controller: scouterName,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Enter Scouter Name",
                      prefixIcon: const Icon(Icons.person),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: scouterName.clear,
                      )
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Selector<TeamStation>(
                    options: TeamStation.values,
                    placeholder: "Select team Station",
                    makeItem: (TeamStation teamStation) => teamStation.title,
                    validate: always2(null),
                    value: null,
                    onChange: (p0) {
                      teamStation = p0;
                    },
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  TextField(
                    controller: teamNumber,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "enter team number",
                      prefixIcon: const Icon(Icons.people),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: matchNumber.clear,
                      )
                    ),
                    keyboardType: TextInputType.number, 
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  TextField(
                    controller: matchNumber,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "enter match number",
                      prefixIcon: const Icon(Icons.numbers),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed:
                          matchNumber.clear,
                      )
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  BooleanSwitch(
                    onChange: (value) => setState(() => isPlayed = value),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RoundedIconButton(
                        icon: Icons.arrow_forward,
                        onPress: () {
                          widget.gameData.detailsData = DetailsData(
                            teamStation: teamStation, 
                            scouterName: scouterName.text, 
                            teamNumber: int.parse(teamNumber.text), 
                            matchNumber: int.parse(matchNumber.text), 
                            isPlayed: isPlayed
                          );

                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(
                              builder: (final BuildContext context) =>
                                AutonomousForm(gameData: widget.gameData)
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