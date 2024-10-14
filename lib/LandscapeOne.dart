import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluff/LogEntry.dart';
import 'package:fluff/LogView.dart';

import 'Styling.dart';

class LandscapeOne extends StatefulWidget {
  const LandscapeOne({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<LandscapeOne> createState() => _LandscapeOne();
}

class _LandscapeOne extends State<LandscapeOne> {
  int _counter = 0;
  int _health1 = 8000; // me
  int _health2 = 8000; // opponent
  final int _maxHealth = 8000;

  int _selectedAmount = 0;
  bool _isNegative = false;
  bool _isMeSelected = true;
  final _logList = [];

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
      } else {
        _health2 += amount;
      }
      _logList.add(new LogEntry(amount, _health1, _health2, _isMeSelected));
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                RotatedBox(
                    quarterTurns: 3,
                    child: SizedBox(
                      width: 200,
                      height: 10,
                      child:  LinearProgressIndicator(
                        value: _health1 / _maxHealth,
                        valueColor: const AlwaysStoppedAnimation(Colors.orange),
                        backgroundColor: Colors.grey,
                        //  backgroundColor: Colors.lime,
                      ),
                    )
                ),
                Text(
                  'Your health: $_health1',
                ),
                Text(
                  'Enemy health: $_health2',
                ),
                RotatedBox(
                    quarterTurns: 3,
                    child: SizedBox(
                      width: 200,
                      height: 10,
                      child:  LinearProgressIndicator(
                        value: _health2 / _maxHealth,
                        valueColor: const AlwaysStoppedAnimation(Colors.purple),
                        backgroundColor: Colors.grey,
                      ),
                    )
                ),
              ],
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          Navigator.push(
            context,

            MaterialPageRoute(builder: (context) => LogPage(title:"UwU", logEntries: _logList.cast<LogEntry>().reversed.toList())),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.note),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
