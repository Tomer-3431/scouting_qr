import 'package:scouting_qr/enum/climb_status.dart';

class EndGameData {
  EndGameData({
    required this.climbStatus,
    required this.isClimbSuccess,
  });

  ClimbStatus climbStatus;
  bool isClimbSuccess;

  @override
  String toString() {
    return "\"${climbStatus.sheetsName}\",$isClimbSuccess";
  }
}
