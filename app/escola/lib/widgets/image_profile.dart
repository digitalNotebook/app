import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageProfile extends StatefulWidget {
  final Function onHandleProfilePicture;

  const ImageProfile({
    Key? key,
    required this.onHandleProfilePicture,
  }) : super(key: key);

  @override
  _ImageProfileState createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  File? _storedImage;

  Future<void> _takePicture() async {
    //criamos uma instancia de ImagePicker
    var imagePicker = ImagePicker();
    //acessamos a camera e capturamos uma imagem de tamanho maximo 600
    var pickImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
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
    widget.onHandleProfilePicture(_storedImage);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _takePicture,
      child: _storedImage == null
          ? Icon(
              Icons.add_a_photo,
              size: 60,
            )
          : CircleAvatar(
              maxRadius: 60,
              foregroundImage: FileImage(_storedImage!),
            ),
    );
  }
}
