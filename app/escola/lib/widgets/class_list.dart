import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/aulas.dart';
import '../widgets/class_item.dart';

class ClassList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //recebo uma referencia do container provider Aulas
    final aulasData = Provider.of<Aulas>(context);
    //recebo uma cópia de _aulas
    var aulas = aulasData.items;
    print('TOTAL: ${aulas.length}');
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
                    aulas = aulasData.handleUndoneClasses();
                    print('UNDONE: ${aulas.length}');
                  },
                  child: Text('UNDONE'),
                ),
                ElevatedButton(
                  onPressed: () {
                    aulas = aulasData.handleDoneClasses();
                    print('DONE: ${aulas.length}');
                  },
                  child: Text('DONE'),
                ),
                ElevatedButton(
                  onPressed: () {
                    //REFERENCIA DO MÉTODO PARA EXIBIR OS favorites
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
