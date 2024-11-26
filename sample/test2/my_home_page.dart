import 'page/favorite_page.dart';
import 'page/generator_page.dart';
import 'package:flutter/material.dart';

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        child: Text('test1'),
                      ),
                      Container(
                        color: Theme.of(context).colorScheme.inverseSurface,
                        child: Text('test2'),
                      ),
                      GeneratorPage(),
                      FavoritesPage()
                    ],
                  ),
                )
              )
            ]
          )
        );
      }
    );
  }
}