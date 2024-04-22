import 'package:flutter/material.dart';

class LogEntry {
  int value = 0;
  int meHealth = 0;
  int enemyHealth = 0;
  bool isMe = true;

  LogEntry(int value, int meHealth, int enemyHealth, bool isMe) {
    this.value = value;
    this.meHealth = meHealth;
    this.enemyHealth = enemyHealth;
    this.isMe = isMe;
  }

  String getMeText() {
    if (isMe) {
      return '$value';
    } else {
      return "";
    }
  }

  String getEnemyText() {
    if (!isMe) {
      return '$value';
    } else {
      return "";
    }
  }

  /*Color getColor() {
    return value > 0 ? Color.green : Color.red;
  }*/

}