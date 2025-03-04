import 'package:scouting_qr/enum/enum_options.dart';

enum CollectionZone implements EnumOptions{
  RIGHT_FEEDER("Right Feeder", "Right Feeder"),
  GROUND("Ground", "Middle Feeder"),
  LEFT_FEEDER("Left Feeder", "Left Feeder");

  @override
  final String title;
  @override
  final String sheetsName;

  const CollectionZone(this.title, this.sheetsName);
}