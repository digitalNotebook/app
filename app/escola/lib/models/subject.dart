import 'package:flutter/cupertino.dart';

abstract class Subject with ChangeNotifier {
  late final String id;
  late final String title;
  late final String description;
  late final DateTime dateToBeMade;
  late bool isFavorite;

  String get getId => this.id;
  String get getTitle => this.title;
  String get getDescription => this.description;
  DateTime get getDateToBeMade => this.dateToBeMade;

  void setId(String id) {
    this.id = id;
  }

  void setTitle(String title) {
    this.title = title;
  }

  void setDescription(String description) {
    this.description = description;
  }

  void setDateToBeMade(DateTime date) {
    this.dateToBeMade = date;
  }
}
