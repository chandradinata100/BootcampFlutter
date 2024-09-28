import 'armor_titan.dart';
import 'attack_titan.dart';
import 'beast_titan.dart';
import 'human.dart';

void main() {
  ArmorTitan armorTitan = ArmorTitan();
  AttackTitan attackTitan = AttackTitan();
  BeastTitan beastTitan = BeastTitan();
  Human human = Human();

  armorTitan.setPowerPoint(4.5);  
  attackTitan.setPowerPoint(10.0);
  beastTitan.setPowerPoint(8.0);
  human.setPowerPoint(3.0);  

  print('ArmorTitan PowerPoint: ${armorTitan.getPowerPoint() < 5 ? 5 : armorTitan.getPowerPoint()}');
  print('AttackTitan PowerPoint: ${attackTitan.getPowerPoint()}');
  print('BeastTitan PowerPoint: ${beastTitan.getPowerPoint()}');
  print('Human PowerPoint: ${human.getPowerPoint() < 5 ? 5 : human.getPowerPoint()}');

  print('ArmorTitan Action: ${armorTitan.terjang()}');
  print('AttackTitan Action: ${attackTitan.punch()}');
  print('BeastTitan Action: ${beastTitan.lempar()}');
  print('Human Action: ${human.killAllTitan()}');
}