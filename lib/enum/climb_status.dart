import 'package:scouting_qr/enum/enum_options.dart';

enum ClimbStatus implements EnumOptions{
  DIDNT("Did Not Climb", "Didn't"),
  DEEP("Deep", "DEEP"),
  SHALLOW("Shallow", "SHALLOW");

  @override
  final String title;
  @override
  final String sheetsName;

  const ClimbStatus(this.title, this.sheetsName);
}