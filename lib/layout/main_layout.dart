
import 'package:calendar/component/detail_edit_component.dart';
import 'package:calendar/component/header.dart';
import 'package:calendar/component/calendar/calendar_component.dart';
import 'package:calendar/component/detail_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO header 를 appbar 로 사용
      // appBar: AppBar(
      //   title: Text(calendarName),
      // ),
      body: ChangeNotifierProvider(
        create: (context) => HeaderModel(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Header()
              ),

              Expanded(
                flex: 40,
                child: CalendarComponent()
              ),
              
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(height: 2, thickness: 2)
              ),
            
              Expanded(
                flex: 40,
                child: DetailComponent()
              ),
              
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(height: 2, thickness: 2)
              ),

              Expanded(
                flex: 5,
                child: DetailEditComponent()
              ),
            ],
          ),
        ),
      )
    );
  }
}