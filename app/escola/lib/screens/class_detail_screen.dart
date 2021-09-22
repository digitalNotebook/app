import 'dart:math';

import 'package:escola/models/aula.dart';
import 'package:flutter/material.dart';

class ClassDetailScreen extends StatelessWidget {
  const ClassDetailScreen({Key? key}) : super(key: key);

  static const pageName = '/class-detail';

  @override
  Widget build(BuildContext context) {
    var aula = ModalRoute.of(context)?.settings.arguments as Aula;
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          //areas na tela que irão scrollar
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              //appbar não fica vísivel quando scrollar
              pinned: true,
              //botão para voltar
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                iconSize: 30,
              ),
              //mesmo tamanho do container da imagem da aula
              expandedHeight: 200,
              //o que teremos dentro da appbar
              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  transform: Matrix4.rotationZ(-5 * pi / 180)..translate(-5.0),
                  color: Colors.yellow.withOpacity(0.8),
                  child: Text(
                    aula.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'IndieFlower',
                      fontSize: 20,
                    ),
                  ),
                ),
                background: Hero(
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
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: 30,
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
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
                  SizedBox(
                    height: 600,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
