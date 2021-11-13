import 'package:escola/helpers/calendar_helpers.dart';
import 'package:escola/models/aula.dart';
import 'package:escola/models/homework.dart';
import 'package:escola/models/subject.dart';
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
  late DateTime _focusedDay;
  late List<Subject> _aulas;
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

  // List<Homework> _getHomeworkOfThis(DateTime day) {
  //   print('Entrei aqui para ver os eventos do dia: $day');
  //   return;
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      //Carrega uma lista de aulas
      _aulas = Provider.of<Aulas>(context, listen: false).getAll();
      //sempre retorna segunda
      _kFirstDay = _setKFirstDay();
      print('Primeiro dia do calendário: $_kFirstDay');
      //sempre será sexta
      _kLastDay = _kFirstDay.subtract(Duration(days: -4));
      //o dia corrente
      _currentDay = DateTime.now();
      print('Dia atual $_currentDay');

      if (_kFirstDay.isAfter(_currentDay)) {
        print('Testando IF');
        _focusedDay = _kFirstDay;
        _currentDay = _focusedDay;
      } else {
        print('Testando ELSE');
        _focusedDay = _currentDay;
      }

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
        focusedDay: _focusedDay,
        currentDay: _currentDay,
        firstDay: _kFirstDay,
        lastDay: _kLastDay,
        onDisabledDayTapped: (day) {
          CalendarHelper.onTapDisabledDay(day, context);
        },
        eventLoader: (day) {
          return CalendarHelper.getSubjectOfThis(day, _aulas);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!(selectedDay.isAfter(_currentDay))) {
            CalendarHelper.onTapThisDay(selectedDay, context, _aulas);
            _selectedDay = selectedDay;
          } else {
            CalendarHelper.onTapDisabledDay(selectedDay, context);
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
            print('Número de eventos ${events.length} do dia $date');
            if (numberOfEvents > 0) {
              if (CalendarHelper.compareDates(_currentDay, date)) {
                //se entrou aqui encontrou a aula, temos 5 dias de homework
                //icone para a aula
                return Icon(Icons.check_box_outline_blank_sharp);
              } else if (date.isAfter(_currentDay)) {
                return Icon(Icons.alarm);
              } else {
                return Icon(Icons.alarm_off_sharp);
              }
            } else {
              return Icon(Icons.indeterminate_check_box_outlined);
            }
          },
          //remover a marca do focusedDay
          todayBuilder: (ctx, date, events) {
            return Center(
              child: Text(
                date.day.toString(),
              ),
            );
          },

          // selectedBuilder: (ctx, date, events) {
          //   return Center(
          //     child: Text(
          //       date.day.toString(),
          //     ),
          //   );
          // },
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
