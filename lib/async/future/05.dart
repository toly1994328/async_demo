import 'dart:async';

void main(){
  print("done==1");

  Timer.run(()=> print("done==2"));
  Timer.run(()=> print("done==3"));

  scheduleMicrotask(()=> print("done==4"));
  scheduleMicrotask(()=> print("done==5"));

  print("done==6");
  print("done==7");

}


//
// main() {
//   Timer.run(() { print("executed"); });  // Will never be executed.
//   foo() {
//     scheduleMicrotask(foo);  // Schedules [foo] in front of other events.
//   }
//   foo();
// }


















void foo(){
  Future.delayed(const Duration(seconds: 2),(){

  });
}