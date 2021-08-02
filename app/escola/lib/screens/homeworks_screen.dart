import 'package:flutter/material.dart';

import '/widgets/homework_list.dart';

class HomeworkScreen extends StatelessWidget {
  const HomeworkScreen({Key? key}) : super(key: key);

  static const pageName = '/homeworks';

  @override
  Widget build(BuildContext context) {
    return HomeworkList();
  }
}
