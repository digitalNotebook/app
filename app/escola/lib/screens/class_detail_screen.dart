import 'package:escola/models/aula.dart';
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
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                icon: Icon(Icons.keyboard_arrow_left_sharp)),
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
                  child: Column(
                    children: [
                      Hero(
                        tag: aula.id,
                        child: Image.network(
                          aula.imagesUrl,
                          errorBuilder: (ctx, exception, stack) {
                            return Placeholder(
                              fallbackHeight: 200,
                            );
                          },
                        ),
                      ),
                      Text(
                        'Aula: ${aula.title} - ${aula.subtitle}',
                        style: TextStyle(
                          fontFamily: 'IndieFlower',
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
