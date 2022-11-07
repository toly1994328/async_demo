import 'dart:isolate';
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
  double progress = 0;

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
            const Text("1亿随机数平均值测试"),
            Text(
              "计算结果: $result",
              style: Theme.of(context).textTheme.headline6,
            ),
            Text("计算总耗时: $cost ms"),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Spacer(),
                Expanded(
                  child: LinearProgressIndicator(
                    value: progress,
                  ),
                ),
                Spacer(),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text("当前进度: ${(progress * 100).toStringAsFixed(2)}%"),
          ],
        ),
      ),
    );
  }

  void _doTask() async {
    final receivePort = RawReceivePort();
    receivePort.handler = handleMessage;
    await Isolate.spawn(
      _doTaskInCompute,
      receivePort.sendPort,
      onError: receivePort.sendPort,
      onExit: receivePort.sendPort,
    );
  }

  void handleMessage(dynamic msg) {
    print("=========$msg===============");
    if (msg is TaskResult) {
      progress = 1;
      setState(() {
        result = msg.result;
        cost = msg.cost;
      });
    }

    if (msg is double) {
      setState(() {
        progress = msg;
      });
    }
  }

  static Random random = Random();

  static void _doTaskInCompute(SendPort port) async {
    int count = 100000000;
    double result = 0;
    int cost = 0;
    int sum = 0;
    int startTime = DateTime.now().millisecondsSinceEpoch;
    for (int i = 0; i < count; i++) {
      sum += random.nextInt(10000);
      if (i % 1000000 == 0) {
        port.send(i / count);
      }
    }
    int endTime = DateTime.now().millisecondsSinceEpoch;
    result = sum / count;
    cost = endTime - startTime;
    Isolate.exit(port, TaskResult(result: result, cost: cost));
  }
}

class TaskResult {
  final int cost;
  final double result;

  TaskResult({required this.cost, required this.result});
}
