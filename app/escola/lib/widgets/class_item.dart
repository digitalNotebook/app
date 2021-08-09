import 'dart:ui';

import 'package:escola/screens/class_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/aula.dart';

class ClassItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final aula = Provider.of<Aula>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ClassDetailScreen.pageName, arguments: aula);
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20),
                      topRight: const Radius.circular(20),
                    ),
                    child: Placeholder(
                      fallbackHeight: 70,
                      color: Colors.amber,
                    )
                    //   Image.network(
                    //   aula.imagesUrl,
                    //   fit: BoxFit.fitWidth,
                    //   width: double.infinity,
                    //   height: 100,
                    // ),
                    ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(20),
                        bottomRight: const Radius.circular(20),
                      ),
                    ),
                    padding: EdgeInsets.only(top: 5, left: 10),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '${aula.title} - ${aula.subtitle}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
