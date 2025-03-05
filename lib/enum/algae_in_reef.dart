import 'package:scouting_qr/enum/enum_options.dart';

enum AlgaeInReef implements EnumOptions {
  DIDNT_TRY("Did Not Try", "Didn't Try"),
  DROP("Drop", "Drop"),
  DIRECT("Direct", "Direct");

  @override
  final String title;
  @override
  final String sheetsName;

  const AlgaeInReef(this.title, this.sheetsName);
}
