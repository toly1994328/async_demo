import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double result = 0;
  int cost = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _doTask,
        child: const Icon(Icons.directions_run),
      ),
      appBar: AppBar(
        title: const Text("耗时测试"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text("动画指示器示意: "), CupertinoActivityIndicator()],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("1亿随机数平均值测试"),
            Text(
              "计算结果: $result",
              style: Theme.of(context).textTheme.headline6,
            ),
            Text("计算总耗时: $cost ms"),
          ],
        ),
      ),
    );
  }
  int count = 100000000;

//{"count": 100000000}
  void _doTask() {
    int sum = 0;
    int startTime = DateTime.now().millisecondsSinceEpoch;
    for(int i = 0;i<count;i++){
      sum += random.nextInt(10000);
    }
    int endTime = DateTime.now().millisecondsSinceEpoch;
    result = sum/count;
    cost =  endTime - startTime;
    setState(() {});
  }
 static Random random = Random();
}

