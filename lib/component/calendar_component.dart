import 'package:flutter/material.dart';
import 'package:calendar/component/calandar_year_header.dart';
import 'calendar_header_month.dart';

class CalendarComponent extends StatefulWidget{
  @override
  State<CalendarComponent> createState() => _CalendarComponentState();
}

class _CalendarComponentState extends State<CalendarComponent>{
  DateTime dateContext = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: CalandarYearHeader()
        ),
        Expanded(
          flex: 2,
          child:  CalendarHeaderMonth()
        ),
        Expanded(
          flex: 6,
          child: Text("test")
        ),
      ],
    );
  }
}