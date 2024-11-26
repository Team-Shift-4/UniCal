
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalendarView extends StatefulWidget{
  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView>{
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: ColorScheme.dark().onPrimary,
            child: SizedBox(
              width: double.infinity,
              //얘는 double infinity 안됨 ㅋㅋ;;
              height: 600
            ),
          )
        ],
      )
    ) ;
  }
}