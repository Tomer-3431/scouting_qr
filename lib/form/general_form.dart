import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scouting_qr/data/game_data.dart';
import 'package:scouting_qr/data/general_data.dart';
import 'package:scouting_qr/widgets/demacia_app_bar.dart';
import 'package:scouting_qr/form/end_game_form.dart';
import 'package:scouting_qr/qr_code/main_qr_code.dart';
import 'package:scouting_qr/widgets/boolean_switch.dart';
import 'package:scouting_qr/widgets/score_counter.dart';
import 'package:scouting_qr/widgets/selection_divider.dart';

class GeneralForm extends StatefulWidget {
  const GeneralForm({
    super.key,
    required this.gameData,
  });
  final GameData gameData;

  @override
  State<GeneralForm> createState() => _GeneralFormState();
}

class _GeneralFormState extends State<GeneralForm> {
  bool didDefense = false;
  bool isStuck = false;

  TextEditingController comments = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.gameData.generalData != null) {
      GeneralData data = widget.gameData.generalData!;

      didDefense = data.didDefense;
      isStuck = data.isStuck;

      comments.text = data.comments;
    } else {
      didDefense = false;
      isStuck = false;

      comments.text = "";
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
                        SectionDivider(label: "General"),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Select If The Team Did Defense: ",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                        BooleanSwitch(
                          value: didDefense,
                          onChange: (value) => didDefense = value,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Select If The Robot Was Stuck: ",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                        BooleanSwitch(
                          value: isStuck,
                          onChange: (value) => isStuck = value,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextField(
                            controller: comments,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                hintText: "Enter Comments",
                                prefix: const Icon(Icons.comment),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: comments.clear,
                                )),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.deny(
                                  RegExp(r'[!=,(){}|<>]'))
                            ]),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            RoundedIconButton(
                                icon: Icons.arrow_back,
                                onPress: () {
                                  widget.gameData.generalData = GeneralData(
                                      didDefense: didDefense,
                                      isStuck: isStuck,
                                      comments: comments.text);

                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder:
                                              (final BuildContext context) =>
                                                  EndGameForm(
                                                      gameData:
                                                          widget.gameData)));
                                },
                                onLongPress: () {}),
                            SizedBox(
                              width: 80,
                            ),
                            RoundedIconButton(
                              icon: Icons.arrow_forward,
                              onPress: () {
                                widget.gameData.generalData = GeneralData(
                                    didDefense: didDefense,
                                    isStuck: isStuck,
                                    comments: comments.text);

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (final BuildContext context) =>
                                            MainQrCode(
                                                gameData: widget.gameData)));
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
