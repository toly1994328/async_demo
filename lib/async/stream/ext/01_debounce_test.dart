import 'dart:async';
import 'package:stream_transform/stream_transform.dart';
// import 'package:rxdart/rxdart.dart';
class StreamProvider{
  Stream<String> createStream() async*{

    String input = "Container";
    for(int i = 0 ; i < input.length; i++){
      yield input.substring(0,i+1);
      await Future.delayed(const Duration(milliseconds: 100));

    }
  }
}


void main(){
  // foo1();
  // foo2();
  foo3();
}

void foo1(){
  Stream<String> inStream = StreamProvider().createStream();
  int start = DateTime.now().millisecondsSinceEpoch;

  inStream.listen((String event) {
    int time = DateTime.now().millisecondsSinceEpoch - start;
    print('====${time} ms===输入:$event======');
  });
}

void foo3(){
  Stream<String> inStream = StreamProvider().createStream();
  int start = DateTime.now().millisecondsSinceEpoch;
  Stream<String> newStream = inStream.debounce(const Duration(milliseconds: 250));

  newStream.listen((String event) {
    int time = DateTime.now().millisecondsSinceEpoch - start;
    print('====${time} ms===输入:$event======');
  });
}
void foo2(){
  Stream<String> inStream = StreamProvider().createStream();
  int start = DateTime.now().millisecondsSinceEpoch;
  Stream<String> newStream = inStream.throttle(const Duration(milliseconds: 250));
  newStream.listen((String event) {
    int time = DateTime.now().millisecondsSinceEpoch - start;
    print('====${time} ms===输入:$event======');
  });
}