import 'package:flutter/material.dart';

import '../widgets/homework_list.dart';
import '../widgets/homework_tabs.dart';
import 'bottomBackground.dart';
import 'topBackground.dart';

class HomeworkOverview extends StatefulWidget {
  const HomeworkOverview({Key? key}) : super(key: key);

  @override
  _HomeworkOverviewState createState() => _HomeworkOverviewState();
}

class _HomeworkOverviewState extends State<HomeworkOverview> {
  void _handleToDo() {
    //todo
  }

  void _handleFavorites() {
    //todo
  }

  void _handleDone() {
    //todo
  }

  @override
  Widget build(BuildContext context) {
    print('Homeworks build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 45,
        title: Text(
          'Homeworks',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const ClassBackground(),
            const ClassBackgroundTop(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 2,
                  child: HomeworkTabs(),
                ),
                Expanded(
                  flex: 8,
                  child: HomeworkList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
