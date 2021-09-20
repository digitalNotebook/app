import 'package:flutter/material.dart';
import '../models/message.dart';

class Messages with ChangeNotifier {
  List<Message> _messages = [
    Message(
      'm1',
      'The Column widget does not scroll (and in general it is considered an error to have more children in a Column than will fit in the available room). If you have a line of widgets and want them to be able to scroll if there is insufficient room, consider using a ListView',
      'Leonardo',
      DateTime(2021, 09, 10),
    ),
    Message(
      'm2',
      'ListView is the most commonly used scrolling widget. It displays its children one after another in the scroll direction. In the cross axis, the children are required to fill the ListView.',
      'Leo',
      DateTime(2021, 09, 14),
    ),
    Message(
      'm3',
      'By default, ListView will automatically pad the list\'s scrollable extremities to avoid partial obstructions indicated by MediaQuery\'s padding. To avoid this behavior, override with a zero padding property.',
      'Leo Messi',
      DateTime(2021, 09, 17),
    ),
  ];

  List<Message> get items {
    _filterByDate();
    return [..._messages];
  }

  void _filterByDate() {
    _messages.sort(
      (a, b) => a.date.compareTo(b.date),
    );
  }
}
