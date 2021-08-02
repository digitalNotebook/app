import 'package:flutter/material.dart';

import './calendar_screen.dart';
import './menu_screen.dart';
import './classes_screen.dart';
import './messages_screen.dart';
import './homeworks_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  static const pageName = '/bottom-tab';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  //lista de screens e titles
  final List<Map<String, dynamic>> _pages = [
    {'page': MenuScreen(), 'title': 'Home'},
    {'page': ClassesScreen(), 'title': 'Classes'},
    {'page': CalendarScreen(), 'title': 'Calendar'},
    {'page': HomeworkScreen(), 'title': 'Homeworks'},
    {'page': MessagesScreen(), 'title': 'Messages'}
  ];

  //saber qual index está selecionado, por padrão é o Home
  int _selectedPageIndex = 0;

  @override
  void didUpdateWidget(covariant TabsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  //captura o index da página selecionada
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //recupera a seed enviada de loginScreen
    final seedId = ModalRoute.of(context)?.settings.arguments;

    final deviceInfo = MediaQuery.of(context);
    // print(
    //     'Height: ${deviceInfo.size.height} and Width: ${deviceInfo.size.width}');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        elevation: 4,
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        unselectedItemColor: Colors.white30,
        selectedItemColor: Colors.white,
        showUnselectedLabels: true,
        currentIndex: _selectedPageIndex,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.apartment_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.assignment_outlined),
            label: 'Classes',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.auto_stories_outlined),
            label: 'Homeworks',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.message_outlined),
            label: 'Messages',
          ),
        ],
      ),
    );
  }
}
