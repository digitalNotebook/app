import '../models/homework.dart';
import 'package:flutter/foundation.dart';

class Homeworks with ChangeNotifier {
  List<Homework> _items = [
    Homework(
      id: 'h1',
      title: 'Present Simple',
      description: 'Questions about present simple',
      status: Status.UNDONE,
      dataRealizado: DateTime.now().subtract(Duration(days: 2)),
    ),
    Homework(
      id: 'h2',
      title: 'Irregular verbs',
      description: 'Questions about irregular verbs',
      status: Status.UNDONE,
      dataRealizado: DateTime.now().subtract(Duration(days: 2)),
    ),
    Homework(
      id: 'h3',
      title: 'Daily Routine',
      description: 'Questions about Daily Routine',
      status: Status.UNDONE,
      dataRealizado: DateTime.now().subtract(Duration(days: 2)),
    ),
    Homework(
      id: 'h4',
      title: 'Awkward, Odd, Strange',
      description: 'The difference among them',
      status: Status.UNDONE,
      dataRealizado: DateTime.now().subtract(Duration(days: 2)),
    ),
  ];

  List<Homework> get items {
    return [..._items];
  }
}
