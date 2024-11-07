import 'package:fluff/Util/DataHandler.dart';
import 'package:fluff/Util/Game.dart';
import 'package:fluff/ViewComponents/LogView.dart';
import 'package:flutter/material.dart';
import 'Util/Styling.dart';

class GamesView extends StatefulWidget {
  const GamesView({super.key, required this.storage});
  final DataHandler storage;

  @override
  State<GamesView> createState() => _GamesView();
}

class _GamesView extends State<GamesView> {
  String currentGame = "";

  Widget getTextWidgets(List<Game> games) {
    List<SizedBox> list = [];
    for (var i = 0; i < games.length; i++) {
      int logSize = games[i].log.length;

      list.add(
        SizedBox(
            width: double.infinity,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextButton(
                style: games[i].log.isEmpty
                    ? Styling.defaultButtonStyleDisabled()
                    : Styling.defaultButtonStyle(),
                onPressed: games[i].log.isEmpty
                    ? null
                    : () => navigateToLog(games[i].log),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      games[i].game_uuid,
                      style: TextStyle(
                          color:
                              getTextColorForGame(games[i].game_uuid, logSize)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      logSize.toString(),
                    )
                  ],
                ),
              ),
            )),
      );
    }
    return Column(children: list);
  }

  Color getTextColorForGame(String gameUUID, int size) {
    if (gameUUID == widget.storage.currentGame.game_uuid) {
      return Styling.accent;
    } else if (size > 0) {
      return Styling.secondary;
    } else {
      return Colors.grey;
    }
  }

  void navigateToLog(logs) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LogPage(title: "Log", logEntries: logs)),
    );
  }

  @override
  void initState() {
    super.initState();
    currentGame = widget.storage.currentGame.game_uuid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("All Games"),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        currentGame,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    getTextWidgets(widget.storage.games),
                  ],
                ))),
      ),
    );
  }
}
