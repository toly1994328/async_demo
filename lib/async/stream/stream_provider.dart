class StreamProvider{
  Stream<int> createStream() async*{
    int start = DateTime.now().millisecondsSinceEpoch;

    List<int> res= [1,9,9,4,3,2,8];
    for(int i = 0 ; i < res.length; i++){
      // print("${res[i]} === ${DateTime.now().millisecondsSinceEpoch - start} ms");

      yield res[i];

      await Future.delayed(const Duration(milliseconds: 100));

      // if(i==6){
      //   throw Exception();
      // }
    }
  }
}