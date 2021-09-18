import 'package:escola/models/aula.dart';
import 'package:escola/providers/aulas.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class MenuCalendar extends StatefulWidget {
  const MenuCalendar({Key? key}) : super(key: key);

  @override
  _MenuCalendarState createState() => _MenuCalendarState();
}

class _MenuCalendarState extends State<MenuCalendar> {
  var workDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];

  late DateTime _kFirstDay;
  late DateTime _kLastDay;
  DateTime _focusedDay = DateTime.now();
  late DateTime _selectedDay;
  var _isInit = true;

  DateTime _setKFirstDay() {
    var firstDay;
    var actualDate = DateTime.now();
    var actualDateString = DateFormat.E().format(actualDate);

    switch (actualDateString) {
      case 'Sun':
        firstDay = actualDate.subtract(Duration(days: -1));
        break;
      case 'Sat':
        firstDay = actualDate.subtract(Duration(days: -2));
        break;
      case 'Tue':
        firstDay = actualDate.subtract(Duration(days: 1));
        break;
      case 'Wed':
        firstDay = actualDate.subtract(Duration(days: 2));
        break;
      case 'Thu':
        firstDay = actualDate.subtract(Duration(days: 3));
        break;
      case 'Fri':
        firstDay = actualDate.subtract(Duration(days: 4));
        break;
      default:
        firstDay = actualDate;
        break;
    }

    return firstDay;
  }

  void _handleonDisabledDayTapped(DateTime day) {
    String weekday;
    if (day.weekday == 6) {
      weekday = 'Saturdays';
    } else {
      weekday = 'Sundays';
    }

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('There is no homework on $weekday'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  List<Aula> _getEventsForDay(DateTime day) {
    print('Entrei aqui para ver os eventos do dia: $day');
    var aulas = Provider.of<Aulas>(context, listen: false).items;
    return aulas.where((aula) => aula.dataAula.compareTo(day) == 0).toList();
  }

  @override
  void initState() {
    Future.delayed(Duration.zero).then(
      (value) {
        // //sempre retorna segunda
        // _kFirstDay = _setKFirstDay();
        // //sempre será sexta
        // _kLastDay = _kFirstDay.subtract(Duration(days: -4));
        // //o dia corrente
        // _focusedDay = _kFirstDay;
        // //o dia corrente
        // _selectedDay = _focusedDay;
      },
    );

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      //sempre retorna segunda
      _kFirstDay = _setKFirstDay();
      //sempre será sexta
      _kLastDay = _kFirstDay.subtract(Duration(days: -4));
      //o dia corrente
      _focusedDay = _kFirstDay;
      //o dia corrente
      _selectedDay = _focusedDay;
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TableCalendar(
        focusedDay: _focusedDay,
        firstDay: _kFirstDay,
        lastDay: _kLastDay,
        onDisabledDayTapped: _handleonDisabledDayTapped,
        eventLoader: (day) {
          return _getEventsForDay(day);
        },
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
        headerVisible: false,
        calendarFormat: CalendarFormat.week,
        shouldFillViewport: true,
        weekendDays: [
          DateTime.monday,
          DateTime.tuesday,
          DateTime.wednesday,
          DateTime.thursday,
          DateTime.friday,
        ],
        calendarBuilders: CalendarBuilders(
          disabledBuilder: (ctx, date, events) {
            if (date.weekday == DateTime.saturday) {
              return Center(
                child: Text(
                  'SAT',
                  style: TextStyle(fontSize: 10),
                ),
              );
            } else {
              return Center(
                child: Text(
                  'SUN',
                  style: TextStyle(fontSize: 10),
                ),
              );
            }
          },
          selectedBuilder: (ctx, date, events) {},
          dowBuilder: (ctx, day) {
            if (!(day.weekday == DateTime.sunday ||
                day.weekday == DateTime.saturday)) {
              final text = DateFormat.E().format(day);
              return Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'IndieFlower',
                    fontSize: 14,
                  ),
                ),
              );
            } else {
              return SizedBox(
                width: 1,
              );
            }
          },
        ),
      ),
    );
  }
}
