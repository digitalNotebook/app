import 'package:flutter/cupertino.dart';

abstract class Subject with ChangeNotifier {
  late final String id;
  late final String title;
  late final String description;
  late final DateTime dataParaSerFeito;
}
