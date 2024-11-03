import 'package:uuid/uuid.dart';
import 'package:fluff/Util/LogEntry.dart';

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
    return '{"game_uuid": "$game_uuid", "log": [${entries.join(", ")}]}';
  }

  static Game fromJson(model) {
    List<LogEntry> newLog = [];
    print("a ${model["log"]}");
    model["log"].forEach((element) {
      newLog.add(element.fromJson());
    });

    Game newGame = Game.fromParam(newLog, model["game_uuid"]);
    print("load Game from JSON: $newGame");
    return newGame;
  }

  @override
  String toString() {
    return "($game_uuid: ${log.length})";
  }
}
