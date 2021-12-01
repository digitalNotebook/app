import 'package:escola/providers/subjects.dart';

import '../models/homework.dart';
import '../enums/filters_class.dart';

class Homeworks extends Subjects {
  List<Homework> _homeworks = [
    Homework(
      id: 'h1',
      title: 'Present Simple',
      description: 'Questions about present simple',
      status: Filters.DONE,
      dataParaSerFeito: DateTime.utc(2021, 10, 22),
    ),
    Homework(
      id: 'h2',
      title: 'Irregular verbs',
      description: 'Questions about irregular verbs',
      status: Filters.UNDONE,
      dataParaSerFeito: DateTime.utc(2021, 10, 25),
    ),
    Homework(
        id: 'h3',
        title: 'Daily Routine',
        description: 'Questions about Daily Routine',
        status: Filters.DONE,
        dataParaSerFeito: DateTime.utc(2021, 10, 26)),
    Homework(
        id: 'h4',
        title: 'Awkward, Odd, Strange',
        description: 'The difference among them',
        status: Filters.UNDONE,
        dataParaSerFeito: DateTime.utc(2021, 10, 27)),
  ];

  @override
  Homework findById(String id) {
    return _homeworks.firstWhere((cadaHomework) => cadaHomework.id == id);
  }

  @override
  List<Homework> getAll() {
    return [..._homeworks];
  }

  List<Homework> getHomeworksWithThisFilter(Filters filter) {
    return _homeworks
        .where((cadaHomework) => cadaHomework.status == filter)
        .toList();
  }

  // List<Homework> get items {
  //   return [..._items];
  // }
}
