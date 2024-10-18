import 'dart:convert';

import 'package:fluff/Util/Game.dart';
import 'package:fluff/Util/LogEntry.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DataHandler {
  var fileHandler = FileHandler();
  Game currentGame = Game();
  List<Game> games = List.empty();

  DataHandler(){
    loadGames();
    print("init data");
    // TODO: use loaded data
    if (games.isEmpty) {
      currentGame = Game();
      games= [...games, currentGame];
    } else {
      currentGame = games.first;
    }
  }

  void addLogEntryToGame(LogEntry entry) {
    currentGame.addEntry(entry);
    // TODO: write into file
    fileHandler.writeCounter(2);
  }

  void loadGames() async {

    var y = await fileHandler.readFile();
    var x = jsonDecode(y) as List<Game>;
   /* var x = fileHandler.readFile().then((jsonString) => {
         jsonDecode(jsonString) as List<Game>
    });*/
    print("aaaaa");
    print(x);
  }
}

class FileHandler {
  String savePath = "save.txt";

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _saveFile async {
    final path = await _localPath;
    return File('$path/$savePath');
  }

  Future<File> writeCounter(int counter) async {
    final file = await _saveFile;
    return file.writeAsString('$counter');
  }

  Future<String> readFile() async {
    try {
      final file = await _saveFile;
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      return "[]";
    }
  }
}