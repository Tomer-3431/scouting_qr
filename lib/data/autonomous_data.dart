import 'package:scouting_qr/enum/autonomous_position.dart';
import 'package:scouting_qr/enum/collection_zone.dart';

class AutonomousData {
  AutonomousData({
    required this.startingAuto,
    required this.isLeave,
    required this.l4Scored,
    required this.l4Failed,
    required this.l3Scored,
    required this.l3Failed,
    required this.l2Scored,
    required this.l2Failed,
    required this.l1Scored,
    required this.l1Failed,
    required this.netScored,
    required this.netFailed,
    required this.removeAlgae,
    required this.collectionZone,
  });

  AutonomousPosition startingAuto;
  bool isLeave;

  int l4Scored;
  int l4Failed;
  int l3Scored;
  int l3Failed;
  int l2Scored;
  int l2Failed;
  int l1Scored;
  int l1Failed;

  int netScored;
  int netFailed;
  int removeAlgae;

  CollectionZone collectionZone;

  @override
  String toString() {
    return "\"${startingAuto.sheetsName}\",$isLeave,$l4Scored,$l4Failed,$l3Scored,$l3Failed,$l2Scored,$l2Failed,$l1Scored,$l1Failed,$netScored,$netFailed,$removeAlgae,\"${collectionZone.sheetsName}\"";  
  }
}
