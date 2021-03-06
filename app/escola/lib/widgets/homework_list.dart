import 'package:escola/models/homework.dart';
import 'package:escola/models/subject.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/homework_item.dart';

class HomeworkList extends StatelessWidget {
  final List<Subject> homeworks;
  final Function _onResetHomeworkList;
  const HomeworkList(
    this.homeworks,
    this._onResetHomeworkList, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(15),
          topRight: const Radius.circular(15),
        ),
      ),
      alignment: Alignment.center,
      child: homeworks.length > 0
          ? ListView.builder(
              itemCount: homeworks.length,
              itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                key: ValueKey(homeworks[index].id),
                value: homeworks[index] as Homework,
                child: Column(
                  children: [
                    HomeworkItem(_onResetHomeworkList),
                    SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
            )
          : Center(
              child: Text('Nothing here yet!'),
            ),
    );
  }
}
