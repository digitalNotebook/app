import 'package:flutter/material.dart';

class Saudacao extends StatelessWidget {
  final double textScale;
  final DateTime localTime = DateTime.now();

  Saudacao(this.textScale);

  //criar um método para capturar a data do sistema
  //e exibir a saudação apropriada

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //SAUDAÇÃO
        Text('Good evening',
            style: Theme.of(context).textTheme.headline6,
            overflow: TextOverflow.fade),
        //NOME DO ALUNO DA SAUDAÇÃO
        Text(
          'Leonardo',
          style: Theme.of(context).textTheme.bodyText1,
          overflow: TextOverflow.fade,
        ),
      ],
    );
  }
}
