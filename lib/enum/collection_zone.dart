import 'package:scouting_qr/enum/enum_options.dart';

enum CollectionZone implements EnumOptions{
  FEEDER("Feeder", "Feeder"),
  GROUND("Ground", "Ground");

  @override
  final String title;
  @override
  final String sheetsName;

  const CollectionZone(this.title, this.sheetsName);
}