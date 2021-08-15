// import 'package:escola/models/exercicio.dart';

enum Status {
  DONE,
  UNDONE,
}

class Homework {
  final String id;
  final String title;
  final String description;
  final Status status;
  final DateTime dataRealizado;
  // final List<Exercicio> exercicios;

  Homework({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.dataRealizado,
    // required this.exercicios,
  });
}