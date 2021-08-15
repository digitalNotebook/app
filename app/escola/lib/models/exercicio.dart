import 'package:flutter/cupertino.dart';

class Exercicio with ChangeNotifier {
  final String idHomework;
  final List<String> perguntas;
  final List<String> alternativas;
  final List<String> respostas;

  //podemos adicionar varios construtores dependendo do formato do exercicio

  Exercicio.alternativas({
    required this.alternativas,
    required this.idHomework,
    required this.perguntas,
    required this.respostas,
  });

  Exercicio.basico({
    required this.idHomework,
    required this.perguntas,
    required this.respostas,
    this.alternativas = const [],
  });
}
