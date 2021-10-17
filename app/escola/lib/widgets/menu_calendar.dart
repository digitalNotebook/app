import 'package:escola/helpers/calendar_helpers.dart';
import 'package:escola/models/aula.dart';
import 'package:escola/models/homework.dart';
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
    var currentDay = DateTime.now();
    String message = '';

    //DIA DA SEMANA
    if (!(day.weekday == DateTime.saturday || day.weekday == DateTime.sunday)) {
      //NÃO DISPONIVEL AINDA
      if (day.isAfter(currentDay)) {
        message =
            '${DateFormat.EEEE().format(day)}\'s homework not avalaible yet!';
      }
      //NÃO É POSSÍVEL FAZER MAIS
      else if (day.isBefore(currentDay)) {
        message =
            'It\'s not possible to do ${DateFormat.EEEE().format(day)}\'s homework';
      }
    }
    //FINAL DE SEMANA
    else {
      message = 'There is no homework on ${DateFormat.EEEE().format(day)}';
    }

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _onTapThisDay(DateTime selectedDay) {
    var events = _getClassesOfThis(selectedDay);

    if (events.length > 0) {
      //formatamos a data para fazer a comparação
      var currentDayFormated = DateFormat.yMMMMEEEEd().format(selectedDay);

      //comparamos as datas
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
    } else {
      _onTapDisabledDay(selectedDay);
    }
  }

  List<Aula> _getClassesOfThis(DateTime day) {
    print('Entrei aqui para ver os eventos do dia: $day');
    return _aulas.where((aula) => aula.dataAula.compareTo(day) == 0).toList();
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
      _aulas = Provider.of<Aulas>(context, listen: false).items;
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
        onDisabledDayTapped: _onTapDisabledDay,
        eventLoader: (day) {
          return _getClassesOfThis(day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          _onTapThisDay(selectedDay);
          _selectedDay = selectedDay;
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
                return Icon(Icons.video_library_rounded);
              } else if (date.isAfter(_currentDay)) {
                return Icon(Icons.alarm);
              } else {
                return Icon(Icons.alarm_off_sharp);
              }
            } else {
              return Icon(Icons.clear);
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
