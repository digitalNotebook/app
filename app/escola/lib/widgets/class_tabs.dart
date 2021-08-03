import 'package:flutter/material.dart';

class ClassTabs extends StatelessWidget {
  final VoidCallback handleDoneButton;
  final VoidCallback handleUndoneButton;
  final VoidCallback handleFavoriteButton;

  ClassTabs(
      {required this.handleDoneButton,
      required this.handleUndoneButton,
      required this.handleFavoriteButton});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          autofocus: true,
          clipBehavior: Clip.hardEdge,
          onPressed: handleUndoneButton,
          child: Text('UNDONE'),
        ),
        ElevatedButton(
          onPressed: handleDoneButton,
          child: Text('DONE'),
        ),
        ElevatedButton(
          onPressed: handleFavoriteButton,
          child: Text('FAVORITES'),
        ),
      ],
    );
  }
}
