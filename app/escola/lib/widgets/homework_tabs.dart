import 'package:flutter/material.dart';

class HomeworkTabs extends StatelessWidget {
  const HomeworkTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text('DONE'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('TO DO'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('FAVORITES'),
        ),
      ],
    );
  }
}
