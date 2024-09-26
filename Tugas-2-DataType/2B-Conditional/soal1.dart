import 'dart:io';

void main() {
  print("Apakah ingin Install? : ");
  
  String? inputText = stdin.readLineSync();
  var jawab = inputText;

  if (jawab == 'Y' || jawab == 'y') {
    print("Anda akan menginstall aplikasi dart");
  } else if (jawab == 'T' || jawab == 't') {
    print("Aborted");
  } else {
    print("Error");
  }
}
