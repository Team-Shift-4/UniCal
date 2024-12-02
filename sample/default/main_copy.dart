import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavortie() {
    favorites.contains(current) 
      ? favorites.remove(current)
      : favorites.add(current);

    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    Widget page;
    switch (selectedIndex){
      case 0: page = GeneratorPage(); break;
      // case 1: page = Placeholder(); break;
      case 1: page =  FavoritesPage(); break;
      default: throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(
      builder: (context, constraint) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraint.maxWidth >= 600,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home')
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites')
                    )
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (v) {
                    print('selected: $v');
                    setState((){
                      selectedIndex = v;
                    });
                  },
                )
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                )
              )
            ]
          )
        );
      }
    );
  }
}

class GeneratorPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon = appState.favorites.contains(pair)
        ? Icons.favorite
        : Icons.favorite_border;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(pair: pair),
            SizedBox(height: 15,key: super.key),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: (){
                    appState.toggleFavortie();
                  },
                  icon: Icon(icon),
                  label: Text('Like')
                ),
                SizedBox(width: 10),
                
                ElevatedButton(
                  onPressed: () {
                    print('pressed!');
                    appState.getNext();
                  },
                  child: Text('Next')
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: '${pair.first} ${pair.second}',
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MyAppState appState = context.watch<MyAppState>();
    // List<WordPair> favorites = appState.favorites;

    List<WordPair> favorites = context.watch<MyAppState>().favorites;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: favorites.map((fav){
            return Text(
              fav.asString,
            );
          }).toList(),
        )
      ),
    );
    
  }

}