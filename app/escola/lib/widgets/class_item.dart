import 'dart:math';
import 'dart:ui';

import 'package:escola/screens/class_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../models/aula.dart';

class ClassItem extends StatelessWidget {
  final Function _refreshClass;
  ClassItem(this._refreshClass);
  @override
  Widget build(BuildContext context) {
    print('Buildei a ClassItem');
    final aula = Provider.of<Aula>(context, listen: false);
    return GestureDetector(
      onTap: () {
        pushNewScreenWithRouteSettings(context,
                screen: ClassDetailScreen(),
                settings: RouteSettings(
                    name: ClassDetailScreen.pageName, arguments: aula),
                pageTransitionAnimation: PageTransitionAnimation.fade)
            .then((value) => _refreshClass());
        // Navigator.of(context)
        //     .pushNamed(ClassDetailScreen.pageName, arguments: aula);
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
                    tag: aula.id,
                    child: FadeInImage(
                      fadeInDuration: Duration(milliseconds: 100),
                      fadeOutDuration: Duration(milliseconds: 100),
                      placeholder:
                          AssetImage('assets/images/placeholder-images.jpg'),
                      image: NetworkImage(
                        aula.imagesUrl,
                      ),
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
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
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
                          '${aula.title} - ${aula.subtitle}',
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
