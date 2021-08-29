import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  static const pageName = '/calendar';

  @override
  Widget build(BuildContext context) {
    print('Buildei a tela Calendar');
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime(2021, 1, 1),
            lastDay: DateTime(2022, 1, 1),
          ),
        ],
      ),
    );
  }
}
