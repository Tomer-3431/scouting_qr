import 'package:scouting_qr/enum/algae_in_reef.dart';

class GeneralData {
  GeneralData({
    required this.isAlgaeFloorCollect,
    required this.isCoralFloorCollect,
    required this.isTouchedCage,
    required this.didDefense,
    required this.isStuck,
    required this.comments,
  });

  bool isAlgaeFloorCollect;
  bool isCoralFloorCollect;
  bool isTouchedCage;

  bool didDefense;
  
  bool isStuck;

  String comments;

  @override
  String toString() {
    return "$isAlgaeFloorCollect,$isCoralFloorCollect,$isTouchedCage,$didDefense,$isStuck,$comments";
  }

  static String notPlayedString() {
    return ",,,,,,";
  }
}