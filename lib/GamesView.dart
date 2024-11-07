import 'package:fluff/Util/DataHandler.dart';
import 'package:fluff/Util/Game.dart';
import 'package:flutter/material.dart';
import 'GameView.dart';
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
          child: TextButton(
              style: Styling.defaultButtonStyle(),
              onPressed: () {
                print(games[i].game_uuid);
              },
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LogPage(title: "UwU", logEntries: games[i].log)),
                  );
                },
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
                    Text(logSize.toString())
                  ],
                ),
              )),
        ),
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

  @override
  void initState() {
    super.initState();
    currentGame = widget.storage.currentGame.game_uuid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
