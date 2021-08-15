import 'package:escola/providers/exercicios.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/homeworks.dart';
import '../widgets/homework_overview.dart';

class HomeworkScreen extends StatelessWidget {
  const HomeworkScreen({Key? key}) : super(key: key);

  static const pageName = '/homeworks';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Homeworks(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Exercicios(),
        ),
      ],
      child: HomeworkOverview(),
    );
  }
}
