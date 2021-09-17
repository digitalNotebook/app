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

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  static const pageName = '/menu';

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  var _isInit = true;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1800), () {
      setState(() {
        _isInit = false;
      });
    });
    super.initState();
  }

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
          backgroundColor: Colors.black,
          toolbarHeight: 45,
          title: Text(
            'Home',
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
          actions: [
            IconButton(
              color: Colors.white,
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
        body: _isInit
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
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
