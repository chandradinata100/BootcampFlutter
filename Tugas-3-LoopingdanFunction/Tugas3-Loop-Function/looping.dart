void main() {
  int n = 6;
  int hasil = 1;

  if (n <= 0) {
    hasil = 1;
  } else {
    for (int i = n; i > 0; i--) {
      hasil *= i;
    }
  }
  
  print("$n! = $hasil");
}
