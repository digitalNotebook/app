import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/aulas.dart';
import '../widgets/class_item.dart';

class ClassList extends StatelessWidget {
  //classeOverview vira stateful
  // var _filtro = Status.UNDONE; por padrão
  @override
  Widget build(BuildContext context) {
    //passa a referencia abaixo para a classItem que virar ClassList
    //recebo uma referencia do container provider Aulas
    final aulasData = Provider.of<Aulas>(context);
    //recebo uma cópia de _aulas
    var aulas = aulasData.items;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  autofocus: true,
                  clipBehavior: Clip.hardEdge,
                  onPressed: () {
                    //seta a variavel _filtro para UNDONE
                  },
                  child: Text('UNDONE'),
                ),
                ElevatedButton(
                  onPressed: () {
                    //seta a variavel _filtro para DONE
                  },
                  child: Text('DONE'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ////seta a variavel _filtro para FAV
                  },
                  child: Text('FAVORITES'),
                ),
              ],
            ),
          ),

          //CONTAINER COM AS AULAS
          Expanded(
            flex: 8,
            child: Container(
              //padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(30),
                    topRight: const Radius.circular(30),
                  ),
                  color: Colors.black38),
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount: aulas.length,
                itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                  value: aulas[index],
                  child:
                      //passa a referencia de _filtro para o construtor
                      //essa classe consulta o container, vira a classeList
                      ClassItem(), //cria os cards da aula, trocar por ListTile
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
