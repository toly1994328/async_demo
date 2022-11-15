import 'dart:convert';

import 'package:async_demo/async/stream/stream_provider.dart';

void main() {
  Stream<int> intStream = StreamProvider().createStream();
  Stream<List<int>> newStream = intStream
      .map((int e) => e.toString())
      .transform(const AsciiEncoder());

  int start = DateTime.now().millisecondsSinceEpoch;
  newStream.listen((e) {
    print("$e === ${DateTime.now().millisecondsSinceEpoch - start} ms");
  });
}

