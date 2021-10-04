import 'dart:io';

import 'package:flutter/material.dart';
import '../widgets/image_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);
  static const pageName = '/profile-screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;

  void _selectedProfileImage(File image) {
    _profileImage = image;
  }

  @override
  void didChangeDependencies() {
    var arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null) _profileImage = arguments as File;
    super.didChangeDependencies();
  }

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
            if (_profileImage == null) {
              Navigator.of(context).pop();
            } else {
              Navigator.of(context).pop(_profileImage);
            }
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
              profilePicture: _profileImage != null ? _profileImage : null,
              onHandleProfilePicture: _selectedProfileImage,
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
