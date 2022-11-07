void main() {
  Future.sync(parser).catchError((e){
    print(e);
  });
  // Future((){
  //   print('=======do in Future=========');
  // });
  print('=======do in main=========');
}

void parser() {
  int a = int.parse('a');
  print('=======do in Future=========');
}