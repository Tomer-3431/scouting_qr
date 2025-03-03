import 'package:scouting_qr/enum/enum_options.dart';

enum TeamStation implements EnumOptions{
  BLUE_1("Blue 1", "Blue 1"),
  BLUE_2("Blue 2", "Blue 2"),
  BLUE_3("Blue 3", "Blue 3"),
  RED_1("Red 1", "Red 1"),
  RED_2("Red 2", "Red 2"),
  RED_3("Red 3", "Red 3");

  @override
  final String title;
  @override
  final String sheetsName;

  const TeamStation(this.title, this.sheetsName);
}