import 'package:fluff/Util/DataHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../GameViewModel.dart';
import '../ViewComponents/LifepointsOptionsView.dart';

import '../Util/Styling.dart';

class LandscapeOne extends StatefulWidget {
  const LandscapeOne({super.key, required this.title, required this.storage});
  final String title;
  final DataHandler storage;

  @override
  State<LandscapeOne> createState() => _LandscapeOne();
}

class _LandscapeOne extends State<LandscapeOne> {
  static const double barRadius = 8;
  var vm = GameViewModel(8000);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListenableBuilder(
            listenable: vm,
            builder: (context, child) {
              return SingleChildScrollView(
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
                            color: PURPLE,
                          ),
                        ),
                        Text(
                          '${vm.health2}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: ORANGE,
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
                                    const AlwaysStoppedAnimation<Color>(PURPLE),
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
                                      const AlwaysStoppedAnimation(ORANGE),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: LifePointOptionsView(
                                  vm: vm,
                                  color: PURPLE,
                                  target: 1,
                                  storage: widget.storage)),
                          const SizedBox(
                            width: 100,
                            child: Center(child: Text("Log or so")),
                          ),
                          Expanded(
                              child: LifePointOptionsView(
                                  vm: vm,
                                  color: ORANGE,
                                  target: 2,
                                  storage: widget.storage)),
                        ],
                      )),
                ],
              ));
            }),
      ),
    );
  }
}
