import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scouting_qr/data/game_data.dart';
import 'package:scouting_qr/widgets/demacia_app_bar.dart';
import 'package:scouting_qr/form/general_form.dart';
import 'package:scouting_qr/widgets/score_counter.dart';
import 'package:scouting_qr/widgets/selection_divider.dart';

class NotPlayedQrCode extends StatefulWidget {
  const NotPlayedQrCode({
    super.key,
    required this.gameData,
  });
  final GameData gameData;

  @override
  State<NotPlayedQrCode> createState() => _NotPlayedQrCodeState();
}

class _NotPlayedQrCodeState extends State<NotPlayedQrCode> {
  
  @override
  Widget build(BuildContext context) => PopScope(
    canPop: false,
    child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: DemaciaAppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SectionDivider(label: "Qr Code"),

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

                Text(
                  "ROBOT DID NOT PLAYED",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red.shade900,
                    fontWeight: FontWeight.bold,
                  ),
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
    ),
  );
}