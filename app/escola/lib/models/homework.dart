// import 'package:escola/models/exercicio.dart';

import 'package:escola/models/subject.dart';

enum Status {
  DONE,
  UNDONE,
}

class Homework extends Subject {
  final String id;
  final String title;
  final String description;
  final Status status;
  final DateTime dataParaSerFeito;
  final DateTime? dataRealizadoPeloAluno;
  // final List<Exercicio> exercicios;

  Homework({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.dataParaSerFeito,
    this.dataRealizadoPeloAluno,
    // required this.exercicios,
  }) {
    super.id = this.id;
    super.dataParaSerFeito = this.dataParaSerFeito;
    super.description = this.description;
    super.title = this.title;
  }
}
