import 'package:flutter/material.dart';

class CalendarBody extends StatelessWidget{

  final List<String> dayList = List.unmodifiable(["Sun","Mon","Tue","Wed","Thu", "Fri","Sat"]);
  final DateTime currentDate = DateTime.now();

  List<List<DateTime>> getDateMatrix(){
    DateTime curMonthfirstDay = DateTime(currentDate.year,currentDate.month,1);
    DateTime nextMonthFisrtDay = DateTime(currentDate.year,currentDate.month + 1,1);
    DateTime curMonthLastDay = nextMonthFisrtDay.subtract(Duration(days: 1));
    DateTime startDay = curMonthfirstDay.subtract(Duration(days: (curMonthfirstDay.weekday + 7) % 7));
    DateTime endDay = curMonthLastDay.add(Duration(days: 6 - (curMonthLastDay.weekday + 7) % 7));
    
    List<List<DateTime>> result = [];
    List<DateTime> week = [];
    DateTime forCondition = endDay.add(Duration(days: 1));
    for(DateTime date = startDay; date.isBefore(forCondition); date = date.add(Duration(days: 1)) ){
        week.add(date);
        if(date.weekday == 6){
           result.add(week);
           week = [];
        }
    }
    return result;
  } 
  Color getColor(date){
    if(date.month != currentDate.month) {
      return Colors.grey;
    }

    return switch(date.weekday) {
      7 => Colors.red,
      6 => Colors.blue,
      _ => Colors.black
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: dayList.map((day) => Text(
            day,
            style: TextStyle(
              fontSize: 17,
              color: switch(day) {
                'Sun' => Colors.red,
                'Sat' => Colors.blue,
                String() => Colors.black
              },
            ),
          )).toList(),
        ),
        ...getDateMatrix().map((week) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: week.map((day) => Expanded(
            child: Text(
              day.day.toString(),
              style: TextStyle(
                fontSize: 17,
                color: getColor(day),
              ),
              textAlign: TextAlign.center,
            )  
          )).toList(),
        ))
      ],
    );
  }

}