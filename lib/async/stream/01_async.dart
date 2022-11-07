import 'dart:async';
import 'dart:isolate';

void main(){
  StreamController<int> controller = StreamController();
  controller.stream.listen((int event) {
    print('=======do in stream===$event======');
  });

  controller.add(1);
  print('=======do in main=========');
  controller.add(2);
}

class C = A with B;

class D extends A with B {
  D(super.name);
}

class A {
  final String name;

  A(this.name);
}

class B {
  printInfo() {
    print('a');
  }
}
