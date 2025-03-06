class AutonomousData {
  AutonomousData({
    required this.isLeave,
    required this.l4Scored,
    required this.l3Scored,
    required this.l2Scored,
    required this.l1Scored,
    required this.netScored,
    required this.removeAlgae,
  });

  bool isLeave;

  int l4Scored;
  int l3Scored;
  int l2Scored;
  int l1Scored;

  int netScored;
  int removeAlgae;

  @override
  String toString() {
    return "$isLeave,$l4Scored,$l3Scored,$l2Scored,$l1Scored,$netScored,$removeAlgae";
  }

  static String notPlayedString() {
    return ",0,0,0,0,0,0";
  }
}
