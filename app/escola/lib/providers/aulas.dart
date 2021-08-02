import 'package:flutter/material.dart';
import 'aula.dart';

class Aulas with ChangeNotifier {
  //dummy data de aulas
  List<Aula> _aulas = [
    Aula(
        id: 'a1',
        title: 'Present Continuous',
        subtitle: 'Part 5',
        imagesUrl: 'varios links de imagem',
        dataAula: DateTime.utc(2021, 08, 05),
        description: 'description',
        videoUrl: 'videoUrl - Part 5',
        status: Status.UNDONE),
    Aula(
        id: 'a1',
        title: 'Present Continuous',
        subtitle: 'Part 4',
        imagesUrl: 'varios links de imagem',
        dataAula: DateTime.utc(2021, 08, 01),
        description: 'description',
        videoUrl: 'videoUrl - Part 4',
        status: Status.DONE),
    Aula(
        id: 'a1',
        title: 'Present Continuous',
        subtitle: 'Part 3',
        imagesUrl: 'varios links de imagem',
        dataAula: DateTime.utc(2021, 07, 20),
        description: 'description',
        videoUrl: 'videoUrl - Part 3',
        status: Status.DONE),
    Aula(
        id: 'a1',
        title: 'Present Continuous',
        subtitle: 'Part 2',
        imagesUrl: 'varios links de imagem',
        dataAula: DateTime.utc(2021, 07, 05),
        description: 'description',
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
}
