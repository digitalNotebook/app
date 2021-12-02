// import 'package:escola/models/exercicio.dart';

import 'package:escola/enums/filters_class.dart';
import 'package:escola/models/subject.dart';

class Homework extends Subject {
  final String id;
  final String title;
  final String description;
  final Filters status;
  final DateTime dataParaSerFeito;
  final DateTime? dataRealizadoPeloAluno;
  // final List<Exercicio> exercicios;
  bool isFavorite;

  Homework({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.dataParaSerFeito,
    this.dataRealizadoPeloAluno,
    this.isFavorite = false,
    // required this.exercicios,
  }) {
    super.id = this.id;
    super.dateToBeMade = this.dataParaSerFeito;
    super.description = this.description;
    super.title = this.title;
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
