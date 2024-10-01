void main(List<String> args) {
  print('Life');
  
  Future.delayed(Duration(seconds: 2), () {
    print('is');
  });

  Future.delayed(Duration(seconds: 4),(){
    print('never flat');
  });
}