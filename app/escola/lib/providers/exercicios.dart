import 'package:flutter/cupertino.dart';

import '../models/exercicio.dart';

class Exercicios with ChangeNotifier {
  final List<Exercicio> _exercicios = [
    Exercicio.basico(
      idHomework: 'h1',
      perguntas: [
        'Pergunta 1',
        'Pergunta 2',
        'Pergunta 3',
      ],
      respostas: [
        'A',
        'B',
        'C',
      ],
    ),
    Exercicio.basico(
      idHomework: 'h2',
      perguntas: [
        'Pergunta 1',
        'Pergunta 2',
        'Pergunta 3',
      ],
      respostas: [
        'A',
        'B',
        'C',
      ],
    ),
    Exercicio.basico(
      idHomework: 'h3',
      perguntas: [
        'Pergunta 1',
        'Pergunta 2',
        'Pergunta 3',
      ],
      respostas: [
        'A',
        'B',
        'C',
      ],
    ),
    Exercicio.basico(
      idHomework: 'h4',
      perguntas: [
        'Pergunta 1',
        'Pergunta 2',
        'Pergunta 3',
      ],
      respostas: [
        'A',
        'B',
        'C',
      ],
    ),
  ];

  Exercicio findExerciciosDesteHomework(String idHomework) {
    return _exercicios
        .firstWhere((element) => element.idHomework == idHomework);
  }
}
