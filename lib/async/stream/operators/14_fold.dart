import 'dart:convert';

import 'package:async_demo/async/stream/stream_provider.dart';

Map<int, String> numMap = {
  0: "零", 1: "壹", 2: "贰", 3: "叁", 4: "肆",
  5: "伍", 6: "陆", 7: "柒", 8: "捌", 9: "玖", 10: "拾",
};

void main() {
  Stream<int> intStream = StreamProvider().createStream();
  Future<String> reduceResult =
      intStream.fold<String>("大写:", (String p, int e) => p + numMap[e]!);
  int start = DateTime.now().millisecondsSinceEpoch;
  reduceResult.then((value) {
    print("$value === ${DateTime.now().millisecondsSinceEpoch - start} ms");
  });
}
