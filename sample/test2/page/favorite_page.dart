import '../my_app_state.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MyAppState appState = context.watch<MyAppState>();
    // List<WordPair> favorites = appState.favorites;

    List<WordPair> favorites = context.watch<MyAppState>().favorites;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: favorites.map((fav){
          return Text(
            fav.asString,
          );
        }).toList(),
      )
    );
    // return Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: favorites.map((fav){
    //         return Text(
    //           fav.asString,
    //         );
    //       }).toList(),
    //     )
    //   ),
    // );
    
  }

}