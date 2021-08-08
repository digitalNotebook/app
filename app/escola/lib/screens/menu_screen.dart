import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  static const pageName = '/menu';

  //a ideia é substituir os Expanded
  Widget buildExpanded(Widget child, int flex) {
    return Expanded(
      flex: flex,
      child: child,
    );
  }

  String saudacao() {
    var hora = int.parse(DateFormat('HH').format(DateTime.now()));
    var minuto = int.parse(DateFormat('mm').format(DateTime.now()));

    print('Hora atual: $hora:$minuto');

    var saudacao = '';

    //good morning 05:00 as 12:59
    //good afternoon 13:00 as 18:30
    //good evening 18:31 as 11:59
    //its noon *spooky face* 12:00 as 04:59

    if ((hora >= 5 && minuto >= 0) && (hora <= 12 && minuto <= 59))
      saudacao = 'Good morning, ';
    else if ((hora >= 13 && minuto >= 0) && (hora <= 18 && minuto <= 59))
      saudacao = 'Good afternoon, ';
    else if ((hora >= 19 && minuto >= 0) && (hora <= 23 && minuto <= 59))
      saudacao = 'Good evening, ';
    else
      saudacao = 'Go to sleep, ';
    return saudacao;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        //ocupa todo o espaço horizontal
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //SAUDAÇÃO
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Row(
                  children: [
                    Text(
                      saudacao(),
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Felipe',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints.expand(),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  child: Icon(Icons.person),
                                ),
                                Text('Nome do professor'),
                              ],
                            ),
                            Divider(),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'When your program contains messages that need translation, these must be extracted from the program source, sent to human translators, and the results need to be incorporated. The code for this is in the Intl_translation package',
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          shape:
                              Border.all(color: Theme.of(context).accentColor),
                          leading: CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          title: Text('Assunto da aula'),
                          subtitle: Text('Nome da Aula'),
                          trailing: Icon(Icons.play_arrow),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2021),
                lastDay: DateTime.utc(2022),
                headerVisible: false,
                calendarFormat: CalendarFormat.week,
                shouldFillViewport: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
