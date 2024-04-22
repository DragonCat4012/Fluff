import 'package:flutter/material.dart';
import 'package:fluff/LogEntry.dart';

class LogCard extends StatelessWidget {
  final LogEntry entry ;

  static final minWidth = 80.0;
  const LogCard(this.entry, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(2.0, 5.0, 5.0, 2.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8))
            ),
           // child: Card(
             // color: Colors.grey.withOpacity(0.5),
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
                                  color: Colors.black,
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
                                color: Colors.black,
                              ),
                            ),
                      ),
                          ]),
                    ),
                  ]),
         //   ),
          ),
        );
  }
}