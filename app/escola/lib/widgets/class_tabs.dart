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
    print('Buildei os botões');
    final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: handleUndoneButton,
          child: const Text('UNDONE'),
          style: ButtonStyle(
            backgroundColor: status == Filters.UNDONE
                ? elevatedButtonTheme.style!.backgroundColor
                : MaterialStateProperty.all(Colors.white),
            overlayColor: MaterialStateProperty.all(Colors.white),
            splashFactory: NoSplash.splashFactory,
            foregroundColor: status == Filters.UNDONE
                ? elevatedButtonTheme.style!.foregroundColor
                : MaterialStateProperty.all(Colors.black),
          ),
        ),
        ElevatedButton(
          onPressed: handleDoneButton,
          child: const Text('DONE'),
          style: ButtonStyle(
            backgroundColor: status == Filters.DONE
                ? elevatedButtonTheme.style!.backgroundColor
                : MaterialStateProperty.all(Colors.white),
            overlayColor: MaterialStateProperty.all(Colors.white),
            splashFactory: NoSplash.splashFactory,
            foregroundColor: status == Filters.DONE
                ? elevatedButtonTheme.style!.foregroundColor
                : MaterialStateProperty.all(Colors.black),
          ),
        ),
        ElevatedButton(
          onPressed: handleFavoriteButton,
          child: const Text('FAVORITES'),
          style: ButtonStyle(
            backgroundColor: status == Filters.FAVORITES
                ? elevatedButtonTheme.style!.backgroundColor
                : MaterialStateProperty.all(Colors.white),
            overlayColor: MaterialStateProperty.all(Colors.white),
            splashFactory: NoSplash.splashFactory,
            foregroundColor: status == Filters.FAVORITES
                ? elevatedButtonTheme.style!.foregroundColor
                : MaterialStateProperty.all(Colors.black),
          ),
        ),
      ],
    );
  }
}
