import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scouting_qr/data/game_data.dart';
import 'package:scouting_qr/data/technical_data.dart';
import 'package:scouting_qr/widgets/demacia_app_bar.dart';
import 'package:scouting_qr/form/details_form.dart';
import 'package:scouting_qr/form/general_form.dart';
import 'package:scouting_qr/widgets/score_counter.dart';
import 'package:scouting_qr/widgets/selection_divider.dart';

class MainQrCode extends StatefulWidget {
  const MainQrCode({
    super.key,
    required this.gameData,
  });
  final GameData gameData;

  @override
  State<MainQrCode> createState() => _MainQrCodeState();
}

class _MainQrCodeState extends State<MainQrCode> {
  @override
  void initState() {
    super.initState();

    widget.gameData.technicalData = TechnicalData(
        version: Version(major: 2, minor: 1, patch: 0),
        time: DateTime.now(),
        id: "${widget.gameData.detailsData!.matchNumber}|${widget.gameData.detailsData!.teamStation.getIndexLetter()}|${widget.gameData.detailsData!.matchTeam.teamNum}");
  }

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: DemaciaAppBar(),
          body: Stack(children: [
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
                  QrImageView(
                    data: widget.gameData.toString(),
                    size: 300,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller:
                        TextEditingController(text: widget.gameData.toString()),
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "To Go Back",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      RoundedIconButton(
                        icon: Icons.arrow_back,
                        onPress: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (final BuildContext context) =>
                                      GeneralForm(gameData: widget.gameData)));
                        },
                        onLongPress: () {},
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "To Next Game",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      RoundedIconButton(
                        icon: Icons.arrow_forward,
                        onPress: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (final BuildContext context) =>
                                      DetailsForm(gameData: GameData())));
                        },
                        onLongPress: () {},
                      )
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      );
}
