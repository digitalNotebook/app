import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/exercicios.dart';
import '../widgets/exercicios_overview.dart';

class ExerciciosScreen extends StatelessWidget {
  const ExerciciosScreen({Key? key}) : super(key: key);

  static const pageName = '/exericios';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Exercicios(),
      child: ExerciciosOverview(),
    );
  }
}
