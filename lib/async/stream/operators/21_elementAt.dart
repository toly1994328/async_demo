import 'package:async_demo/async/stream/stream_provider.dart';

void main() {
  Stream<int> intStream = StreamProvider().createStream();
  Future<int> reduceResult = intStream.elementAt(4);
  int start = DateTime.now().millisecondsSinceEpoch;
  reduceResult.then((value) {
    print("$value === ${DateTime.now().millisecondsSinceEpoch - start} ms");
  });
}
