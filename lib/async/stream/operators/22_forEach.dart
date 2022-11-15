import 'package:async_demo/async/stream/stream_provider.dart';

void main() {
  Stream<int> intStream = StreamProvider().createStream();
  Future<dynamic> reduceResult = intStream.forEach(process);
  int start = DateTime.now().millisecondsSinceEpoch;
  reduceResult.then((value) {
    print("$value === ${DateTime.now().millisecondsSinceEpoch - start} ms");
  });
}

void process(int e){
  print(e);
}