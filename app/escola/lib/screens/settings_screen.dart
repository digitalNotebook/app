import 'package:escola/widgets/master_background.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const pageName = 'settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 45,
          title: Text(
            'Settings',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.white,
            icon: Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
        ),
        body: MasterBackground(
          child: Center(
            child: Text('Settings options here!'),
          ),
        ));
  }
}
