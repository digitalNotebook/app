import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  static const pageName = '/menu';

  //a ideia é substituir os Expanded
  Widget buildExpanded(Widget child, int flex) {
    return Expanded(
      flex: flex,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        //ocupa todo o espaço horizontal
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //SAUDAÇÃO
          Expanded(
            flex: 1,
            child: FittedBox(
              child: Column(
                children: [
                  Text(
                    'Bem-vindo',
                    style: TextStyle(fontSize: 150),
                  ),
                  Text(
                    'Leonardo',
                    style: TextStyle(fontSize: 150),
                  ),
                ],
              ),
            ),
          ),
          //FOTO PERFIL
          Expanded(
            flex: 1,
            child: FittedBox(
              child: Text(
                'Foto perfil',
                style: TextStyle(fontSize: 150),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: FittedBox(
              child: Row(
                children: [
                  //CRIAR UM LISTVIEW DE CARDS
                  Text(
                    'Mensagens',
                    style: TextStyle(fontSize: 150),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: FittedBox(
              child: Text(
                'Aulas',
                style: TextStyle(fontSize: 150),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
