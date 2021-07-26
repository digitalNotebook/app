import 'package:escola/screens/error_screen.dart';
import 'package:escola/screens/login_screen.dart';
import 'package:flutter/material.dart';

import './screens/calendar_screen.dart';
import './screens/menu_screen.dart';
import './screens/classes_screen.dart';
import './screens/homeworks_screen.dart';
import 'screens/bottom_tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Notebook',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        accentColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => LoginScreen(),
        TabsScreen.pageName: (ctx) {
          return TabsScreen(
            key: ValueKey('bottom-tab'),
          );
        },
        MenuScreen.pageName: (ctx) {
          return MenuScreen(
            key: ValueKey('menu-screen'),
          );
        },
        CalendarScreen.pageName: (ctx) {
          return CalendarScreen(
            key: ValueKey('calendar-screen'),
          );
        },
        ClassesScreen.pageName: (ctx) {
          return ClassesScreen(
            key: ValueKey('classes-screen'),
          );
        },
        HomeworkScreen.pageName: (ctx) {
          return HomeworkScreen(
            key: ValueKey('homework-screen'),
          );
        },
        //outra rota aqui
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => ErrorScreen(),
        );
      },
    );
  }
}
