import 'package:scouting_qr/enum/enum_options.dart';

enum Team implements EnumOptions{
  STEAMPUNK("1577 Steampunk", "1577 - Steampunk"),
  THE_BLUE_MONKEYS("1580 The Blue Monkeys", "1580 - The Blue Monkeys"),
  HAMOSAD("1657 Hamosad", "1657 - Hamosad"),
  ELYSIUM("1937 Elysium", "1937 - Elysium"),
  CINDERELLA_TELL_NOF("1942 Cinderella Tel-Nof", "1942 - Cinderella Tel-Nof"),
  ELECTROBUNNY("1954 ElectroBunny", "1954 - ElectroBunny"),
  THE_SPIKES("2212 The Spikes", "2212 - The Spikes"),
  GENERAL_ANGLES("2230 General Angles", "2230 - General Angles"),
  ONYX_TRONIX("2231 OnyxTronix", "2231 - OnyxTronix"),
  THUNDERBOLTS("2630 Thunderbolts", "2630 - Thunderbolts"),
  FLASH("3388 Flash", "3388 - Flash"),
  VULCAN("3835 Vulcan", "3835 - Vulcan"),
  LADIES_FIRST("4319 Ladies First", "4319 - Ladies FIRST"),
  THE_JOKERS("4320 The Jokers", "4320 - The Jokers"),
  FALCONS("4338 Falcons", "4338 - Falcons"),
  PRIMO("4586 Primo", "4586 - PRIMO"),
  CYPHER("4661 Cypher", "4661 - Cypher"),
  EMPERIUS("5291 Emperius", "5291 - Emperius"),
  POROS("5554 Poros", "5554 - The Poros Robotics"),
  DEMACIA("5635 Demacia", "5635 - Demacia"),
  DRC("5715 DRC", "5715 - DRC"),
  MA("5951 Makers Assemble", "5951 - Makers Assemble"),
  DESERT_EAGLES("6104 Desert Eagles", "6104 - Desert Eagles"),
  EXCALIBUR("6738 Excalibur", "6738 - Excalibur"),
  XO("7039 XO", "7039 - XO"),
  EVER_GREEN("7112 EverGreen", "7112 - EverGreen"),
  POM("8175 Piece of Mind", "8175 - Piece of Mind"),
  MARINERS("8223 Mariners", "8223 - Mariners"),
  PORTAL("9303 Portal", "9303 - PO®️TAL to GOATland"),
  LEGENDS("9304 Legend's", "9304 - Legend's"),
  FIRE_FLY("9739 Firefly", "9739 - Firefly"),
  CANBUS("9740 CanBus", "9740 - CAN://Bus"),
  TSUNAMI("10139 Tsunami", "10139 - Tsunami"),
  TEST_TEAM1("9997 Test Team 1", "9997 Test Team"),
  TEST_TEAM2("9998 Test Team 2", "9997 Test Team"),
  TEST_TEAM3("9999 Test Team 3", "9999 Test Team");
  
  @override
  final String title;
  @override
  final String sheetsName;

  const Team(this.title, this.sheetsName);
}