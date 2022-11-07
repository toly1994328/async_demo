import 'dart:async';

void main(){
  StreamController<int> controller = StreamController(sync: true);
  controller.stream.listen((int event) {
    print('=======do in stream===$event======');
  });

  controller.add(1);
  print('=======do in main=========');
  controller.add(2);
}

