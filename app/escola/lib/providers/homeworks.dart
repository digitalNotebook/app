import 'package:escola/models/iescola.dart';

import '../models/homework.dart';
import 'package:flutter/foundation.dart';

class Homeworks with ChangeNotifier implements IEscola {
  List<Homework> _items = [
    Homework(
      id: 'h1',
      title: 'Present Simple',
      description: 'Questions about present simple',
      status: Status.UNDONE,
      dataParaSerFeito: DateTime.utc(2021, 10, 22),
    ),
    Homework(
      id: 'h2',
      title: 'Irregular verbs',
      description: 'Questions about irregular verbs',
      status: Status.UNDONE,
      dataParaSerFeito: DateTime.utc(2021, 10, 25),
    ),
    Homework(
        id: 'h3',
        title: 'Daily Routine',
        description: 'Questions about Daily Routine',
        status: Status.UNDONE,
        dataParaSerFeito: DateTime.utc(2021, 10, 26)),
    Homework(
        id: 'h4',
        title: 'Awkward, Odd, Strange',
        description: 'The difference among them',
        status: Status.UNDONE,
        dataParaSerFeito: DateTime.utc(2021, 10, 27)),
  ];

  // List<Homework> get items {
  //   return [..._items];
  // }

  @override
  List<Homework> getAll() {
    return [..._items];
  }
}
