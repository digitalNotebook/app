import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  MessagesScreen({Key? key}) : super(key: key);

  static const pageName = '/messages';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Lista das mensagens'),
    );
  }
}
