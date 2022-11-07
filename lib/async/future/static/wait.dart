import 'dart:async';


void main() async {
  int start = DateTime.now().millisecondsSinceEpoch;
  List<dynamic> value = await Future.wait<dynamic>([
    delayedNumber(1),
    delayedString("a"),
    delayedNumber(3),
    delayedString('b'),
  ]);
  int cost = DateTime.now().millisecondsSinceEpoch-start;

  print("cost：${cost/1000} s, value:$value"); // [2, result]
}
Future<int> delayedNumber(int num) async {
  await Future.delayed(const Duration(seconds: 3));
  return num;
}

Future<String> delayedString(String value) async {
  await Future.delayed(const Duration(seconds: 2));
  return value;
}

















void foo2(){
  Future.delayed(const Duration(seconds: 2),(){

  });
}