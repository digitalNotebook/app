import 'package:escola/widgets/bottomBackground.dart';
import 'package:escola/widgets/topBackground.dart';
import 'package:flutter/material.dart';

class MasterBackground extends StatelessWidget {
  final Widget child;

  const MasterBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        ClassBackground(),
        ClassBackgroundTop(),
        child,
      ],
    ));
  }
}
