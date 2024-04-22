import 'package:flutter/material.dart';
import 'package:fluff/LogEntry.dart';

class QuoteCard extends StatelessWidget {
  final LogEntry entry ;

  static final minWidth = 80.0;
  const QuoteCard(this.entry, {super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 3.0),
        child: SingleChildScrollView(
          child: Container(
            child: Card(
              color: Colors.grey[800],
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              width: minWidth,
                              child:
                              Text(
                                '${entry.meHealth}',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                            SizedBox(
                              width: minWidth,
                              child:
                            Text(
                              entry.getMeText(),
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.purple,
                              ),
                            ),
                    ),
                      SizedBox(
                          width: minWidth,
                          child:
                            Text(
                              entry.getEnemyText(),
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.purple,
                              ),
                            ),
                      ),
                      SizedBox(
                          width: minWidth,
                          child:
                            Text(
                              '${entry.enemyHealth}',
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey,
                              ),
                            ),
                      ),
                          ]),
                    ),
                  ]),
            ),
          ),
        ));
  }
}