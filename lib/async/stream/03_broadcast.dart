import 'dart:async';




void main(){
  StreamController<int> controller = StreamController.broadcast();
  controller.stream.listen((int event) {
    print('=======do in stream#1===$event======');
  });

  controller.stream.listen((int event) {
    print('=======do in stream#2===$event======');
  });

  controller.add(1);
  print('=======do in main=========');
  controller.add(2);
}

