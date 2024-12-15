import 'package:flutter/cupertino.dart';

import 'Util/Game.dart';

class GameViewModel extends ChangeNotifier {
  int health1 = 8000; // purple
  int health2 = 8000; //orange
  int maxHealth = 8000;

  GameViewModel(health) {
    this.maxHealth = health;
    this.health1 = maxHealth;
    this.health2 = maxHealth;
  }

  GameViewModel.fromGame(int health, Game game ) {
    this.maxHealth = health;
    this.health1 = maxHealth;
    this.health2 = maxHealth;

    if(!game.log.isEmpty) {
      this.health1 = game.log.first.meHealth;
      this.health2 = game.log.first.enemyHealth;
    }
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
