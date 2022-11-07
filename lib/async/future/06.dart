import 'dart:async';

// void main(){
//   print("done==1");
//
//   // Duration delay = const Duration(seconds: 2);
//   // // 1. 直接传入
//   // // Future.delayed(delay,(){
//   // //   print("task1 done");
//   // // });
//   // // 2. 监听 Future 对象
//   // Future delayedTask = Future.delayed(delay);
//   // delayedTask.then((value){
//   //   print("task2 done");
//   // });
//
//   Future.microtask((){
//     print("done==2");
//   });
//
//   // scheduleMicrotask((){
//   //   print("done==2");
//   // });
//   print("done==3");
//   print("done==4");
//
//   // Completer();
// }



// main() {
//   Timer.run(() {
//     print("executed");
//   });
// }












void main() {
    // print("executed0");

  // Timer.run(() {
  // });
  Timer.run(() {

    scheduleMicrotask(() {
      print("executed1");

    });
  });

  // scheduleMicrotask(() {
  //   print("executed2");
  // });
  // scheduleMicrotask(() {
  //   print("executed3");
  // });
}

















void foo(){
  Future.delayed(const Duration(seconds: 2),(){

  });
}