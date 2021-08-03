import 'package:escola/widgets/class_list.dart';
import 'package:escola/widgets/class_tabs.dart';
import 'package:flutter/material.dart';

import '../enums/filters_class.dart';

class ClassOverview extends StatefulWidget {
  @override
  _ClassOverviewState createState() => _ClassOverviewState();
}

class _ClassOverviewState extends State<ClassOverview> {
  var _classFilter = Filters.UNDONE;

  void _handleDoneButton() {
    setState(() {
      _classFilter = Filters.DONE;
    });
  }

  void _handleUndoneButton() {
    setState(() {
      _classFilter = Filters.UNDONE;
    });
  }

  void _handleFavoriteButton() {
    _classFilter = Filters.FAVORITES;
  }

  @override
  Widget build(BuildContext context) {
    print('Buildei a ClassesScreen - alo');

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //BUTTONS
          Expanded(
            flex: 2,
            child: ClassTabs(
              handleDoneButton: _handleDoneButton,
              handleUndoneButton: _handleUndoneButton,
              handleFavoriteButton: _handleFavoriteButton,
            ),
          ),
          //CONTAINER COM AS AULAS
          Expanded(
            flex: 8,
            child: ClassList(_classFilter),
          ),
        ],
      ),
    );
  }
}
