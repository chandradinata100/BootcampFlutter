void main(List<String> args) {
  Segitiga satu;
  double luasLingkaran;

  satu = Segitiga();
  satu.setengah = 0.5;
  satu.alas = 20.0;
  satu.tinggi = 30.0;

  luasLingkaran = satu.HitungLuas();

  print(luasLingkaran);
}

class Segitiga{
  double setengah = 0;
  double alas = 0;
  double tinggi = 0;

  double HitungLuas(){
    return setengah * alas * tinggi;
  }
}