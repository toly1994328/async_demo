import 'package:async_demo/async/stream/stream_provider.dart';

void main() {
  Stream<int> intStream = StreamProvider().createStream();
  Future<String> reduceResult = intStream.join(",");
  int start = DateTime.now().millisecondsSinceEpoch;
  reduceResult.then((value) {
    print("$value === ${DateTime.now().millisecondsSinceEpoch - start} ms");
  });
}
