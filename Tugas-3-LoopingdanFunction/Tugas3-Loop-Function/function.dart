void main() {
  int angka = 6;
  print('$angka! = ${faktorialRecursion(angka)}');
}

int faktorialRecursion(int num) {
  if (num <= 0) {
    return 1;
  } else {
    return num * faktorialRecursion(num - 1);
  }
}
