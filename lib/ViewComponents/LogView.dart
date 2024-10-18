import 'LogCard.dart';
import 'package:flutter/material.dart';
import 'package:fluff/Util/LogEntry.dart';

class LogPage extends StatefulWidget {
   const LogPage({super.key, required this.title, required this.logEntries});
  final String title;
  final List<LogEntry> logEntries;

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
            ListView(
                padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
    children: widget.logEntries.map((entry) => LogCard(entry)).toList(),
    ),
    );
  }
}