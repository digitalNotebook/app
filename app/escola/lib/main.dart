import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/home-screen/home_screen.dart';
import './screens/error-screen/error_screen.dart';
import './screens/login-screen/login_screen.dart';

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
        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
        buttonColor: Colors.blueGrey,
        //criar uma pasta assets com fonts
        // fontFamily: '',
        //definir o theme dos Text
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              headline5: TextStyle(
                fontSize: 25,
              ),
              bodyText1: TextStyle(
                fontSize: 20,
              ),
              button: TextStyle(
                fontSize: 25,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
      ),
      initialRoute: '/', //depois mudar para / para o login
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        MyHomePage.routeName: (ctx) => MyHomePage(title: 'Digital Notebook'),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => ErrorScreen());
      },
    );
  }
}
