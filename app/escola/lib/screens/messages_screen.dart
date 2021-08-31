import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  MessagesScreen({Key? key}) : super(key: key);

  static const pageName = '/messages';

  @override
  Widget build(BuildContext context) {
    print('Messages build');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Messages',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Center(
        child: Text('Lista das mensagens'),
      ),
    );
  }
}
