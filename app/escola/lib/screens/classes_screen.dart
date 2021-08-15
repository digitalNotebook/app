import 'package:escola/providers/aulas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/class_overview.dart';

class ClassesScreen extends StatelessWidget {
  const ClassesScreen({Key? key}) : super(key: key);

  static const pageName = '/classes';

  @override
  Widget build(BuildContext context) {
    //setamos o changeNotifierProvider uma widget acima
    print('Buildei a ClassesScreen');
    return ChangeNotifierProvider(
      create: (_) => Aulas(),
      child: ClassOverview(),
    );
  }
}
