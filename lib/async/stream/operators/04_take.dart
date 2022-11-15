import 'package:async_demo/async/stream/stream_provider.dart';

void main() {
  Stream<int> intStream = StreamProvider().createStream();
  Stream<int> newStream = intStream.take(3);
  int start = DateTime.now().millisecondsSinceEpoch;
  newStream.listen((e) {
    print("$e ===== ${DateTime.now().millisecondsSinceEpoch - start} ms");
  });
}
