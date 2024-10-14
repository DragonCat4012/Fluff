import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluff/LogEntry.dart';
import 'package:fluff/LogView.dart';
import 'GameViewModel.dart';

import 'Styling.dart';

class LifePointOptionsView extends StatefulWidget {
  const LifePointOptionsView(
      {super.key, required this.vm, required this.color, required this.target});
  final GameViewModel vm;
  final Color color;
  final int target;

  @override
  State<LifePointOptionsView> createState() => _LifePointOptionsView();
}

class _LifePointOptionsView extends State<LifePointOptionsView> {
  int _selectedAmount = 0;
  bool subdivide = false;

  void _editPlayer1Life() {
    int amount = subdivide ? (-1) * _selectedAmount : _selectedAmount;

    setState(() {
      widget.vm.edit_health(widget.target, amount);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: const Text('4000'),
                        style: buttonStyle(),
                        onPressed: () {
                          setState(() {
                            _selectedAmount = 4000;
                          });
                        },
                      ),
                      ElevatedButton(
                        child: const Text('500'),
                        style: buttonStyle(),
                        onPressed: () {
                          setState(() {
                            _selectedAmount = 500;
                          });
                        },
                      ),
                      ElevatedButton(
                        child: const Text('+'),
                        style: buttonStyle(),
                        onPressed: () {
                          subdivide = false;
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
                        style: buttonStyle(),
                        onPressed: () {
                          setState(() {
                            _selectedAmount = 2000;
                          });
                        },
                      ),
                      ElevatedButton(
                        child: const Text('100'),
                        style: buttonStyle(),
                        onPressed: () {
                          setState(() {
                            _selectedAmount = 100;
                          });
                        },
                      ),
                      Text(_selectedAmount.toString())
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: const Text('1000'),
                        style: buttonStyle(),
                        onPressed: () {
                          setState(() {
                            _selectedAmount = 1000;
                          });
                        },
                      ),
                      ElevatedButton(
                        child: const Text('50'),
                        style: buttonStyle(),
                        onPressed: () {
                          setState(() {
                            _selectedAmount = 50;
                          });
                        },
                      ),
                      ElevatedButton(
                        child: const Text('-'),
                        style: buttonStyle(),
                        onPressed: () {
                          subdivide = true;
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
    );
  }
  ButtonStyle buttonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(width: 1, color: widget.color),
        ),
      ),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered))
            return Colors.blue.withOpacity(0.04);
          if (states.contains(MaterialState.focused) ||
              states.contains(MaterialState.pressed))
            return Colors.blue.withOpacity(0.12);
          return null; // Defer to the widget's default.
        },
      ),
    );
  }
}
