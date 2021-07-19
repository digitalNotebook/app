import 'package:flutter/material.dart';

class Saudacao extends StatelessWidget {
  final double textScale;

  Saudacao(this.textScale);

  //criar um método para capturar a data do sistema
  //e exibir a saudação apropriada

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //SAUDAÇÃO
        Text(
          'Good evening',
          style: TextStyle(
            fontSize: 15 * textScale,
            fontWeight: FontWeight.bold,
          ),
        ),
        //NOME DO ALUNO DA SAUDAÇÃO
        Text(
          'Leonardo',
          style: TextStyle(
            fontSize: 13 * textScale,
          ),
        ),
      ],
    );
  }
}
