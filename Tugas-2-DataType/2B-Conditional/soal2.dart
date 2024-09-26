import 'dart:io';

void main(List<String> args) {
  print("Masukkan Namamu : ");
  String? inputText = stdin.readLineSync();
  var name = inputText?.trim();  

  print("Masukkan Rolemu : ");
  String? inputText2 = stdin.readLineSync();
  var role = inputText2?.trim();  

  if (name == "") {
    print("Nama harus diisi!");
  } else if (role == "") {
    print("Halo $name, Pilih Peranmu untuk memulai game!");
  } else if (role == "Penyihir") {
    print("Selamat datang di Dunia Werewolf, $name. "
          "Halo Penyihir $name, kamu dapat melihat siapa yang menjadi werewolf!");
  } else if (role == "Guard") {
    print("Selamat datang di Dunia Werewolf, $name. "
          "Halo Guard $name, kamu akan membantu melindungi temanmu dari serangan werewolf.");
  } else if (role == "Werewolf") {
    print("Selamat datang di Dunia Werewolf, $name. "
          "Halo Werewolf $name, Kamu akan memakan mangsa setiap malam!");
  } else {
    print("Tidak ada role!");
  }
}
