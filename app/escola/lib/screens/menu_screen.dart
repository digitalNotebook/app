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
                    'Leonardo', //foto perfil
                    style: TextStyle(fontSize: 150),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: FittedBox(
              child: Text(
                'Mensagem',
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
                    'Active Class',
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
                'Homework c/ calendar',
                style: TextStyle(fontSize: 150),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
