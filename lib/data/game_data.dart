import 'package:scouting_qr/data/autonomous_data.dart';
import 'package:scouting_qr/data/detail_data.dart';
import 'package:scouting_qr/data/end_game_data.dart';
import 'package:scouting_qr/data/general_data.dart';
import 'package:scouting_qr/data/technical_data.dart';
import 'package:scouting_qr/data/teleopareted_data.dart';

class GameData {
  GameData({
    this.detailsData,
    this.autonomousData,
    this.teleoparetedData,
    this.endGameData,
    this.generalData,
    this.technicalData,
  });
  
  DetailsData? detailsData;
  AutonomousData? autonomousData;
  TeleoparetedData? teleoparetedData;
  EndGameData? endGameData;
  GeneralData? generalData;
  TechnicalData? technicalData;

  @override
  String toString() {
    return ",,$detailsData,,$autonomousData,,$teleoparetedData,,$endGameData,,$generalData,$technicalData";
  }

  String notPlayedString() {
    return ",,$detailsData,,${AutonomousData.notPlayedString()},,${TeleoparetedData.notPlayedString()},,${EndGameData.notPlayedString()},,${GeneralData.notPlayedString()},$technicalData";
  }
}