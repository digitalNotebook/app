import 'package:escola/providers/aulas.dart';
import 'package:escola/screens/class_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class MenuLastClass extends StatelessWidget {
  const MenuLastClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Active Class: ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<Aulas>(
                builder: (ctx, aula, ch) => ListTile(
                  shape: Border.all(color: Theme.of(context).accentColor),
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(aula.undoneClasses.first.title),
                  subtitle: Text(aula.undoneClasses.first.subtitle),
                  trailing: Icon(Icons.play_arrow),
                  onTap: () {
                    pushNewScreenWithRouteSettings(
                      context,
                      screen: ClassDetailScreen(),
                      settings: RouteSettings(
                        name: ClassDetailScreen.pageName,
                        arguments: aula.undoneClasses.first,
                      ),
                    );
                    // Navigator.of(context).pushNamed(ClassDetailScreen.pageName,
                    //     arguments: aula.undoneClasses.first);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
