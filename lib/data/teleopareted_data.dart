import 'package:scouting_qr/enum/collection_zone.dart';

class TeleoparetedData {
  TeleoparetedData(
      {required this.l4Scored,
      required this.l3Scored,
      required this.l2Scored,
      required this.l1Scored,
      required this.processorScored,
      required this.netScored,
      required this.stolenAlgae,
      required this.collectionZone});

  int l4Scored;
  int l3Scored;
  int l2Scored;
  int l1Scored;

  int processorScored;
  int netScored;
  int stolenAlgae;

  CollectionZone collectionZone;

  @override
  String toString() {
    return "$l4Scored,$l3Scored,$l2Scored,$l1Scored,$processorScored,$netScored,$stolenAlgae,${collectionZone.sheetsName}";
  }

  static notPlayedString() {
    return "0,0,0,0,0,0,0,";
  }
}
