import 'package:escola/mediaQuery/size_config.dart';
import 'package:escola/providers/aulas.dart';
import 'package:escola/screens/profile_screen.dart';
import 'package:escola/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../widgets/menu_calendar.dart';
import '../widgets/menu_messages.dart';
import '../widgets/menu_undone_class.dart';
import '../widgets/menu_saudacao.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  static const pageName = '/menu';

  @override
  Widget build(BuildContext context) {
    print('HomeScreen build');
    SizeConfig().init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Aulas(),
        ),
        //demais providers aqui
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          leading: IconButton(
            onPressed: () {
              pushNewScreen(
                context,
                screen: ProfileScreen(),
                pageTransitionAnimation: PageTransitionAnimation.fade,
              );
            },
            icon: Icon(Icons.person),
          ),
          actions: [
            IconButton(
              onPressed: () {
                pushNewScreen(
                  context,
                  screen: SettingsScreen(),
                  pageTransitionAnimation: PageTransitionAnimation.slideUp,
                );
              },
              icon: Icon(Icons.settings),
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              //SAUDAÇÃO
              Expanded(
                child: Saudacao(),
              ),

              Expanded(
                flex: 3,
                child: MenuMessage(),
              ),

              Expanded(
                flex: 3,
                child: MenuLastClass(),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 8),
                    child: Text(
                      'Homework: ',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 2,
                child: MenuCalendar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
