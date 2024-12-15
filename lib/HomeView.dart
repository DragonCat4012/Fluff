import 'package:yugioh_health_tracker/GamesView.dart';
import 'package:yugioh_health_tracker/Util/DataHandler.dart';
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
  String currentGame = ""; // TODO: maybe remove

  void newGame() async {
    storage.createNewGame();

    setState(() {
      currentGame = storage.currentGame.game_uuid;
    });
  }

  @override
  void initState() {
    storage.loadGames().then((value) {
      currentGame = storage.currentGame.game_uuid;
      // print('> Init View2: ${storage.currentGame.game_uuid}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
                        storage.currentGame.game_uuid,
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
                          newGame();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LandscapeOne(
                                      title: "Game",
                                      storage: storage,
                                    )),
                          );
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
                                builder: (context) => PortraitView(
                                    title: "Game", storage: storage)),
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
                                    title: "Game", storage: storage)),
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
