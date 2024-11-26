import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';

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