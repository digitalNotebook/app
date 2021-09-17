import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/homeworks.dart';
import '../widgets/homework_item.dart';

class HomeworkList extends StatelessWidget {
  const HomeworkList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeworks = Provider.of<Homeworks>(context).items;
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(15),
          topRight: const Radius.circular(15),
        ),
      ),
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: homeworks.length,
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          value: homeworks[index],
          child: HomeworkItem(),
        ),
      ),
    );
  }
}
