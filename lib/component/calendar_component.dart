
import 'package:flutter/material.dart';

class CalendarComponent extends StatefulWidget{
  @override
  State<CalendarComponent> createState() => _CalendarComponentState();
}

class _CalendarComponentState extends State<CalendarComponent>{
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // return Container(
    //       color: ColorScheme.dark().onPrimary,
    //       // color: Colors.blue,
    // );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          // color: ColorScheme.dark().onPrimary,
          color: Colors.blue,
          // child: Expanded(child: ColoredBox(color: ColorScheme.dark().onPrimary),),
        )
      ],
    );
  }
}