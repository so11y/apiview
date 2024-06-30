import 'package:apiview/reactive/effect.dart';
import 'package:apiview/reactive/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  var x = UseState(2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("haha"),
      ),
      body: Center(
        child: Effect(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${x.get()}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                MyHomePage1(value: x.get()),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          x.set((v) => v + 1);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyHomePage1 extends StatefulWidget {
  int value;
  MyHomePage1({
    required this.value,
    Key? key,
  }) : super(key: key);
  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  late UseState<int> x = UseState<int>(11);

  @override
  Widget build(BuildContext context) {
    return Effect(() => ElevatedButton(
        onPressed: () {
          x.value += widget.value + 3;
        },
        child: Text('${x.value}-${widget.value}')));
  }
}
