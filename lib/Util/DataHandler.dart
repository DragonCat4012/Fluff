import 'package:fluff/Util/Game.dart';
import 'package:fluff/Util/LogEntry.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DataHandler {
  var fileHandler = FileHandler();
  Game currentGame = Game();
  List<Game> games = List.empty();

  DataHandler(){
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

  void loadGames(){
    // TODO: load file
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

    // Write the file
    return file.writeAsString('$counter');
  }

  Future<int> readCounter() async {
    try {
      final file = await _saveFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }
}