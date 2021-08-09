import 'package:flutter/material.dart';
import 'aula.dart';

class Aulas with ChangeNotifier {
  //dummy data de aulas
  List<Aula> _aulas = [
    Aula(
        id: 'a1',
        title: 'Simple Present',
        subtitle: 'Action verbs',
        imagesUrl: 'varios links de imagem',
        dataAula: DateTime.utc(2021, 08, 05),
        description: 'Simple Present',
        videoUrl: 'videoUrl - Part 5',
        horaInicio: DateTime.now().subtract(Duration(hours: 2)),
        horaFim: DateTime.now().subtract(Duration(hours: 4)),
        status: Status.UNDONE),
    Aula(
        id: 'a1',
        title: 'Present Continuous',
        subtitle: 'Part 4',
        imagesUrl: 'varios links de imagem',
        dataAula: DateTime.utc(2021, 08, 01),
        description: 'description',
        videoUrl: 'videoUrl - Part 4',
        horaInicio: DateTime.now().subtract(Duration(hours: 2, days: 5)),
        horaFim: DateTime.now().subtract(Duration(hours: 4, days: 5)),
        status: Status.DONE),
    Aula(
        id: 'a1',
        title: 'Present Continuous',
        subtitle: 'Part 3',
        imagesUrl: 'varios links de imagem',
        dataAula: DateTime.utc(2021, 07, 20),
        description: 'description',
        horaInicio: DateTime.now().subtract(Duration(hours: 2, days: 10)),
        horaFim: DateTime.now().subtract(Duration(hours: 4, days: 10)),
        videoUrl: 'videoUrl - Part 3',
        status: Status.DONE),
    Aula(
        id: 'a1',
        title: 'Present Continuous',
        subtitle: 'Part 2',
        imagesUrl: 'varios links de imagem',
        dataAula: DateTime.utc(2021, 07, 05),
        description: 'description',
        horaInicio: DateTime.now().subtract(Duration(hours: 2, days: 20)),
        horaFim: DateTime.now().subtract(Duration(hours: 4, days: 20)),
        videoUrl: 'videoUrl - Part 2',
        status: Status.DONE),
    Aula(
        id: 'a1',
        title: 'Present Continuous',
        subtitle: 'Part 1',
        imagesUrl: 'varios links de imagem',
        dataAula: DateTime.utc(2021, 06, 20),
        description: 'description',
        videoUrl: 'videoUrl - Part 1',
        horaInicio: DateTime.now().subtract(Duration(hours: 2, days: 40)),
        horaFim: DateTime.now().subtract(Duration(hours: 4, days: 40)),
        status: Status.DONE),
  ];

  //retornamos uma cópia da propriedade _aulas
  List<Aula> get items {
    return [..._aulas];
  }

  Aula findById(String id) {
    return _aulas.firstWhere((cadaAula) => cadaAula.id == id);
  }

  List<Aula> get undoneClasses {
    return _aulas
        .where((cadaAula) => cadaAula.status == Status.UNDONE)
        .toList();
  }

  List<Aula> get doneClasses {
    return _aulas.where((cadaAula) => cadaAula.status == Status.DONE).toList();
  }

  List<Aula> get favoriteClasses {
    return _aulas.where((cadaAula) => cadaAula.isFavorite).toList();
  }
}
