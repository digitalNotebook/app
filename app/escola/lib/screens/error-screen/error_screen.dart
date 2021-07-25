import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  static const routeName = '/error';

  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Something went wrong, go back to menu page'),
            TextButton(
              onPressed: () {},
              child: Text('Home Screen'),
            )
          ],
        ),
      ),
    );
  }
}
