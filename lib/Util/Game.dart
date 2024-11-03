
import 'package:fluff/Util/LogEntry.dart';

class Game {
   List<LogEntry> log = List.empty();

   Game(){
     log = List.empty();
   }

  void addEntry(LogEntry entry) {
     log = [entry, ...log];
     print("Add entry: ${log.length}");
   }

   String toJson() {
     List<String> entries = List.empty();
     log.forEach((element) {entries.add(element.toJson());});

     return '{uid: "xxx", log: [${entries.join(", ")}]}';
   }
}