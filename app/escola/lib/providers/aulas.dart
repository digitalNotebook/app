import 'package:escola/models/iprovider.dart';
import 'package:escola/models/subject.dart';
import 'package:flutter/material.dart';
import '../models/aula.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Aulas with ChangeNotifier implements IProvider {
  //dummy data de aulas
  List<Aula> _aulas = [
    Aula(
        id: 'A1',
        title: 'Simple Present',
        subtitle: 'Action verbs',
        imagesUrl:
            'https://www.history.com/.image/ar_16:9%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cg_faces:center%2Cq_auto:good%2Cw_768/MTYyNDg1MjE3MTI1MjEzODYy/topic-london-gettyimages-760251843-feature.jpg',
        dataAula: DateTime.utc(2021, 10, 28),
        description: 'Simple Present',
        videoUrl: 'videoUrl - Part 1',
        horaInicio: DateTime.now().subtract(Duration(hours: 2)),
        horaFim: DateTime.now().subtract(Duration(hours: 4)),
        status: Status.UNDONE),
    Aula(
        id: 'A2',
        title: 'Irregular verbs',
        subtitle: 'Part 1',
        imagesUrl:
            'https://d2brulbsscz39x.cloudfront.net/_imager/files/22442/Film-London-Brochure-2019-COVER-IMAGE_9eed5a99b701ba360780d44a67c674dc.jpg',
        dataAula: DateTime.utc(2021, 10, 21),
        description: 'description',
        videoUrl: 'videoUrl - Part 1',
        horaInicio: DateTime.now().subtract(Duration(hours: 2, days: 5)),
        horaFim: DateTime.now().subtract(Duration(hours: 4, days: 5)),
        status: Status.DONE),
    Aula(
        id: 'A3',
        title: 'Daily Routine',
        subtitle: 'Part 1',
        imagesUrl:
            'https://images.unsplash.com/photo-1533929736458-ca588d08c8be?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bG9uZG9ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
        dataAula: DateTime.utc(2021, 10, 14),
        description: 'description',
        horaInicio: DateTime.now().subtract(Duration(hours: 2, days: 10)),
        horaFim: DateTime.now().subtract(Duration(hours: 4, days: 10)),
        videoUrl: 'videoUrl - Part 1',
        status: Status.DONE),
    Aula(
        id: 'A4',
        title: 'Awkward, Odd, Strange',
        subtitle: 'Part 1',
        imagesUrl:
            'https://media.istockphoto.com/photos/boulevard-next-to-the-river-thames-picture-id1133845967?k=20&m=1133845967&s=612x612&w=0&h=MwmQv6LpVneuqxDU3Qw-1EtDatXwmnEo9PXFb7vGTkQ=',
        dataAula: DateTime.utc(2021, 10, 07),
        description: 'description',
        horaInicio: DateTime.now().subtract(Duration(hours: 2, days: 20)),
        horaFim: DateTime.now().subtract(Duration(hours: 4, days: 20)),
        videoUrl: 'videoUrl - Part 1',
        status: Status.DONE),
    Aula(
        id: 'A5',
        title: 'Present Continuous',
        subtitle: 'Part 1',
        imagesUrl:
            'https://images.unsplash.com/photo-1505761671935-60b3a7427bad?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
        dataAula: DateTime.utc(2021, 09, 30),
        description: 'description',
        videoUrl: 'videoUrl - Part 1',
        horaInicio: DateTime.now().subtract(Duration(hours: 2, days: 40)),
        horaFim: DateTime.now().subtract(Duration(hours: 4, days: 40)),
        status: Status.DONE),
  ];

  // retornamos uma cópia da propriedade _aulas
  // List<Aula> get items {
  //   return [..._aulas];
  // }

  @override
  List<Subject> getAll() {
    return [..._aulas];
  }

  @override
  Subject findById(String id) {
    return _aulas.firstWhere((cadaAula) => cadaAula.id == id);
  }

  // Aula findById(String id) {
  //   return _aulas.firstWhere((cadaAula) => cadaAula.id == id);
  // }

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

  Future<void> fetchClasses() async {
    var url =
        Uri.parse('https://digitalnotebook-b4e8d-default-rtdb.firebaseio.com/');
  }

  //esse método rodará apenas uma vez
  Future<void> addClasses() async {
    var url = Uri.parse(
        'https://digitalnotebook-b4e8d-default-rtdb.firebaseio.com/aulas.json');

    var response = await http.post(url,
        body: json.encode({
          _aulas
              .map((eachAula) => {
                    'title': eachAula.title,
                    'subtitle': eachAula.subtitle,
                    'imageUrl': eachAula.imagesUrl,
                    'dataAula': eachAula.dataAula.toIso8601String(),
                    'description': eachAula.description,
                    'videoUrl': eachAula.videoUrl,
                    'horaInicio': eachAula.horaInicio.toIso8601String(),
                    'horaFim': eachAula.horaFim.toIso8601String(),
                    'status': eachAula.status.index,
                  })
              .toList()
        }));

    print(json.decode(response.body));
  }
}
