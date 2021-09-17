import 'package:flutter/material.dart';

class ClassBackgroundTop extends StatelessWidget {
  const ClassBackgroundTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Background Top');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
