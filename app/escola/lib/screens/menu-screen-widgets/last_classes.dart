import 'package:flutter/material.dart';

class ClassList extends StatelessWidget {
  final double textScale;
  final String teacherName;
  final String className;
  final String classDescription;
  final double containerHeight;

  ClassList({
    required this.textScale,
    required this.teacherName,
    required this.className,
    required this.classDescription,
    required this.containerHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                maxRadius: 25,
                child: Icon(Icons.person),
              ),
              Text(
                teacherName,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
        title: Text(
          className,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        subtitle: Text(
          'Something here about present continuous kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk',
          style: Theme.of(context).textTheme.bodyText2,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        trailing: Text(
          '${DateTime.now().day.toString()} th',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
