import 'dart:convert';

import 'package:fluff/Util/Game.dart';
import 'package:fluff/Util/LogEntry.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DataHandler {
  var fileHandler = FileHandler();
  Game currentGame = Game();
  List<Game> games = List.empty();

  DataHandler() {
    loadGames();

    // TODO: use loaded data
    if (games.isEmpty) {
      print("no games could be loaded");
      currentGame = Game();
      games = [...games, currentGame];

      fileHandler.writeGames(games);
    } else {
      currentGame = games.first;
    }

    print("init data: ${games.length} games");
    print(currentGame);
  }

  void addLogEntryToGame(LogEntry entry) {
    currentGame.addEntry(entry);

    games.removeWhere((item) => item.game_uuid == currentGame.game_uuid);
    games.add(currentGame);

    fileHandler.writeGames(games);
  }

  void loadGames() async {
    var filecontent = await fileHandler.readFile();
    print("filecontent: ${filecontent}");
    Iterable l = json.decode(filecontent);
    List<Game> loadedGames = List<Game>.from(l.map((model) => Game.fromJson(model)));
    games = loadedGames;
    print("Loaded Games: ${loadedGames.length}");
  }
}

class FileHandler {
  String savePath = "gameSave.txt";

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _saveFile async {
    final path = await _localPath;
    return File('$path/$savePath');
  }

  Future<File> writeGames(games) async {
    print("Save games: ${games.length}");
    final file = await _saveFile;
    List<String> gameList = [];

    games.forEach((element) {
      gameList.add(element.toJson());
    });
    print(gameList);
    return file.writeAsString('$gameList');
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
