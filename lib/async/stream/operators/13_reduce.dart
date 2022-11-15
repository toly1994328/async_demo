import 'dart:convert';

import 'package:async_demo/async/stream/stream_provider.dart';

void main() {
  Stream<int> intStream = StreamProvider().createStream();
  Future<int> reduceResult = intStream.reduce((p, e) {
    return p+e;
  });
  int start = DateTime.now().millisecondsSinceEpoch;
  reduceResult.then((value){
      print("$value === ${DateTime.now().millisecondsSinceEpoch - start} ms");

  });

  // int start = DateTime.now().millisecondsSinceEpoch;
  // newStream.listen((e) {
  //   print("$e === ${DateTime.now().millisecondsSinceEpoch - start} ms");
  // });
}

