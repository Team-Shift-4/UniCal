
import 'package:flutter/material.dart';

class CalendarView extends StatefulWidget{
  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView>{
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