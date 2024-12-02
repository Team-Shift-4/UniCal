
import 'package:calendar/component/header.dart';
import 'package:calendar/view/calendar_view.dart';
import 'package:calendar/view/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(calendarName),
      // ),
      body: ChangeNotifierProvider(
        create: (context) => HeaderModel(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Header()
              ),
              Expanded(
                flex: 4,
                child: CalendarView()
              ),
              const Divider(height: 2, thickness: 2),
              Expanded(
                flex: 4,
                child: DetailView()
              ),
              const Divider(height: 2, thickness: 2),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.red,
                )
              ),
            ],
          ),
        ),
      )
    );
  }
}