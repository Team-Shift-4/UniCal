import '../my_app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widget/big_card.dart';

class GeneratorPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon = appState.favorites.contains(pair)
        ? Icons.favorite
        : Icons.favorite_border;

    return Center(
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
      );
    // return Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         BigCard(pair: pair),
    //         SizedBox(height: 15,key: super.key),
    //         Row(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             ElevatedButton.icon(
    //               onPressed: (){
    //                 appState.toggleFavortie();
    //               },
    //               icon: Icon(icon),
    //               label: Text('Like')
    //             ),
    //             SizedBox(width: 10),
                
    //             ElevatedButton(
    //               onPressed: () {
    //                 print('pressed!');
    //                 appState.getNext();
    //               },
    //               child: Text('Next')
    //             ),
    //           ],
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}