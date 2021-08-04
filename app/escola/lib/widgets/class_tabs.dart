import 'package:flutter/material.dart';
import '../enums/filters_class.dart';

class ClassTabs extends StatelessWidget {
  final VoidCallback handleDoneButton;
  final VoidCallback handleUndoneButton;
  final VoidCallback handleFavoriteButton;
  final Filters status;

  ClassTabs({
    required this.handleDoneButton,
    required this.handleUndoneButton,
    required this.handleFavoriteButton,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: handleUndoneButton,
          child: Text('UNDONE'),
          style: ButtonStyle(
            backgroundColor: status == Filters.UNDONE
                ? MaterialStateProperty.all(Theme.of(context).buttonColor)
                : null,
          ),
        ),
        ElevatedButton(
          onPressed: handleDoneButton,
          child: Text('DONE'),
          style: ButtonStyle(
            backgroundColor: status == Filters.DONE
                ? MaterialStateProperty.all(Theme.of(context).buttonColor)
                : null,
          ),
        ),
        ElevatedButton(
          onPressed: handleFavoriteButton,
          child: Text('FAVORITES'),
          style: ButtonStyle(
            backgroundColor: status == Filters.FAVORITES
                ? MaterialStateProperty.all(Theme.of(context).buttonColor)
                : null,
          ),
        ),
      ],
    );
  }
}
