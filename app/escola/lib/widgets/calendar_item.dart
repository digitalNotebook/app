import 'package:escola/models/aula.dart';
import 'package:escola/models/homework.dart';
import 'package:escola/models/subject.dart';
import 'package:escola/providers/aulas.dart';
import 'package:escola/providers/homeworks.dart';
import 'package:escola/screens/class_detail_screen.dart';
import 'package:escola/screens/exercicios_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../helpers/calendar_helpers.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CalendarItem extends StatefulWidget {
  const CalendarItem({Key? key}) : super(key: key);

  @override
  _CalendarItemState createState() => _CalendarItemState();
}

class _CalendarItemState extends State<CalendarItem> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  var _isInit = true;

  late DateTime _currentDay;

  late List<Subject> _aulasEHomeworks;
  late List<Subject> _aulas;
  late List<Subject> _homeworks;
  late List<Subject> _subjectsEvents;

  @override
  void didChangeDependencies() {
    //executa somente uma vez
    if (_isInit) {
      _aulas = Provider.of<Aulas>(context, listen: false).getAll();
      _homeworks = Provider.of<Homeworks>(context, listen: false).getAll();

      _aulasEHomeworks = [];
      _subjectsEvents = [];

      _aulasEHomeworks.addAll(_aulas);
      _aulasEHomeworks.addAll(_homeworks);

      _currentDay = DateTime.now();
      _selectedDay = _currentDay;
    }
    super.didChangeDependencies();
  }

  void _openScreen(Subject subject) {
    if (subject.runtimeType == Homework) {
      pushNewScreenWithRouteSettings(context,
          screen: ExerciciosScreen(),
          settings: RouteSettings(
              name: ExerciciosScreen.pageName, arguments: subject.id),
          pageTransitionAnimation: PageTransitionAnimation.fade);
    } else if (subject.runtimeType == Aula) {
      pushNewScreenWithRouteSettings(context,
          screen: ClassDetailScreen(),
          settings: RouteSettings(
              name: ClassDetailScreen.pageName, arguments: subject),
          pageTransitionAnimation: PageTransitionAnimation.fade);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          focusedDay: _focusedDay,
          firstDay: DateTime(2021, 1, 1),
          lastDay: DateTime(2022, 1, 12),
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
            print('Dia selecionado: $selectedDay');
            if (selectedDay.isAfter(_currentDay)) {
              CalendarHelper.onTapDisabledDay(selectedDay, context);
            } else {
              //abre a aula ou homework
              // CalendarHelper.onTapThisDay(
              //     selectedDay, context, _aulasEHomeworks);
              //preciso exibir os eventos do dia selecionado, se houver
              _subjectsEvents = CalendarHelper.getSubjectOfThis(
                  selectedDay, _aulasEHomeworks);
            }
            setState(() {
              _selectedDay = selectedDay;
            });
          },
          eventLoader: (day) {
            return CalendarHelper.getSubjectOfThis(day, _aulasEHomeworks);
          },
          calendarBuilders:
              CalendarBuilders(markerBuilder: (ctx, date, events) {
            var numberOfEvents = events.length;
            print('N??mero de eventos ${events.length} do dia $date');
            if (numberOfEvents > 0) {
              if (CalendarHelper.compareDates(_currentDay, date)) {
                //se entrou aqui encontrou a aula, temos 5 dias de homework
                //icone para a aula
                return Icon(
                  Icons.check_box_outlined,
                  size: 14,
                );
              } else if (date.isAfter(_currentDay)) {
                return Icon(
                  Icons.alarm,
                  size: 14,
                );
              } else {
                return Icon(
                  Icons.alarm_off_sharp,
                  size: 14,
                );
              }
            } else {
              return SizedBox();
            }
          },
                  //remove a marca do focusedDay
                  todayBuilder: (ctx, date, events) {
            return Center(
              child: Text(
                date.day.toString(),
              ),
            );
          }, selectedBuilder: (ctx, date, events) {
            print('Lista de eventos: $events e data: $date');
            return Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(
                bottom: 15,
              ),
              child: Text(
                date.day.toString(),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
              ),
            );
          }),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: _subjectsEvents.isNotEmpty
              ? ListView.builder(
                  itemCount: _subjectsEvents.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 3,
                      child: ListTile(
                        title: Text(_subjectsEvents[index].title),
                        leading: Icon(Icons.play_arrow_rounded),
                        onTap: () {
                          _openScreen(_subjectsEvents[index]);
                        },
                      ),
                    );
                  },
                )
              : Text('No events'),
        )
      ],
    );
  }
}
