import 'package:fluff/ViewComponents/LogCard.dart';
import 'package:flutter/material.dart';
import 'package:fluff/LogEntry.dart';
import 'package:fluff/ViewComponents/LogView.dart';
import 'Util/Styling.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
