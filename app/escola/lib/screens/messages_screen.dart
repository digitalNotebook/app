import 'package:escola/widgets/master_background.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  MessagesScreen({Key? key}) : super(key: key);

  static const pageName = '/messages';

  @override
  Widget build(BuildContext context) {
    print('Messages build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 45,
        title: Text(
          'Messages',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: MasterBackground(
          child: Center(
        child: Text('Lista das mensagens'),
      )),
    );
  }
}
