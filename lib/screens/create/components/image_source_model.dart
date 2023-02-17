import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
class ImageSourceModel extends StatelessWidget {
  final Function(File file) function;
  const ImageSourceModel({Key? key , required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     if(Platform.isAndroid)
      return BottomSheet(onClosing: (){}, builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
        FlatButton(onPressed: getFromCamera, child: Text("Camera")),
        FlatButton(onPressed: getFromGallery, child: Text("Galeria"))
      ],);
    });
     else
       return CupertinoActionSheet(
         title: Text("Selecionar foto para o anúncio"),
         message: Text("Escolha a origem da Foto"),
         cancelButton:   CupertinoActionSheetAction(onPressed: (){Navigator.pop(context);}, child: Text("Cancelar", style: TextStyle(color: Colors.red),)),
         actions: [
           CupertinoActionSheetAction(onPressed: getFromCamera, child: Text("Camera")),
           CupertinoActionSheetAction(onPressed: getFromGallery, child: Text("Galeria")),
         ],
       );

  }

  void getFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if(pickedFile != null) {
      final file = File(pickedFile!.path);
      imageSelected(file);
    }
  }
  void getFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedFile != null) {
      final file = File(pickedFile!.path);
      imageSelected(file);
    }
  }
  void imageSelected(File image) async  {
   final cropedFile = await ImageCropper().cropImage(sourcePath: image.path,
       aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: "Editar Imagem",
        toolbarColor: Colors.purple,
        toolbarWidgetColor: Colors.white
      ),
     iosUiSettings: IOSUiSettings(
       title: "Editar a imagem",
       cancelButtonTitle: "Cancelar",
       doneButtonTitle: "Concluir"
     )
   );
   if(cropedFile != null) {
     function(cropedFile);
   }
  }
}
