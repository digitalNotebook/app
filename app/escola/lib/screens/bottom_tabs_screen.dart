import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
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
  List<Widget> _buildScreen() {
    return [
      MenuScreen(),
      ClassesScreen(),
      CalendarScreen(),
      HomeworkScreen(),
      MessagesScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.apartment_outlined),
        title: 'Home',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.assignment_outlined),
        title: 'Classes',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.calendar_today_outlined),
        title: 'Calendar',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.auto_stories_outlined),
        title: 'Homework',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.message_outlined),
        title: 'Messages',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreen(),
      items: _navBarsItems(),
      backgroundColor: Colors.black,
      navBarStyle: NavBarStyle.simple,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
    );
  }
}

//   //lista de screens e titles
//   final List<Map<String, dynamic>> _pages = [
//     {'page': MenuScreen(), 'title': 'Home'},
//     {'page': ClassesScreen(), 'title': 'Classes'},
//     {'page': CalendarScreen(), 'title': 'Calendar'},
//     {'page': HomeworkScreen(), 'title': 'Homeworks'},
//     {'page': MessagesScreen(), 'title': 'Messages'}
//   ];

//   //saber qual index está selecionado, por padrão é o Home
//   int _selectedPageIndex = 0;

//   @override
//   void didUpdateWidget(covariant TabsScreen oldWidget) {
//     super.didUpdateWidget(oldWidget);
//   }

//   //captura o index da página selecionada
//   void _selectPage(int index) {
//     setState(() {
//       _selectedPageIndex = index;
//     });
//     // print(_pages[index]['page']);
//     // Navigator.pushNamed(context, _pages[index]['page']);
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('Método Build da TabsScreen acionado');

//     //recupera a seed enviada de loginScreen
//     // final seedId = ModalRoute.of(context)?.settings.arguments;

//     // final deviceInfo = MediaQuery.of(context);
//     // print(
//     //     'Height: ${deviceInfo.size.height} and Width: ${deviceInfo.size.width}');
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pushNamed(ProfileScreen.pageName);
//           },
//           icon: Icon(Icons.person),
//         ),
//         backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
//         shadowColor: Theme.of(context).appBarTheme.shadowColor,
//         iconTheme: Theme.of(context).appBarTheme.iconTheme,
//         title: Text(
//           _pages[_selectedPageIndex]['title'],
//           style: Theme.of(context).appBarTheme.titleTextStyle,
//         ),
//         elevation: Theme.of(context).appBarTheme.elevation,
//         actions: [
//           IconButton(
//             onPressed: _selectedPageIndex == 1
//                 ? () {}
//                 : () {
//                     Navigator.of(context).pushNamed(SettingsScreen.pageName);
//                   },
//             icon: Icon(
//               _selectedPageIndex == 1 ? Icons.search : Icons.settings,
//               color: Theme.of(context).accentColor,
//             ),
//           ),
//         ],
//       ),
//       body: _pages[_selectedPageIndex]['page'],
//       // body: Navigator(
//       //   onGenerateRoute: (settings) {
//       //     print(settings.name);
//       //     Widget page = MenuScreen();

//       //     if (settings.name == ClassesScreen.pageName) page = ClassesScreen();
//       //     return MaterialPageRoute(builder: (_) => page);
//       //   },
//       // ),
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: _selectPage,
//         backgroundColor: Theme.of(context).bottomAppBarTheme.color,
//         unselectedItemColor: Colors.white30,
//         selectedItemColor: Colors.white,
//         showUnselectedLabels: true,
//         currentIndex: _selectedPageIndex,
//         selectedFontSize: 12,
//         unselectedFontSize: 12,
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//             backgroundColor: Colors.black,
//             icon: Icon(Icons.apartment_outlined),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Colors.black,
//             icon: Icon(Icons.assignment_outlined),
//             label: 'Classes',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Colors.black,
//             icon: Icon(Icons.calendar_today_outlined),
//             label: 'Calendar',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Colors.black,
//             icon: Icon(Icons.auto_stories_outlined),
//             label: 'Homeworks',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Colors.black,
//             icon: Icon(Icons.message_outlined),
//             label: 'Messages',
//           ),
//         ],
//       ),
//     );
//   }
// }
