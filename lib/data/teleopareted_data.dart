class TeleoparetedData {
  TeleoparetedData({
    required this.l4Scored,
    required this.l4Failed,
    required this.l3Scored,
    required this.l3Failed,
    required this.l2Scored,
    required this.l2Failed,
    required this.l1Scored,
    required this.l1Failed,
    required this.processorScored,
    required this.netScored,
    required this.netFailed,
    required this.stolenAlgae,
  });

  int l4Scored;
  int l4Failed;
  int l3Scored;
  int l3Failed;
  int l2Scored;
  int l2Failed;
  int l1Scored;
  int l1Failed;

  int processorScored;
  int netScored;
  int netFailed;
  int stolenAlgae;

  @override
  String toString() {
    return "$l4Scored,$l4Failed,$l3Scored,$l3Failed,$l2Scored,$l2Failed,$l1Scored,$l1Failed,$processorScored,$netScored,$netFailed,$stolenAlgae";
  }

  static notPlayedString() {
    return "0,0,0,0,0,0,0,0,0,0,0,0";
  }
}
