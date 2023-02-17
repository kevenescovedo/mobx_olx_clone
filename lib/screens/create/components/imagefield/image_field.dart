import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/create/components/image_dialog.dart';
import 'package:xlo_mobx/screens/create/components/image_source_model.dart';

import '../../../../store/create_store.dart';
class ImageField extends StatelessWidget {
  final CreateStore store;
  const ImageField({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File file) {
      store.images.add(file);
      Navigator.pop(context);

    }
    return Container(
      color: Colors.grey[200],
      height: 120,
      child: Observer(
    builder: (_)
    {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: store.images.length < 5 ?store.images.length + 1 : 5 ,
        itemBuilder: (_, index) {
          if(index ==  store.images.length) {
            return Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
              child: GestureDetector(
                onTap: () {
                  if (Platform.isAndroid) {
                    showModalBottomSheet(context: context,
                        builder: (_) =>
                            ImageSourceModel(function: onImageSelected,));
                  } else {
                    showCupertinoModalPopup(context: context,
                        builder: (_) =>
                            ImageSourceModel(function: onImageSelected,));
                  }
                },
                child: CircleAvatar(
                  radius: 44,
                  backgroundColor: Colors.grey[300],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt, size: 40, color: Colors.white,),

                    ],),

                ),
              ),
            );
          }
          else {
            return Padding(
              padding: EdgeInsets.fromLTRB(8, 16, index == 4 ? 8 : 0, 16),
              child: GestureDetector(
                onTap: () {
                showDialog(context: context, builder: (_) => ImageDialog(
                  image: store.images[index],
                  onDelete: () {
                    store.images.removeAt(index);
                }
                ));
                },
                child: CircleAvatar(
                  radius: 44,
                 backgroundImage: FileImage(store.images[index]),

                ),
              ),
            );
          }
        },
      );
    }
    )

    );
  }
}
