import 'package:escola/models/subject.dart';

enum Status {
  DONE,
  UNDONE,
}

class Aula extends Subject {
  final String id;
  final String title;
  final String subtitle;
  final String imagesUrl;
  final DateTime dataAula;
  final String description;
  final String videoUrl;
  final Status status;
  final DateTime horaInicio;
  final DateTime horaFim;
  // final Homework homework;
  bool isFavorite;

  Aula({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imagesUrl,
    required this.dataAula,
    required this.description,
    required this.videoUrl,
    required this.status,
    required this.horaInicio,
    required this.horaFim,
    this.isFavorite = false,
  }) {
    super.id = this.id;
    super.dateToBeMade = this.dataAula;
    super.description = this.description;
    super.title = this.title;
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
