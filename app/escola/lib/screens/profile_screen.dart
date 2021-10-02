import 'package:flutter/material.dart';
import '../widgets/image_profile.dart';

class ProfileScreen extends StatelessWidget {
  final Function? handleProfilePhoto;

  const ProfileScreen({
    Key? key,
    this.handleProfilePhoto,
  }) : super(key: key);
  static const pageName = '/profile-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 45,
        title: Text(
          'My Profile',
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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            ImageProfile(
              onHandleProfilePicture: handleProfilePhoto!,
            ),
            SizedBox(
              height: 15,
            ),
            Text('Nome'),
            SizedBox(
              height: 15,
            ),
            Text('Estatisticas'),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
