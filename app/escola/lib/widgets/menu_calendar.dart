import 'package:escola/models/aula.dart';
import 'package:escola/providers/aulas.dart';
import 'package:escola/screens/class_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
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
  late DateTime _currentDay;
  late DateTime _selectedDay;
  late List<Aula> _aulas;
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

  void _onTapDisabledDay(DateTime day) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('There is no homework on ${DateFormat.EEEE().format(day)}'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _onTapDayIsNotToday(DateTime selectedDay) {
    String message;
    if (selectedDay.isAfter(_currentDay)) {
      message = 'Homework not avalaible yet!';
    } else {
      message = 'You cannot do this homework anymore';
    }
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _onTapToday() {
    var currentDayFormated = DateFormat.yMMMMEEEEd().format(_currentDay);
    var index = _aulas.indexWhere((aula) =>
        DateFormat.yMMMMEEEEd()
            .format(aula.dataAula)
            .compareTo(currentDayFormated) ==
        0);
    pushNewScreenWithRouteSettings(context,
        screen: ClassDetailScreen(),
        settings: RouteSettings(
            name: ClassDetailScreen.pageName, arguments: _aulas[index]),
        pageTransitionAnimation: PageTransitionAnimation.fade);
  }

  List<Aula> _getEventsForDay(DateTime day) {
    print('Entrei aqui para ver os eventos do dia: $day');
    //futuramente carregar os homeworks

    _aulas = Provider.of<Aulas>(context, listen: false).items;
    return _aulas.where((aula) => aula.dataAula.compareTo(day) == 0).toList();
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
        // _currentDay = _kFirstDay;
        // //o dia corrente
        // _selectedDay = _currentDay;
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
      _currentDay = DateTime.now();
      _selectedDay = _currentDay;
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TableCalendar(
        focusedDay: _currentDay,
        currentDay: _currentDay,
        firstDay: _kFirstDay,
        lastDay: _kLastDay,
        onDisabledDayTapped: _onTapDisabledDay,
        eventLoader: (day) {
          return _getEventsForDay(day);
        },
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(selectedDay, _currentDay)) {
            _onTapDayIsNotToday(selectedDay);
          } else {
            _onTapToday();
          }
        },
        onPageChanged: (focusedDay) {
          _currentDay = focusedDay;
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
          markerBuilder: (ctx, date, events) {
            var numberOfEvents = events.length;

            if (numberOfEvents > 0) {
              return Icon(Icons.video_library_rounded);
            } else if (date.isAfter(_currentDay)) {
              return Icon(Icons.alarm);
            } else if (date.isBefore(_currentDay)) {
              return Icon(Icons.alarm_off_sharp);
            } else {
              return Icon(Icons.clear);
            }
          },
          selectedBuilder: (ctx, date, events) {
            return Center(
              child: Text(
                date.day.toString(),
              ),
            );
          },
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
