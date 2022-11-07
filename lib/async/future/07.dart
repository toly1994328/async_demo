import 'dart:async';






















main() {
  int start = DateTime.now().millisecondsSinceEpoch;
  Timer(const Duration(milliseconds: 0),(){
    int end = DateTime.now().millisecondsSinceEpoch;
    print('Timer Cost: ${(end-start)} ms');
  });
  // Stopwatch stopwatch = Stopwatch();
  // stopwatch.start();

  scheduleMicrotask(() {
    loopAdd(1000000000);
  });

  // Stream
}

int loopAdd(int count) {
  int startTime = DateTime.now().millisecondsSinceEpoch;
  int sum = 0;
  for (int i = 0; i <= count; i++) {
    sum+=i;
  }
  int cost = DateTime.now().millisecondsSinceEpoch-startTime;
  print('loopAdd Cost: $cost ms');
  return sum;
}




















