import 'package:flutter/cupertino.dart';

class GameViewModel extends ChangeNotifier {
  int health1 = 8000; // me
  int health2 = 8000; //oponnent
  int maxHealth = 8000;

  GameViewModel(health) {
    this.maxHealth = health;
    this.health1 = maxHealth;
    this.health2 = maxHealth;
  }

  //getter
  String get_health1() {
    return health1.toString();
  }

  String get_health2() {
    return health2.toString();
  }


  edit_health(int _player, int _value) {
    if (_player == 1) {
      health1 += _value;
    } else {
      health2 += _value;
    }
    notifyListeners();
  }
}
