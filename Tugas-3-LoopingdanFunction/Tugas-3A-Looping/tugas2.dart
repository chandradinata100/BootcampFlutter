void main() {
  for (int x = 1; x <= 20; x++) {
    if (x % 3 == 0 && x % 2 != 0) {
      print('$x - I Love Coding');
    } else if (x % 2 == 0) {
      print('$x - Berkualitas');
    } else {
      print('$x - Santai');
    }
  }
}
