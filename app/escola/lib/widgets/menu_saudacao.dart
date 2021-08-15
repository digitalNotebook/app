import 'package:escola/mediaQuery/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Saudacao extends StatelessWidget {
  const Saudacao({Key? key}) : super(key: key);

  String _saudar() {
    var hora = int.parse(DateFormat('HH').format(DateTime.now()));
    var minuto = int.parse(DateFormat('mm').format(DateTime.now()));

    print('Hora atual: $hora:$minuto');

    var saudacao = '';

    //good morning 05:00 as 12:59
    //good afternoon 13:00 as 18:30
    //good evening 18:31 as 11:59
    //its noon *spooky face* 12:00 as 04:59

    if ((hora >= 5 && minuto >= 0) && (hora <= 12 && minuto <= 59))
      saudacao = 'Good morning, ';
    else if ((hora >= 13 && minuto >= 0) && (hora <= 18 && minuto <= 59))
      saudacao = 'Good afternoon, ';
    else if ((hora >= 19 && minuto >= 0) && (hora <= 23 && minuto <= 59))
      saudacao = 'Good evening, ';
    else
      saudacao = 'Go to sleep, ';
    return saudacao;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Row(
          children: [
            Text(
              _saudar(),
              style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal! * 3),
            ),
            Text(
              'Felipe',
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal! * 3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
