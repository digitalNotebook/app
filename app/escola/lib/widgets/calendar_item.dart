import 'package:escola/models/aula.dart';
import 'package:escola/providers/aulas.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../helpers/calendar_helpers.dart';

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
  late List<Aula> _aulas;
  late DateTime _currentDay;

  @override
  void didChangeDependencies() {
    //executa somente uma vez
    if (_isInit) {
      _aulas = Provider.of<Aulas>(context, listen: false).items;
      _currentDay = DateTime.now();
    }
    super.didChangeDependencies();
  }

  List<Aula> _getClassesOfThis(DateTime day) {
    print('Entrei aqui para ver os eventos do dia: $day');
    return _aulas.where((aula) => aula.dataAula.compareTo(day) == 0).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          eventLoader: (day) {
            return _getClassesOfThis(day);
          },
          calendarBuilders: CalendarBuilders(
            markerBuilder: (ctx, date, events) {
              var numberOfEvents = events.length;
              print('Número de eventos ${events.length} do dia $date');
              if (numberOfEvents > 0) {
                if (CalendarHelper.compareDates(_currentDay, date)) {
                  //se entrou aqui encontrou a aula, temos 5 dias de homework
                  //icone para a aula
                  return Icon(
                    Icons.video_library_rounded,
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
                return Icon(
                  Icons.clear,
                  size: 14,
                );
              }
            },
          ),
        ),
        const SizedBox(
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
    );
  }
}
