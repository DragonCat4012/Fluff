import 'package:fluff/GamesView.dart';
import 'package:fluff/Util/DataHandler.dart';
import 'package:flutter/material.dart';
import 'GameView.dart';
import 'Util/Styling.dart';
import 'GameViews/PortraitView.dart';
import 'GameViews/LandscapeOne.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  final DataHandler storage = DataHandler();
  String currentGame = "";

  @override
  void initState() {
    super.initState();
    storage.loadGames();
    currentGame = storage.currentGame.game_uuid;
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
        title: const Text("Home"),
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
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MyHomePage(title: "UwU")),
                          );
                        },
                        style: Styling.defaultButtonStyle(),
                        child: const Text("Load Game"),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton.icon(
                        style: Styling.defaultButtonStyle(),
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          storage.createNewGame();
                          currentGame = storage.currentGame.game_uuid;
                        },
                        label: const Text('New Game'),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton.icon(
                        style: Styling.defaultButtonStyle(),
                        icon: const Icon(Icons.folder_open),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamesView(
                                      storage: storage,
                                    )),
                          );
                        },
                        label: const Text('All Games'),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MyHomePage(title: "UwU")),
                          );
                        },
                        style: Styling.defaultButtonStyle(),
                        child: const Text("Logs"),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PortraitView(title: "Game")),
                          );
                        },
                        style: Styling.defaultButtonStyle(),
                        child: const Text("Portrait"),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LandscapeOne(
                                      title: "Game",
                                      storage: storage,
                                    )),
                          );
                        },
                        style: Styling.defaultButtonStyle(),
                        child: const Text("Landscape 1"),
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
