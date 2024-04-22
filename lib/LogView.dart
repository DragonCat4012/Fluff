
import 'package:flutter/material.dart';


class LogPage extends StatefulWidget {
   LogPage({super.key, required this.title, required this.list1, required this.list2});
  final String title;
  final List<int> list1;
  final List<int> list2;

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log'),
      ),
      body:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context);
          },
          child: const Text('Go back!'),

        ),
            Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                          children: widget.list1.map((number) => Text('$number')).toList(),
                        )),

                    Expanded(
                        child: Column(
                          children: widget.list2.map((number) => Text('$number')).toList(),
                        )),

                  ],
                ))
          ],
        )
    );
  }
}