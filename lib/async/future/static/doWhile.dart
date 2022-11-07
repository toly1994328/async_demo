import 'dart:async';

int value = 0;


void main()  {
  Future task = Future.doWhile(action);
  task.then((_){
    print('Finished with $value');
  });
}

FutureOr<bool> action() async{
  value++;
  await Future.delayed(const Duration(seconds: 1));
  if (value == 3) {
    return false;
  }
  return true;
}

