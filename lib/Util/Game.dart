import 'package:uuid/uuid.dart';
import 'package:fluff/Util/LogEntry.dart';

class Game {
   List<LogEntry> log = List.empty();
   String game_uuid = "";

   Game(){
     log = List.empty();
     const uuid = Uuid();
     game_uuid = uuid.v1().toString();
   }


   Game.fromParam(this.log, this.game_uuid);

  void addEntry(LogEntry entry) {
     log = [entry, ...log];
     print("Add entry: ${log.length}");
   }

   String toJson() {
     List<String> entries = List.empty();
     log.forEach((element) {entries.add(element.toJson());});
     return '{uuid: $game_uuid, log: [${entries.join(", ")}]}';
   }

   static Game fromJson(model) {
     return Game.fromParam(model["game_uuid"], model["log"]);
   }

   @override
   String toString() {
     return "($game_uuid: ${log.length})";
   }
}