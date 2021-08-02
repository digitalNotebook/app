import 'package:escola/providers/aulas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/class_list.dart';

class ClassesScreen extends StatelessWidget {
  const ClassesScreen({Key? key}) : super(key: key);

  static const pageName = '/classes';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Aulas(),
      child: ClassList(),
    );
  }
}
