import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stream_transform/stream_transform.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamController<Signal> controller = StreamController();
  late Stream<Signal> source;
  List<int> touchCollector = [];
  List<int> touchCollectorT = [];
  List<int> touchCollectorD = [];

  @override
  void initState() {
    super.initState();
    source = controller.stream.asBroadcastStream();
  }

  int recordTime = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: GestureDetector(
        onDoubleTap: _clear,
        onPanUpdate: _onUpdate,
        onPanStart: _start,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(
                height: 120,
                // color: Colors.red,
                child: Row(
                  children: [
                    const SizedBox(width: 100, child: Center(child: Text("原流"))),
                    StreamBuilder<Signal>(
                      // stream: source.throttle(Duration(milliseconds: 250)),
                      stream: source,
                      // stream: source.debounce(Duration(milliseconds: 250)),
                      builder: (_, snap) {
                        if (snap.data != null) {
                          int now = DateTime.now().millisecondsSinceEpoch;
                          touchCollector = List.of(touchCollector)
                            ..add(now - recordTime);
                        }
                        return SizedBox(
                          height: 120,
                          child: CustomPaint(
                            painter: Painter(touchCollector),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
                // color: Colors.red,
                child: Row(
                  children: [
                    const SizedBox(
                        width: 100,
                        child: Center(child: Text("throttle\n250 ms"))),
                    StreamBuilder<Signal>(
                      stream: source.throttle(const Duration(milliseconds: 250),
                          trailing: true),
                      // stream: source,
                      // stream: source.debounce(Duration(milliseconds: 250)),
                      builder: (_, snap) {
                        if (snap.data != null) {
                          int now = DateTime.now().millisecondsSinceEpoch;
                          touchCollectorT = List.of(touchCollectorT)
                            ..add(now - recordTime);
                        }
                        return SizedBox(
                          height: 120,
                          child: CustomPaint(
                            painter: Painter(touchCollectorT),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
                // color: Colors.red,
                child: Row(
                  children: [
                    const SizedBox(
                        width: 100,
                        child: Center(child: Text("debounce\n250 ms"))),
                    StreamBuilder<Signal>(
                      // stream: source.throttle(Duration(milliseconds: 250)),
                      // stream: source,
                      stream: source.debounce(const Duration(milliseconds: 250)),
                      builder: (_, snap) {
                        if (snap.data != null) {
                          int now = DateTime.now().millisecondsSinceEpoch;
                          touchCollectorD = List.of(touchCollectorD)
                            ..add(now - recordTime);
                        }
                        return SizedBox(
                          height: 120,
                          child: CustomPaint(
                            painter: Painter(touchCollectorD),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onUpdate(DragUpdateDetails details) {
    controller.add(Signal());
  }

  void _start(DragStartDetails details) {
    recordTime =  DateTime.now().millisecondsSinceEpoch;
    touchCollector = [];
    touchCollectorT = [];
    touchCollectorD = [];
  }

  void _clear() {
    touchCollector = [];
    touchCollectorT = [];
    touchCollectorD = [];
    setState(() {});
  }
}

class Signal {}

class Painter extends CustomPainter {
  final List<int> data;

  Painter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..strokeWidth = 1;
    for (int i = 0; i < data.length; i++) {
      double x = data[i] / 5;
      canvas.drawLine(Offset(x, 40), Offset(x, 90), paint);
    }
  }

  @override
  bool shouldRepaint(covariant Painter oldDelegate) => data != oldDelegate.data;
}
