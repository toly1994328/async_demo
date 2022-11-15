import 'package:async_demo/async/stream/stream_provider.dart';

Map<int,String> numMap = {
  0:"零", 1:"壹", 2:"贰", 3:"叁", 4:"肆",
  5:"伍", 6:"陆", 7:"柒", 8:"捌", 9:"玖", 10:"拾",
};

Map<int,String> numMap2 = {
  0:"0", 1:"Ⅰ", 2:"Ⅱ", 3:"Ⅲ", 4:"Ⅳ",
  5:"Ⅴ", 6:"Ⅵ", 7:"Ⅶ", 8:"Ⅷ", 9:"Ⅸ", 10:"Ⅹ",
};

void main() {
  Stream<int> intStream = StreamProvider().createStream();
  Stream<String> newStream = intStream.expand<String>((e) => [numMap[e]!,numMap2[e]!]);

  int start = DateTime.now().millisecondsSinceEpoch;
  newStream.listen((e) {
    print("$e === ${DateTime.now().millisecondsSinceEpoch - start} ms");
  });
}
