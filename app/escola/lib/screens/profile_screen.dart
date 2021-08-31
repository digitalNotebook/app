import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const pageName = '/profile-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Nome'),
            Text('Estatisticas'),
          ],
        ),
      ),
    );
  }
}
