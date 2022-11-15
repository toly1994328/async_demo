import 'package:async_demo/async/stream/stream_provider.dart';

Map<int,String> numMap = {
  0:"零", 1:"壹", 2:"贰", 3:"叁", 4:"肆",
  5:"伍", 6:"陆", 7:"柒", 8:"捌", 9:"玖", 10:"拾",
};

void main(){
  Stream<int> intStream = StreamProvider().createStream();
  Stream<String> newStream = intStream.map<String>((int e) => numMap[e]!);
  newStream.listen((e) {
    print(e);
  });
}

