import 'dart:async';

void main(){
  print("done==1");
  delay3s().then((value){
    print(value);
  });

}






Future<int> delay3s(){
  Completer<int> completer = Completer();
  Timer(const Duration(seconds:3 ),(){
    completer.complete(49);
  });
  return completer.future;
}















void foo2(){
  Future.delayed(const Duration(seconds: 2),(){

  });
}