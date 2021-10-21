import 'package:escola/providers/aulas.dart';
import 'package:escola/providers/homeworks.dart';
import 'package:escola/screens/profile_screen.dart';
import 'package:escola/widgets/bottomBackground.dart';
import 'package:escola/widgets/calendar_item.dart';
import 'package:escola/widgets/master_background.dart';
import 'package:escola/widgets/topBackground.dart';
import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  static const pageName = '/calendar';

  @override
  Widget build(BuildContext context) {
    print('Buildei a tela Calendar');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Aulas(),
        ),
        ChangeNotifierProvider(
          create: (_) => Homeworks(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 45,
          title: Text(
            'Calendar',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          leading: IconButton(
            color: Colors.white,
            onPressed: () {
              pushNewScreen(
                context,
                screen: ProfileScreen(),
                pageTransitionAnimation: PageTransitionAnimation.fade,
              );
            },
            icon: Icon(Icons.person),
          ),
        ),
        body: MasterBackground(
          child: CalendarItem(),
        ),
      ),
    );
  }
}
