import 'package:escola/models/iprovider.dart';
import 'package:escola/models/subject.dart';
import 'package:flutter/cupertino.dart';

abstract class Subjects with ChangeNotifier implements IProvider {
  // ignore: unused_field
  late List<Subject> _items;
}
