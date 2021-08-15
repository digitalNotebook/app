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
                      '${homework.title} - ${homework.description}',
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
