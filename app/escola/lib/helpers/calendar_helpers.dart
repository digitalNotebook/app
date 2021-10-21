import 'package:escola/models/aula.dart';
import 'package:escola/models/homework.dart';
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
    List<Aula> aulas,
  ) {
    var aulasMarcadas = CalendarHelper.getClassesOfThis(selectedDay, aulas);

    if (aulasMarcadas.length > 0) {
      //formatamos a data para fazer a comparação
      var selectedDayFormatted = DateFormat.yMMMMEEEEd().format(selectedDay);

      //comparamos as datas
      var index = aulas.indexWhere((aula) =>
          DateFormat.yMMMMEEEEd()
              .format(aula.dataAula)
              .compareTo(selectedDayFormatted) ==
          0);
      pushNewScreenWithRouteSettings(context,
          screen: ClassDetailScreen(),
          settings: RouteSettings(
              name: ClassDetailScreen.pageName, arguments: aulas[index]),
          pageTransitionAnimation: PageTransitionAnimation.fade);
    } else {
      CalendarHelper.onTapDisabledDay(selectedDay, context);
    }
  }

  static List<Aula> getClassesOfThis(DateTime day, List<Aula> aulas) {
    // print('Entrei aqui para ver os eventos do dia: $day');
    return aulas.where((aula) => aula.dataAula.compareTo(day) == 0).toList();
  }

  static List<Homework> getHomeworksOfThis(
      DateTime day, List<Homework> homeworks) {
    // print('Entrei aqui para ver os eventos do dia: $day');
    return homeworks
        .where((homework) => homework.dataParaSerFeito.compareTo(day) == 0)
        .toList();
  }

  //ao inves de passar dynamic usar alguma classe abstrata ou interface
  static List<dynamic> getClassesAndHomeworks(
      DateTime day, List<Homework> homeworks, List<Aula> aulas) {
    List<dynamic> classesAndHomeworks = [];

    var allClasses = CalendarHelper.getClassesOfThis(day, aulas);
    var allHomeworks = CalendarHelper.getHomeworksOfThis(day, homeworks);

    classesAndHomeworks.addAll(allClasses);
    classesAndHomeworks.addAll(allHomeworks);

    return classesAndHomeworks;
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
