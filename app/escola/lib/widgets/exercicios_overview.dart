import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/exercicios.dart';

class ExerciciosOverview extends StatelessWidget {
  const ExerciciosOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var idHomework = ModalRoute.of(context)!.settings.arguments as String;
    var listaExercicios = Provider.of<Exercicios>(context, listen: false);

    var exercicios = listaExercicios.findExerciciosDesteHomework(idHomework);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exercises Time',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Center(
        child: Text('Exercicios do ID homework: ${exercicios.idHomework}'),
      ),
    );
  }
}
