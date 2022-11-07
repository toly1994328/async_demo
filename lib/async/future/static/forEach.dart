import 'dart:async';


void main()  {
  Future task = Future.forEach<int>([0,1,2,3,4,5], action);
  task.then((value){
    print('Finished $value');
  });
}

FutureOr<void> action(int element) async{
  await Future.delayed(const Duration(seconds: 1));
  int result = element*element;
  print(result);
}

