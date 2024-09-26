String introduce(String name, int age, String address, String hobby) {
  return 'Nama saya $name, umur saya $age tahun, alamat saya di $address, dan saya punya hobby yaitu $hobby!';
}

void main() {
  var name = "Agus";
  var age = 30;
  var address = "Jln. Malioboro, Yogyakarta";
  var hobby = "Gaming";
  
  var perkenalan = introduce(name, age, address, hobby);
  print(perkenalan);
}
