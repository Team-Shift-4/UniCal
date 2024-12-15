import 'package:flutter/material.dart';

class CalendarHeaderMonth extends StatelessWidget{

  final List<String> monthTextList = List.unmodifiable(['Jan','Feb','Mar','Apr','May','Jun','Jul']);
  // final List<int> range = [1,2,3,4,5];
  final int current = 5;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(5, (i) => i)
        .map((i) { 
          String textVal;
          String month = monthTextList[i];
          switch(i) {
            case 0 : textVal = month.characters.first; break;
            case 4 : textVal = month.characters.last; break;
            default : textVal = month; break;
          }

          return Text(
            textVal,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: i == 2 ? Colors.black :
                    (i == 1 || i == 3) ? Colors.grey.shade600 :
                    Colors.grey.shade300,
            ),
          );
        })
        .toList()
      ,
    );
  }

}