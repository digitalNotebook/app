import 'package:escola/providers/aula.dart';
import 'package:flutter/material.dart';

class ClassDetailScreen extends StatelessWidget {
  const ClassDetailScreen({Key? key}) : super(key: key);

  static const pageName = '/class-detail';

  @override
  Widget build(BuildContext context) {
    var aula = ModalRoute.of(context)?.settings.arguments as Aula;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            title: Text(
              '${aula.title}',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black,
                  )),
                  margin: EdgeInsets.symmetric(
                    vertical: 30,
                  ),
                  alignment: Alignment.center,
                  child: Text('Aula: ${aula.title} - ${aula.subtitle}'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
