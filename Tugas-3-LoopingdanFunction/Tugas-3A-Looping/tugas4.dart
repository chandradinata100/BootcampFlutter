void main() {
  int tinggi = 7;

  for (int i = 1; i <= tinggi; i++) {
    String baris = '';
    for (int j = 1; j <= i; j++) {
      baris += '#';
    }
    print(baris);
  }
}
