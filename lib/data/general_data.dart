import 'package:scouting_qr/enum/algae_in_reef.dart';

class GeneralData {
  GeneralData({
    required this.algaeInReef,
    required this.isAlgaeFloorCollect,
    required this.isCoralFloorCollect,
    required this.isTouchedCage,
    required this.didDefense,
    required this.defenseLevel,
    required this.wasDefended,
    required this.copeWithDefense,
    required this.drivingLevel,
    required this.isStuck,
    required this.isFoulist,
    required this.comments,
  });

  AlgaeInReef algaeInReef;
  bool isAlgaeFloorCollect;
  bool isCoralFloorCollect;
  bool isTouchedCage;

  bool didDefense;
  int defenseLevel;
  bool wasDefended;
  int copeWithDefense;
  
  int drivingLevel;
  bool isStuck;
  bool isFoulist;

  String comments;

  @override
  String toString() {
    return "\"${algaeInReef.sheetsName}\",$isAlgaeFloorCollect,$isCoralFloorCollect,$isTouchedCage,$didDefense,${didDefense ? defenseLevel : "\"\""},$wasDefended,${wasDefended ? copeWithDefense : "\"\""},$drivingLevel,$isStuck,$isFoulist,\"$comments\"";
  }
}