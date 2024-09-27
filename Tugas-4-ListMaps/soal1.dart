List<int> range(int num1, int num2) {
  List<int> result = [];

  if (num1 < num2) {
    for (int i = num1; i <= num2; i++) {
      result.add(i);
    }
  } else {
    for (int i = num1; i >= num2; i--) {
      result.add(i);
    }
  }

  return result;
}

void main() {
  print(range(1, 10)); //[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  print(range(10, 1)); //[10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
}
