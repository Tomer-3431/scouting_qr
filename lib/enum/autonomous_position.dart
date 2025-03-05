import 'package:scouting_qr/enum/enum_options.dart';

enum AutonomousPosition implements EnumOptions {
  LEFT("Left", "Left"),
  MIDDLE("Middle", "Middle"),
  RIGHT("Right", "Right");

  @override
  final String title;
  @override
  final String sheetsName;

  const AutonomousPosition(this.title, this.sheetsName);
}
