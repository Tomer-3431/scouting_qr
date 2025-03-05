import 'package:scouting_qr/enum/collection_zone.dart';

class AutonomousData {
  AutonomousData({
    required this.isLeave,
    required this.l4Scored,
    required this.l3Scored,
    required this.l2Scored,
    required this.l1Scored,
    required this.netScored,
    required this.removeAlgae,
    required this.collectionZone,
  });

  bool isLeave;

  int l4Scored;
  int l3Scored;
  int l2Scored;
  int l1Scored;

  int netScored;
  int removeAlgae;

  CollectionZone collectionZone;

  @override
  String toString() {
    return "$isLeave,$l4Scored,$l3Scored,$l2Scored,$l1Scored,$netScored,$removeAlgae,${collectionZone.sheetsName}";  
  }

  static String notPlayedString() {
    return ",,0,0,0,0,0,0,";
  }
}
