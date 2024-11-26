
import 'package:flutter/material.dart';

import 'layout/main_layout.dart';

void main(){
  runApp(UniCal());
}

class UniCal extends StatelessWidget {
  const UniCal();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'UniCal',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.light()
        ),
        home: MainLayout(),
    );
    // return ChangeNotifierProvider(
    //   create: (context) => UniCalState(),
    //   child: MaterialApp(
    //     title: 'UniCal',
    //     theme: ThemeData(
    //       useMaterial3: true,
    //       colorScheme: ColorScheme.light()
    //     ),
    //     home: MainLayout(),
    //   ),
    // );
  }

   
}

class UniCalState extends ChangeNotifier{
  Mode mode = Mode.basic;
}

enum Mode {
  basic,
  salad; 
}