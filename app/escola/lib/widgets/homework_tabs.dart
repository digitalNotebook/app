import '../enums/filters_class.dart';
import 'package:flutter/material.dart';

class HomeworkTabs extends StatelessWidget {
  final VoidCallback handleDoneButton;
  final VoidCallback handleUndoneButton;
  final VoidCallback handleFavoriteButton;
  final Filters filters;

  const HomeworkTabs(this.handleDoneButton, this.handleFavoriteButton,
      this.handleUndoneButton, this.filters,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: handleUndoneButton,
          child: const Text('TO DO'),
          style: ButtonStyle(
            backgroundColor: filters == Filters.UNDONE
                ? elevatedButtonTheme.style!.backgroundColor
                : MaterialStateProperty.all(Colors.white),
            overlayColor: MaterialStateProperty.all(Colors.white),
            splashFactory: NoSplash.splashFactory,
            foregroundColor: filters == Filters.UNDONE
                ? elevatedButtonTheme.style!.foregroundColor
                : MaterialStateProperty.all(Colors.black),
          ),
        ),
        ElevatedButton(
          onPressed: handleDoneButton,
          child: const Text('DONE'),
          style: ButtonStyle(
            backgroundColor: filters == Filters.DONE
                ? elevatedButtonTheme.style!.backgroundColor
                : MaterialStateProperty.all(Colors.white),
            overlayColor: MaterialStateProperty.all(Colors.white),
            splashFactory: NoSplash.splashFactory,
            foregroundColor: filters == Filters.DONE
                ? elevatedButtonTheme.style!.foregroundColor
                : MaterialStateProperty.all(Colors.black),
          ),
        ),
        ElevatedButton(
          onPressed: handleFavoriteButton,
          child: const Text('FAVORITES'),
          style: ButtonStyle(
            backgroundColor: filters == Filters.FAVORITES
                ? elevatedButtonTheme.style!.backgroundColor
                : MaterialStateProperty.all(Colors.white),
            overlayColor: MaterialStateProperty.all(Colors.white),
            splashFactory: NoSplash.splashFactory,
            foregroundColor: filters == Filters.FAVORITES
                ? elevatedButtonTheme.style!.foregroundColor
                : MaterialStateProperty.all(Colors.black),
          ),
        ),
      ],
    );
  }
}
