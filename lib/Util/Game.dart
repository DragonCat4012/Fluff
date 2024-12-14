import 'package:uuid/uuid.dart';
import 'package:yugioh_health_tracker/Util/LogEntry.dart';

class Game {
  String game_uuid = "";
  List<LogEntry> log = [];

  Game() {
    log = [];
    const uuid = Uuid();
    game_uuid = uuid.v1().toString();
  }

  Game.fromParam(this.log, this.game_uuid);

  void addEntry(LogEntry entry) {
    log = [entry, ...log];
    print("Add entry: ${log.length}");
  }

  String toJson() {
    List<String> entries = [];
    log.forEach((element) {
      entries.add(element.toJson());
    });
    // print("game to json: ${'{"game_uuid": "$game_uuid", "log": [${entries.join(", ")}]}'}");
    return '{"game_uuid": "$game_uuid", "log": [${entries.join(", ")}]}';
  }

  static Game fromJson(model) {
    // print("model $model");
    List<LogEntry> newLog = [];
    model["log"].forEach((element) {
      newLog.add(LogEntry.fromJson(element));
    });

    Game newGame = Game.fromParam(newLog, model["game_uuid"]);
    //print("load Game from JSON: $newGame");
    return newGame;
  }

  @override
  String toString() {
    return "($game_uuid: ${log.length})";
  }
}
