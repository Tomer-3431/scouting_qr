class TechnicalData {
  const TechnicalData({
    required this.version,
    required this.time,
    required this.id,
  });

  final String version;
  final DateTime time;
  final String id;

  @override
  String toString() {
    return "$version, $time, $id";
  }
}

class Version {
  const Version({
    required this.major,
    required this.minor,
    required this.patch
  });

  final int major;
  final int minor;
  final int patch;

  @override
  String toString() {
    return "$major.$minor.$patch";
  }
}