import 'package:flutter/material.dart';

import '../widgets/homework_list.dart';
import '../widgets/homework_tabs.dart';

class HomeworkOverview extends StatelessWidget {
  const HomeworkOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Homeworks build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Homeworks'),
      ),
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          flex: 2,
          child: HomeworkTabs(),
        ),
        Expanded(
          flex: 8,
          child: HomeworkList(),
        ),
      ])),
    );
  }
}
