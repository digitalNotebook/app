import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class MenuCalendar extends StatefulWidget {
  const MenuCalendar({Key? key}) : super(key: key);

  @override
  _MenuCalendarState createState() => _MenuCalendarState();
}

class _MenuCalendarState extends State<MenuCalendar> {
  late DateTime dateTime;

  DateTime? _selectedDay;
  DateTime? _focusedDay;

  DateTime _verificaFinalDeSemana(DateTime dateTime) {
    var day = DateFormat.E().format(dateTime);

    if (day.contains('Sat')) {
      dateTime = dateTime.subtract(Duration(days: -2));
    }
    if (day.contains('Sun')) {
      dateTime = dateTime.subtract(Duration(days: -1));
    }

    return dateTime;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    dateTime = _verificaFinalDeSemana(DateTime.now());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TableCalendar(
        focusedDay: dateTime,
        firstDay: dateTime.subtract(Duration(days: 0)),
        lastDay: dateTime.subtract(Duration(days: -4)),
        headerVisible: false,
        calendarFormat: CalendarFormat.week,
        shouldFillViewport: true,
        currentDay: _focusedDay,
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(fontSize: 0),
        ),
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
          ),
          weekendDecoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          weekendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          disabledTextStyle: TextStyle(
            fontSize: 0,
          ),
        ),
        weekendDays: [
          DateTime.monday,
          DateTime.tuesday,
          DateTime.wednesday,
          DateTime.thursday,
          DateTime.friday,
        ],
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
