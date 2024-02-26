import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final int number;

  QuoteCard(this.number);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 3.0),
        child: SingleChildScrollView(
          child: Container(
            child: Card(
              color: Colors.grey[800],
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              '${number}',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.purple,
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
/*

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
children: [Text("1"), Text("2")],
)),
],
)),


ListView(
children:
[Text("1"), Text("2")],
),

*/