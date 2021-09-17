import 'package:flutter/material.dart';

class ClassBackground extends StatelessWidget {
  const ClassBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Background Bottom');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
