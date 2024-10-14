import 'package:flutter/cupertino.dart';

class GameViewModel {
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

  // funcs
  edit_health1(int _value) {
    health1 += _value;
  }

  edit_health2(int _value) {
    health2 += _value;
  }
}
