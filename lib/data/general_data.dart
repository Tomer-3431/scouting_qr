class GeneralData {
  GeneralData({
    required this.didDefense,
    required this.isStuck,
    required this.comments,
  });

  bool didDefense;
  bool isStuck;

  String comments;

  @override
  String toString() {
    return "$didDefense,$isStuck,$comments";
  }

  static String notPlayedString() {
    return ",,,";
  }
}