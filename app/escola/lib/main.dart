import 'package:escola/screens/class_detail_screen.dart';
import 'package:escola/screens/error_screen.dart';
import 'package:escola/screens/exercicios_screen.dart';
import 'package:escola/screens/login_screen.dart';
import 'package:escola/screens/message_screen_detail.dart';
import 'package:escola/screens/profile_screen.dart';
import 'package:escola/screens/settings_screen.dart';
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
        //cor de fundo da tela
        scaffoldBackgroundColor: Colors.white,
        //cor dos
        primarySwatch: Colors.grey,
        accentColor: Colors.black,
        //tema da bottomAppBar
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.black,
        ),
        //tema do upAppBar
        appBarTheme: AppBarTheme(
          centerTitle: true,
          //cor dos icones
          iconTheme: IconThemeData(
            color: Colors.black87,
          ),
          //cor de fundo da appBar
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
          elevation: 0, //tira a sombra embaixo da upAppBar
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            elevation: MaterialStateProperty.all(4),
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
        ClassDetailScreen.pageName: (ctx) {
          return ClassDetailScreen(
            key: ValueKey('class-detail-screen'),
          );
        },
        MessageDetailScreen.pageName: (ctx) {
          return MessageDetailScreen(
            key: ValueKey('message-detail-screen'),
          );
        },
        ProfileScreen.pageName: (ctx) {
          return ProfileScreen(
            key: ValueKey('profile-screen'),
          );
        },
        ExerciciosScreen.pageName: (ctx) {
          return ExerciciosScreen(
            key: ValueKey('exercicios-screen'),
          );
        },
        SettingsScreen.pageName: (ctx) {
          return SettingsScreen(
            key: ValueKey('settings-screen'),
          );
        }
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
