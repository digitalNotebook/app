import 'package:escola/models/aula.dart';
import 'package:escola/providers/aulas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/class_item.dart';

import 'package:escola/enums/filters_class.dart';

class ClassList extends StatelessWidget {
  final List<Aula> _aulas;
  ClassList(this._aulas);

  @override
  Widget build(BuildContext context) {
    print('Buildei a ClassList');

    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(15),
          topRight: const Radius.circular(15),
        ),
      ),
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: _aulas.length,
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          key: ValueKey(_aulas[index].id),
          value: _aulas[index],
          child: Column(
            children: [
              ClassItem(),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
