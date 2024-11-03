import 'package:uuid/uuid.dart';
import 'package:fluff/Util/LogEntry.dart';

class Game {
   List<LogEntry> log = [];
   String game_uuid = "";

   Game(){
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
     log.forEach((element) {entries.add(element.toJson());});
     return '{"uuid": "$game_uuid", "log": [${entries.join(", ")}]}';
   }

   static Game fromJson(model) {
    //model["log"]
     print("help:");
     print(Game.fromParam(List.empty(), model["game_uuid"]));
     return Game.fromParam(List.empty(), model["game_uuid"]);
   }

   @override
   String toString() {
     return "($game_uuid: ${log.length})";
   }
}