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



main() {
  Timer.run(() {
    print("executed");
  });  // Will never be executed.
  foo() {
    scheduleMicrotask(foo);  // Schedules [foo] in front of other events.
  }
  foo();
}


















void foo(){
  Future.delayed(const Duration(seconds: 2),(){

  });
}