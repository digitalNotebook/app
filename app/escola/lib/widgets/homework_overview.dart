import 'package:escola/models/subject.dart';
import 'package:escola/providers/homeworks.dart';
import 'package:escola/widgets/master_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/homework_list.dart';
import '../widgets/homework_tabs.dart';
import '../enums/filters_class.dart';

class HomeworkOverview extends StatefulWidget {
  const HomeworkOverview({Key? key}) : super(key: key);

  @override
  _HomeworkOverviewState createState() => _HomeworkOverviewState();
}

class _HomeworkOverviewState extends State<HomeworkOverview> {
  var _filter = Filters.UNDONE;
  late List<Subject> _homeworks;
  var _isInit = true;

  void _handleToDo() {
    _filter = Filters.UNDONE;
    getHomeworksWithThisFilter(_filter);
  }

  void _handleFavorites() {
    _filter = Filters.FAVORITES;
    getHomeworksWithThisFilter(_filter);
  }

  void _handleDone() {
    _filter = Filters.DONE;
    getHomeworksWithThisFilter(_filter);
  }

  void getHomeworksWithThisFilter(Filters filter) {
    _homeworks = Provider.of<Homeworks>(context, listen: false)
        .getHomeworksWithThisFilter(filter);
    print('Filter: $filter e qtde _homeworks: ${_homeworks.length}');
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      getHomeworksWithThisFilter(_filter);
    }
    _isInit = false;
    super.didChangeDependencies();
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
      body: MasterBackground(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: HomeworkTabs(
                _handleDone,
                _handleFavorites,
                _handleToDo,
                _filter,
              ),
            ),
            Expanded(
              flex: 10,
              child: HomeworkList(_homeworks),
            ),
          ],
        ),
      ),
    );
  }
}
