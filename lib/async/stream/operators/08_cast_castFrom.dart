import 'package:async_demo/async/stream/stream_provider.dart';

void main() {
  Stream<int> intStream = StreamProvider().createStream();
  Stream<num> newStream = intStream.cast<num>();
  // Stream<num> newStream = Stream.castFrom<num,int>(intStream);
  int start = DateTime.now().millisecondsSinceEpoch;
  newStream.listen((e) {
    print("$e === ${DateTime.now().millisecondsSinceEpoch - start} ms");
  });
}
