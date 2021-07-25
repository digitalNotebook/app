import 'package:flutter/material.dart';

class Saudacao extends StatelessWidget {
  final double textScale;
  final double containerHeight;
  final DateTime localTime = DateTime.now();

  Saudacao(this.textScale, this.containerHeight);

  //criar um método para capturar a data do sistema
  //e exibir a saudação apropriada

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: containerHeight * 0.1,
      width: double.infinity,
      color: Colors.black12,
      child: Column(
        children: [
          //SAUDAÇÃO
          Text(
            'Good evening',
            style: Theme.of(context).textTheme.headline6,
          ),
          //NOME DO ALUNO DA SAUDAÇÃO
          Text(
            'Leonardo',
            style: TextStyle(
              fontSize: 13 * textScale,
            ),
          ),
        ],
      ),
    );
  }
}
