import 'package:escola/models/aula.dart';
import 'package:escola/models/homework.dart';
import 'package:escola/models/subject.dart';
import 'package:escola/screens/class_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CalendarHelper {
  static bool compareDates(DateTime a, DateTime b) {
    var format = DateFormat.yMMMMEEEEd().format(a);
    return DateFormat.yMMMMEEEEd().format(a).compareTo(format) == 0;
  }

  static void onTapThisDay(
    DateTime selectedDay,
    BuildContext context,
    List<Subject> subjects,
  ) {
    var aulasMarcadas = CalendarHelper.getSubjectOfThis(selectedDay, subjects);

    if (aulasMarcadas.length > 0) {
      //formatamos a data para fazer a comparação
      var selectedDayFormatted = DateFormat.yMMMMEEEEd().format(selectedDay);

      //comparamos as datas
      var index = subjects.indexWhere((aula) =>
          DateFormat.yMMMMEEEEd()
              .format(aula.dataParaSerFeito)
              .compareTo(selectedDayFormatted) ==
          0);
      pushNewScreenWithRouteSettings(context,
          screen: ClassDetailScreen(),
          settings: RouteSettings(
              name: ClassDetailScreen.pageName, arguments: subjects[index]),
          pageTransitionAnimation: PageTransitionAnimation.fade);
    } else {
      CalendarHelper.onTapDisabledDay(selectedDay, context);
    }
  }

  static List<Subject> getSubjectOfThis(DateTime day, List<Subject> subjects) {
    // print('Entrei aqui para ver os eventos do dia: $day');
    return subjects
        .where((subject) => subject.dataParaSerFeito.compareTo(day) == 0)
        .toList();
  }

  static void onTapDisabledDay(DateTime day, BuildContext context) {
    var currentDay = DateTime.now();
    String message = '';

    //DIA DA SEMANA
    if (!(day.weekday == DateTime.saturday || day.weekday == DateTime.sunday)) {
      //NÃO DISPONIVEL AINDA
      if (day.isAfter(currentDay)) {
        message =
            '${DateFormat.EEEE().format(day)}\'s homework / class not avalaible yet!';
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
}
