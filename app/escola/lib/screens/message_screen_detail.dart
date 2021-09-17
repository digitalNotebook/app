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
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.white,
            icon: Icon(
              Icons.arrow_back_ios_new,
            )),
        backgroundColor: Colors.black,
        toolbarHeight: 45,
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
