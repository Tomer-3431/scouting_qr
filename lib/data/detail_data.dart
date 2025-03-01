import 'package:scouting_qr/enum/team_station.dart';

class DetailsData {
  DetailsData({
    required this.teamStation,
    required this.scouterName,
    required this.teamNumber,
    required this.matchNumber,
    required this.isPlayed
  });
  TeamStation teamStation;
  String scouterName;
  int teamNumber;
  int matchNumber;
  bool isPlayed;
}
