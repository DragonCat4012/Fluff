import 'package:flutter/material.dart';

class LogEntry {
  int value = 0;
  int meHealth = 0;
  int enemyHealth = 0;
  bool isMe = true;
  Color color = Color(0xffb74093);
  Color positiveColor = Color(0xff366e3b);
  Color negativeColor = Color(0xff6e3636);

  LogEntry(int value, int meHealth, int enemyHealth, bool isMe) {
    this.value = value;
    this.meHealth = meHealth;
    this.enemyHealth = enemyHealth;
    this.isMe = isMe;
    this.color = value > 0 ? positiveColor : negativeColor;
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

  Color getColor() {
    return value > 0 ? positiveColor : negativeColor;
  }
}