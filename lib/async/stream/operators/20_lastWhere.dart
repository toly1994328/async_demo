import 'dart:convert';

import 'package:async_demo/async/stream/stream_provider.dart';

void main() {
  Stream<int> intStream = StreamProvider().createStream();
  Future<int> reduceResult = intStream.lastWhere((e) => e == 9, orElse: () => -1);
  int start = DateTime.now().millisecondsSinceEpoch;
  reduceResult.then((value) {
    print("$value === ${DateTime.now().millisecondsSinceEpoch - start} ms");
  });
}
