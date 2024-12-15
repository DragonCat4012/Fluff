import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:yugioh_health_tracker/Util/LogEntry.dart';
import 'package:yugioh_health_tracker/ViewComponents/LogView.dart';

import '../GameViewModel.dart';
import '../Util/DataHandler.dart';
import '../Util/Styling.dart';
import '../ViewComponents/LifepointsOptionsView.dart';

class PortraitView extends StatefulWidget {
  const PortraitView({super.key, required this.title, required this.storage});

  final String title;
  final DataHandler storage;

  @override
  State<PortraitView> createState() => _PortraitView();
}

class _PortraitView extends State<PortraitView> {
  var vm = GameViewModel(8000);
  int _health1 = 8000; // me
  int _health2 = 8000; // opponent
  final int _maxHealth = 8000;

  bool _isMeSelected = true;
  String e = "";

  Widget getLifepointsOptions() {
    Color color = Styling.accent;
    int target = 1;
    if (_isMeSelected) {
      color = Styling.secondary;
      target = 2;
    }
    return LifePointOptionsView(
        vm: vm, color: color, target: target, storage: widget.storage);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RotatedBox(
                        quarterTurns: 3,
                        child: SizedBox(
                          width: 200,
                          height: 10,
                          child: LinearProgressIndicator(
                            value: _health1 / _maxHealth,
                            valueColor:
                                const AlwaysStoppedAnimation(Styling.secondary),
                            backgroundColor: Colors.grey,
                            //  backgroundColor: Colors.lime,
                          ),
                        )),
                    Column(
                      children: [
                        Text('$_health1',
                            style: const TextStyle(
                                color: Styling.secondary,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        Text('$_health2',
                            style: const TextStyle(
                                color: Styling.accent,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    RotatedBox(
                        quarterTurns: 3,
                        child: SizedBox(
                          width: 200,
                          height: 10,
                          child: LinearProgressIndicator(
                            value: _health2 / _maxHealth,
                            valueColor:
                                const AlwaysStoppedAnimation(Styling.accent),
                            backgroundColor: Colors.grey,
                          ),
                        )),
                  ],
                ),
                SegmentedButton(
                  segments: const [
                    ButtonSegment(
                      value: true,
                      label: Text("Orange"),
                      icon: Icon(null),
                    ),
                    ButtonSegment(
                      value: false,
                      label: Text("Purple"),
                      icon: Icon(null),
                    )
                  ],
                  selected: <bool>{_isMeSelected},
                  showSelectedIcon: false,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                  ),
                  onSelectionChanged: (newSelection) {
                    setState(() {
                      _isMeSelected = newSelection.first;
                    });
                  },
                ),
                getLifepointsOptions(),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LogPage(
                                title: "UwU",
                                // TODO: use real log
                                logEntries: widget.storage.currentGame.log)),
                      );
                    },
                    style: Styling.defaultButtonStyle(),
                    child: const Text("Log"),
                  ),
                ),
                Text(widget.storage.currentGame.game_uuid),
              ],
            ),
          )),
    );
  }
}
