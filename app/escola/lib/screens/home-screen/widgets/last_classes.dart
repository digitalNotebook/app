import 'package:flutter/material.dart';

class ClassList extends StatelessWidget {
  final double textScale;
  final String teacherName;
  final String className;
  final String classDescription;

  ClassList({
    required this.textScale,
    required this.teacherName,
    required this.className,
    required this.classDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 15,
              child: Icon(Icons.person),
            ),
            Text(
              teacherName,
              style: TextStyle(fontSize: 10 * textScale),
            ),
          ],
        ),
        title: Text(
          className,
          style: TextStyle(fontSize: 12 * textScale),
        ),
        subtitle: Text(
          'Something here about present continuous',
          style: TextStyle(fontSize: 12 * textScale),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        trailing: Text(
          '${DateTime.now().day.toString()} th',
          style: TextStyle(fontSize: 12 * textScale),
        ),
      ),
    );
  }
}
