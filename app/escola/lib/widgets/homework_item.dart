import 'dart:math';

import 'package:escola/screens/exercicios_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../models/homework.dart';

class HomeworkItem extends StatelessWidget {
  const HomeworkItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homework = Provider.of<Homework>(context, listen: false);
    return GestureDetector(
      onTap: () {
        pushNewScreenWithRouteSettings(context,
            screen: ExerciciosScreen(),
            settings: RouteSettings(
                name: ExerciciosScreen.pageName, arguments: homework.id),
            pageTransitionAnimation: PageTransitionAnimation.fade);
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
                  child: Hero(
                    tag: homework.id,
                    child: FadeInImage(
                      fadeInDuration: Duration(milliseconds: 100),
                      fadeOutDuration: Duration(milliseconds: 100),
                      placeholder:
                          AssetImage('assets/images/placeholder-images.jpg'),
                      image: AssetImage('assets/images/placeholder-images.jpg'),
                      fit: BoxFit.fitWidth,
                      height: 150,
                      width: double.infinity,
                      imageErrorBuilder: (ctx, exception, stack) {
                        return Placeholder(
                          fallbackHeight: 150,
                        );
                      },
                    ),
                  ),
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
