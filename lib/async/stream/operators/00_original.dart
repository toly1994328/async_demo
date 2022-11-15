import 'package:async_demo/async/stream/stream_provider.dart';

void main(){
  Stream<int> intStream = StreamProvider().createStream();
  intStream.listen((e) {
    print(e);
  });
}

