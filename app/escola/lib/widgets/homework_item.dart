import 'dart:math';

import 'package:escola/screens/exercicios_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/homework.dart';

class HomeworkItem extends StatelessWidget {
  const HomeworkItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homework = Provider.of<Homework>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ExerciciosScreen.pageName, arguments: homework.id);
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Placeholder(
                    fallbackHeight: 150,
                    color: Colors.amber,
                  ),
                  // child: Image.network(
                  //   'https://i0.wp.com/handluggageonly.co.uk/wp-content/uploads/2018/10/Hand-Luggage-Only-12.jpg?w=1600&ssl=1',
                  //   fit: BoxFit.fitWidth,
                  //   width: double.infinity,
                  //   height: 100,
                  // ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
                ),
                Positioned(
                  top: 15,
                  right: 10,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        transform: Matrix4.rotationZ(-5 * pi / 180)
                          ..translate(-5.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${homework.id} - ${homework.title}',
                          softWrap: true,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontFamily: 'IndieFlower',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
