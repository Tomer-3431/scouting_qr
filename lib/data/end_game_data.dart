import 'package:scouting_qr/enum/climb_status.dart';

class EndGameData {
  EndGameData({
    required this.climbStatus,
  });

  ClimbStatus climbStatus;

  @override
  String toString() {
    return climbStatus.sheetsName;
  }

  static String notPlayedString() {
    return ",";
  }
}
