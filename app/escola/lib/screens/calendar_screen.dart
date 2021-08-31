import 'package:escola/screens/insert_class_screen.dart';
import 'package:escola/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  static const pageName = '/calendar';

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    _selectedDay = _focusedDay;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Buildei a tela Calendar');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calendar',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            pushNewScreen(
              context,
              screen: ProfileScreen(),
              pageTransitionAnimation: PageTransitionAnimation.fade,
            );
          },
          icon: Icon(Icons.person),
        ),
        actions: [
          IconButton(
            onPressed: () {
              pushNewScreenWithRouteSettings(
                context,
                screen: InsertClassScreen(),
                withNavBar: false,
                settings: RouteSettings(
                  name: InsertClassScreen.pageName,
                  arguments: _focusedDay,
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime(2021, 1, 1),
            lastDay: DateTime(2022, 1, 1),
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onFormatChanged: (format) {
              if (format != _calendarFormat) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          Text('Eventos do dia : ${DateFormat.d().format(_focusedDay)}'),
          Container(
            width: double.infinity,
            alignment: Alignment.topCenter,
            constraints: BoxConstraints(minHeight: 50),
            child: Text('Lista de eventos'),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
          )
        ],
      ),
    );
  }
}
