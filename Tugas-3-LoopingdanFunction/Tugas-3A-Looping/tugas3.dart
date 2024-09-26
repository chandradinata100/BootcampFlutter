void main() {
  int lebar = 8;
  int tinggi = 4;

  for (int i = 0; i < tinggi; i++) {
    String baris = '';
    for (int j = 0; j < lebar; j++) {
      baris += '#';
    }
    print(baris);
  }
}
