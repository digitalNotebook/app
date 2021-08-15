class Exercicio {
  final String idHomework;
  final String pergunta;
  final List<String> alternativas;
  final String resposta;

  //podemos adicionar varios construtores dependendo do formato do exercicio

  Exercicio.alternativas({
    required this.alternativas,
    required this.idHomework,
    required this.pergunta,
    required this.resposta,
  });

  Exercicio.basico({
    required this.idHomework,
    required this.pergunta,
    required this.resposta,
    this.alternativas = const [],
  });
}
