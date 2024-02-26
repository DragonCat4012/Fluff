import 'package:fluff/LogEntry.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _health1 = 8000; // me
  int _health2 = 8000; // opponent
  int _maxHealth = 8000;

  int _selectedAmount = 0;
  bool _isNegative = false;
  bool _isMeSelected = true;
  var _list1 = [];
  var _list2 = [];

  String e = "";

  void _selectAmount(int amount) {
    setState(() {
      _selectedAmount = amount;
    });
  }

  void _selectPlayer(bool isMe) {
    setState(() {
      _isMeSelected = isMe;
    });
  }

  void _editNegative(bool isNegative) {
    setState(() {
      _isNegative = isNegative;
    });
  }

  void _editPlayer1Life() {
    setState(() {
      int amount = _isNegative ? -_selectedAmount : _selectedAmount;

      if (_isMeSelected) {
        _health1 += amount;
        _list1.add(amount);
      } else {
        _health2 += amount;
        _list2.add(amount);
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'amount: $_selectedAmount',
            ),
            SegmentedButton(
              segments: const [
                ButtonSegment(
                  value: true,
                  label: Text("Me"),
                  icon: Icon(null),
                ),
                ButtonSegment(
                  value: false,
                  label: Text("Enemy"),
                  icon: Icon(null),
                )
              ],
              selected: <bool>{_isMeSelected},
              showSelectedIcon: false,
              onSelectionChanged: (newSelection) {
                setState(() {
                  _isMeSelected = newSelection.first;
                });
              },
            ),
            Text(
              'Your health: $_health1',
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.all(20),
              child: LinearProgressIndicator(
                value: _health1 / _maxHealth,
              ),
            ),
            Text(
              'Enemy health: $_health2',
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.all(20),
              child: LinearProgressIndicator(
                value: _health2 / _maxHealth,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('4000'),
                  onPressed: () {
                    _selectedAmount = 4000;
                  },
                ),
                ElevatedButton(
                  child: const Text('2000'),
                  onPressed: () {
                    _selectedAmount = 2000;
                  },
                ),
                ElevatedButton(
                  child: const Text('1000'),
                  onPressed: () {
                    _selectedAmount = 1000;
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('500'),
                  onPressed: () {
                    _selectedAmount = 500;
                  },
                ),
                ElevatedButton(
                  child: const Text('100'),
                  onPressed: () {
                    _selectedAmount = 100;
                  },
                ),
                ElevatedButton(
                  child: const Text('50'),
                  onPressed: () {
                    _selectedAmount = 50;
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('+'),
                  onPressed: () {
                    _editNegative(false);
                    _editPlayer1Life();
                  },
                ),
                ElevatedButton(
                  child: const Text('-'),
                  onPressed: () {
                    _editNegative(true);
                    _editPlayer1Life();
                  },
                ),
              ],
            ),


            Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: _list1.map((number) => Text('$number')).toList(),
                    )),

                    Expanded(
                        child: Column(
                          children: _list2.map((number) => Text('$number')).toList(),
                        )),

                  ],
                )),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
