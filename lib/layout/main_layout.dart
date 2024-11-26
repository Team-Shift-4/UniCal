
import 'package:calendar/component/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/calendar_view.dart';

class MainLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(calendarName),
      // ),
      body: ChangeNotifierProvider(
        create: (context) => HeaderModel(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(),
            Flexible(child: CalendarView(),)
            // Header(),
            // CalendarView(),
            // DetailView()
          ],
        ),
      )
    );
  }
}