import 'package:escola/providers/aula.dart';
import 'package:escola/providers/aulas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/class_item.dart';

import 'package:escola/enums/filters_class.dart';

class ClassList extends StatelessWidget {
  final Filters _filters;

  ClassList(this._filters);

  @override
  Widget build(BuildContext context) {
    //recebo uma referencia do container provider Aulas
    final aulasData = Provider.of<Aulas>(context, listen: false);
    //recebo uma cópia de _aulas
    List<Aula> aulas;
    if (_filters == Filters.DONE)
      aulas = aulasData.doneClasses;
    else if (_filters == Filters.UNDONE)
      aulas = aulasData.undoneClasses;
    else
      aulas = aulasData.favoriteClasses;

    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
          ),
          color: Theme.of(context).primaryColor),
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: aulas.length,
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          value: aulas[index],
          child: ClassItem(),
        ),
      ),
    );
  }
}
