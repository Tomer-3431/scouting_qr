import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orbit_standard_library/orbit_standard_library.dart';
import 'package:scouting_qr/data/detail_data.dart';
import 'package:scouting_qr/data/game_data.dart';
import 'package:scouting_qr/qr_code/not_played_qr_code.dart';
import 'package:scouting_qr/widgets/demacia_app_bar.dart';
import 'package:scouting_qr/enum/team_station.dart';
import 'package:scouting_qr/enum/team.dart';
import 'package:scouting_qr/form/autonomous_form.dart';
import 'package:scouting_qr/widgets/boolean_switch.dart';
import 'package:scouting_qr/widgets/score_counter.dart';
import 'package:scouting_qr/widgets/selection_divider.dart';

class DetailsForm extends StatefulWidget {
  const DetailsForm({
    super.key,
    required this.gameData,
  });
  final GameData gameData;

  @override
  State<DetailsForm> createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsForm> {


  TextEditingController scouterName = TextEditingController();
  TextEditingController matchNumber = TextEditingController();
  TeamStation? teamStation;
  Team scouterTeam = Team.DEMACIA;
  Team? matchTeam;
  bool isPlayed = true;

  @override
  void initState() {
    super.initState();

    if (widget.gameData.detailsData != null) {
      DetailsData data = widget.gameData.detailsData!;
      
      teamStation = data.teamStation;
      scouterName.text = data.scouterName;
      matchTeam = data.matchTeam;
      matchNumber.text = data.matchNumber.toString();
      isPlayed = data.isPlayed;
    } else {

      scouterName.text = "";
      matchNumber.text = "";
      teamStation = null;
      matchTeam = null;
      isPlayed = true;
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
                    SectionDivider(label: "Details"),
    
                    Text(
                      "Enter Your Name:",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextField(
                      controller: scouterName,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Enter Scouter Name",
                        prefixIcon: const Icon(Icons.person),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: scouterName.clear,
                        ),
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.deny(RegExp(r'[!=,(){}|<>]'))
                      ]
                    ),
    
                    SizedBox(
                      height: 20,
                    ),
    
                    // Text(
                    //   "Enter Your Team:",
                    //   style: TextStyle(fontSize: 18),
                    // ),
                    // Selector<Team>(
                    //   options: Team.values,
                    //   placeholder: "Select Your Team",
                    //   makeItem: (Team p0) => p0.title,
                    //   validate: always2(null),
                    //   value: scouterTeam,
                    //   onChange: (p0) => scouterTeam = p0,
                    // ),
    
                    SizedBox(
                      height: 20,
                    ),
    
                    Text(
                      "Enter Team Station In The game:",
                      style: TextStyle(fontSize: 18),
                    ),
                    Selector<TeamStation>(
                      options: TeamStation.values,
                      placeholder: "Select Team Station",
                      makeItem: (TeamStation teamStation) => teamStation.title,
                      validate: always2(null),
                      value: teamStation,
                      onChange: (p0) => teamStation = p0,
                    ),
    
                    SizedBox(
                      height: 20,
                    ),
    
                    Text(
                      "Enter The Team You Scouting On:",
                      style: TextStyle(fontSize: 18),
                    ),
                    Selector<Team>(
                      options: Team.values,
                      placeholder: "Select Team You Scouting On",
                      makeItem: (Team team) => team.title,
                      validate: always2(null),
                      value: matchTeam,
                      onChange: (p0) => matchTeam = p0,
                    ),
    
                    SizedBox(
                      height: 20,
                    ),
    
                    Text(
                      "Enter Match Number:",
                      style: TextStyle(fontSize: 18),
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
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
    
                    SizedBox(
                      height: 20,
                    ),
    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Uncheck This Switch \nIf The Team Is Not Playing:",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        BooleanSwitch(
                          onChange: (value) => setState(() => isPlayed = value),
                        ),
                      ],
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
                            if (
                              isPlayed
                              && scouterName.text.isNotEmpty
                              && matchNumber.text.isNotEmpty
                              // && scouterTeam != null
                              && teamStation != null
                              && matchTeam != null
                            ) {
                              widget.gameData.detailsData = DetailsData(
                                teamStation: teamStation!, 
                                scouterName: scouterName.text, 
                                scouterTeam: scouterTeam,
                                // scouterTeam: scouterTeam!, 
                                matchTeam: matchTeam!,
                                matchNumber: int.parse(matchNumber.text), 
                                isPlayed: isPlayed,
                              );
    
                              Navigator.pushReplacement(
                                context, 
                                MaterialPageRoute(
                                  builder: (final BuildContext context) =>
                                    AutonomousForm(gameData: widget.gameData)
                                ) 
                              );
                            } else if (
                              !isPlayed
                              && scouterName.text.isNotEmpty
                              && matchNumber.text.isNotEmpty
                              // && scouterTeam != null
                              && teamStation != null
                              && matchTeam != null
                            ) {
                              widget.gameData.detailsData = DetailsData(
                                teamStation: teamStation!, 
                                scouterName: scouterName.text, 
                                scouterTeam: scouterTeam,
                                // scouterTeam: scouterTeam!, 
                                matchTeam: matchTeam!,
                                matchNumber: int.parse(matchNumber.text), 
                                isPlayed: isPlayed,
                              );
    
                              Navigator.pushReplacement(
                                context, 
                                MaterialPageRoute(
                                  builder: (final BuildContext context) =>
                                    NotPlayedQrCode(gameData: widget.gameData)
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