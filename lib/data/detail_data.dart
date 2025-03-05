import 'package:scouting_qr/enum/team.dart';
import 'package:scouting_qr/enum/team_station.dart';

class DetailsData {
  DetailsData(
      {required this.teamStation,
      required this.scouterName,
      required this.scouterTeam,
      required this.matchTeam,
      required this.matchNumber,
      required this.isPlayed});

  TeamStation teamStation;
  String scouterName;
  Team scouterTeam;
  Team matchTeam;
  int matchNumber;
  bool isPlayed;

  @override
  String toString() {
    return "${teamStation.sheetsName},$scouterName,${scouterTeam.sheetsName},${matchTeam.sheetsName},$matchNumber,$isPlayed";
  }
}
