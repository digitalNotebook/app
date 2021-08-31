import 'package:flutter/material.dart';

class MessageDetailScreen extends StatefulWidget {
  const MessageDetailScreen({Key? key}) : super(key: key);
  static const pageName = '/message-detail';
  @override
  _MessageDetailScreenState createState() => _MessageDetailScreenState();
}

class _MessageDetailScreenState extends State<MessageDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var message = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Message Details',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(message),
        ),
      ),
    );
  }
}
