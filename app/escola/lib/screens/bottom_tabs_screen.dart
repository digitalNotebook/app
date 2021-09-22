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
  var _index = 0;
  // var _isInit = true;
  // PageController _pageController = PageController(initialPage: 0);

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  void didChangeDependencies() {
    // if (_isInit) {}
    // _isInit = false;
    print('didChangeDependencies Bottom Tabs Screen');

    super.didChangeDependencies();
  }

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
        textStyle: TextStyle(fontSize: 16),
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

  @override
  void dispose() {
    // _pageController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var mediaQuery = MediaQuery.of(context).size;
    print('Bottom Tab build');
    // return GestureDetector(
    //   onHorizontalDragEnd: (DragEndDetails details) {
    //     if (details.primaryVelocity! > 0) {
    //       print('left');
    //       _index--;
    //       if (_index < 0) _index = 4;
    //     } else if (details.primaryVelocity! < 0) {
    //       print('right');
    //       _index++;
    //       if (_index > 4) _index = 0;
    //     }

    //     _controller.jumpToTab(_index);
    //   },
    //   child:
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
      onItemSelected: (index) {
        _index = index;
      },
      screenTransitionAnimation: ScreenTransitionAnimation(
        duration: Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      ),
    );
  }
}
