import 'package:flutter/material.dart';
import 'package:orbit_standard_library/orbit_standard_library.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scouting_qr/data/detail_data.dart';
import 'package:scouting_qr/data/end_game_data.dart';
import 'package:scouting_qr/data/game_data.dart';
import 'package:scouting_qr/enum/climb_status.dart';
import 'package:scouting_qr/form/general_form.dart';
import 'package:scouting_qr/form/teleopareted_form.dart';
import 'package:scouting_qr/widgets/boolean_switch.dart';
import 'package:scouting_qr/widgets/score_counter.dart';
import 'package:scouting_qr/widgets/selection_divider.dart';

class notPlayedQrCode extends StatefulWidget {
  notPlayedQrCode({
    super.key,
    required this.gameData,
  });
  GameData gameData;

  @override
  State<notPlayedQrCode> createState() => _notPlayedQrCodeState();
}

class _notPlayedQrCodeState extends State<notPlayedQrCode> {
  
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
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),

              Text(
                "${widget.gameData.detailsData!.scouterName}, ${widget.gameData.detailsData!.matchTeam.title}, ${widget.gameData.detailsData!.matchNumber}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              
              SizedBox(
                height: 50,
              ),

              QrImageView(
                data: "={\"\",\"\",${widget.gameData.detailsData},\"\",\"\",0,0,0,0,0,0,0,0,0,0,0,\"\",\"\",0,0,0,0,0,0,0,0,0,0,0,0}",
                size: 200,
                backgroundColor: Colors.white,
                foregroundColor: Colors.deepPurple,
              ),

              SizedBox(
                height: 50,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedIconButton(
                    icon: Icons.arrow_back,
                    onPress: () {
                      Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(
                          builder: (final BuildContext context) =>
                            GeneralForm(gameData: widget.gameData)
                        )
                      );
                    },
                    onLongPress: () {},
                  )
                ],
              )
            ],
          ),
        )
      ]
    ),
  );
}