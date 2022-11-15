import 'dart:convert';

import 'package:async_demo/async/stream/stream_provider.dart';

void main() {
  Stream<int> intStream = StreamProvider().createStream();
  Future<int> reduceResult = intStream.drain(4);
  int start = DateTime.now().millisecondsSinceEpoch;
  reduceResult.then((value) {
    print("流已结束 === ${DateTime.now().millisecondsSinceEpoch - start} ms");
  });
}
