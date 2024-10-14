import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluff/LogEntry.dart';
import 'package:fluff/LogView.dart';
import 'GameViewModel.dart';

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
  int _selectedAmount = 0;
  bool _isNegative = false;
  bool _isMeSelected = true;
  final _logList = [];

  static const double barRadius = 8;

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
        vm.health1 += amount;
      } else {
        vm.health2 += amount;
      }
      _logList.add(new LogEntry(amount, vm.health1, vm.health2, _isMeSelected));
    });
  }



  var vm = GameViewModel(8000);

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  // Texts
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      vm.get_health1(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Text(
                      '${vm.health2}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: 300,
                        height: 20,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(barRadius),
                              bottomLeft: Radius.circular(barRadius)),
                          child: LinearProgressIndicator(
                            minHeight: 20,
                            value: vm.health1 / vm.maxHealth,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.purple),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: 300,
                        height: 20,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(barRadius),
                              bottomRight: Radius.circular(barRadius)),
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: LinearProgressIndicator(
                              minHeight: 20,
                              value: vm.health2 / vm.maxHealth,
                              valueColor:
                                  const AlwaysStoppedAnimation(Colors.orange),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Buttons
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: const Text('4000'),
                          onPressed: () {
                            _selectedAmount = 4000;
                          },
                        ),

                        ElevatedButton(
                          child: const Text('500'),
                          onPressed: () {
                            _selectedAmount = 500;
                          },
                        ),
                        ElevatedButton(
                          child: const Text('+'),
                          onPressed: () {
                            _editNegative(false);
                            _editPlayer1Life();
                          },
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: const Text('2000'),
                          onPressed: () {
                            _selectedAmount = 2000;
                          },
                        ),


                        ElevatedButton(
                          child: const Text('100'),
                          onPressed: () {
                            _selectedAmount = 100;
                          },
                        ),

                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: const Text('1000'),
                          onPressed: () {
                            _selectedAmount = 1000;
                          },
                        ),
                        ElevatedButton(
                          child: const Text('50'),
                          onPressed: () {
                            _selectedAmount = 50;
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LogPage(
                    title: "UwU",
                    logEntries: _logList.cast<LogEntry>().reversed.toList())),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.note),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
