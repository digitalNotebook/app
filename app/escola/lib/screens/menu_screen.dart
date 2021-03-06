import 'dart:io';
import 'package:escola/mediaQuery/size_config.dart';
import 'package:escola/providers/aulas.dart';
import 'package:escola/providers/messages.dart';
import 'package:escola/screens/profile_screen.dart';
import 'package:escola/screens/settings_screen.dart';
import 'package:escola/widgets/master_background.dart';
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
  File? _profileImage;

  void _selectedProfileImage(File image) {
    setState(() {
      _profileImage = image;
    });
  }

  void _goToProfileScreen() {
    print('pushNewScreenWithRouteSettings');
    pushNewScreenWithRouteSettings(
      context,
      screen: ProfileScreen(),
      pageTransitionAnimation: PageTransitionAnimation.fade,
      settings: RouteSettings(arguments: _profileImage),
    ).then(
      (profileImage) {
        if (profileImage == null) return;
        _selectedProfileImage(profileImage);
      },
    );
  }

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
        ChangeNotifierProvider(
          create: (ctx2) => Messages(),
        )
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
          leading: _profileImage != null
              // ? GestureDetector(
              //     onTap: _goToProfileScreen,
              //     child: CircleAvatar(
              //       backgroundColor: Colors.transparent,
              //       radius: 10,
              //       child: ClipOval(
              //         child: Image.file(
              //           _profileImage!,
              //           fit: BoxFit.cover,
              //           width: 50,
              //           height: 50,
              //         ),
              //       ),
              //     ),
              //   )
              ? GestureDetector(
                  onTap: _goToProfileScreen,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 58,
                    child: CircleAvatar(
                      backgroundImage: FileImage(_profileImage!),
                    ),
                  ),
                )
              : IconButton(
                  color: Colors.white,
                  onPressed: _goToProfileScreen,
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
            : MasterBackground(
                child: Column(
                  children: [
                    //SAUDA????O
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
