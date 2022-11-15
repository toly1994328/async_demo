import 'package:async_demo/async/stream/stream_provider.dart';

void main() {
  Stream<int> intStream = StreamProvider().createStream();
  Stream<int> newStream = intStream.distinct((int a,int b) => a == b);
  int start = DateTime.now().millisecondsSinceEpoch;
  newStream.listen((e) {
    print("$e ===== ${DateTime.now().millisecondsSinceEpoch - start} ms");
  });
}
