import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageProfile extends StatefulWidget {
  final Function onHandleProfilePicture;
  final File? profilePicture;
  const ImageProfile({
    Key? key,
    required this.onHandleProfilePicture,
    this.profilePicture,
  }) : super(key: key);

  @override
  _ImageProfileState createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  File? _storedImage;
  late int _index;

  @override
  void initState() {
    if (widget.profilePicture != null) _storedImage = widget.profilePicture;
    super.initState();
  }

  void _onCameraPressed() {
    _index = 0;
    _takePicture();
  }

  void _onGalleryPressed() {
    _index = 1;
    _takePicture();
  }

  Future<void> _takePicture() async {
    List<ImageSource> sources = [ImageSource.camera, ImageSource.gallery];
    //criamos uma instancia de ImagePicker
    var imagePicker = ImagePicker();
    //acessamos a camera e capturamos uma imagem de tamanho maximo 600
    var pickImage = await imagePicker.pickImage(
      source: sources[_index],
      maxWidth: 500,
      preferredCameraDevice: CameraDevice.front,
    );
    setState(() {
      _storedImage = File(pickImage!.path);
    });
    if (_storedImage == null) return;
    //capturamos o caminho do diretorio onde podemos armazenar essa imagem
    var appDir = await syspaths.getApplicationDocumentsDirectory();
    //capturamos o nome gerado para a imagem
    var fileName = path.basename(pickImage!.path);
    //salvamos a imagem no diretorio com o nome dado pelo sistema.
    await pickImage.saveTo('${appDir.path}/$fileName');
    print('$fileName');
    widget.onHandleProfilePicture(_storedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: _storedImage == null
              ? Icon(
                  Icons.photo_camera_front_rounded,
                  size: 60,
                )
              : CircleAvatar(
                  maxRadius: 60,
                  foregroundImage: FileImage(_storedImage!),
                ),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: _onCameraPressed,
              icon: Icon(Icons.add_a_photo),
              label: Text('Open Camera'),
              key: ValueKey('take_photo'),
            ),
            ElevatedButton.icon(
              onPressed: _onGalleryPressed,
              icon: Icon(Icons.add_photo_alternate),
              label: Text('Take from Galery'),
              key: ValueKey('gallery_photo'),
            ),
          ],
        )
      ],
    );
  }
}
