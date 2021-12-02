import 'package:escola/models/aula.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/class_item.dart';

class ClassList extends StatelessWidget {
  final List<Aula> _aulas;
  final Function _refreshClass;
  ClassList(this._aulas, this._refreshClass);

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
      child: _aulas.length > 0
          ? ListView.builder(
              itemCount: _aulas.length,
              itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                key: ValueKey(_aulas[index].id),
                value: _aulas[index],
                child: Column(
                  children: [
                    ClassItem(_refreshClass),
                    SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
            )
          : Center(
              child: Text('Nothing here yet!'),
            ),
    );
  }
}
