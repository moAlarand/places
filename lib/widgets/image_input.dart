import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider_pa';

class ImageInput extends StatefulWidget {
  final Function _onSelectImage;

  ImageInput(this._onSelectImage);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File pickedImage;
  void _pickeImage() async {
    pickedImage = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {});
    // final appDir = sy
    widget._onSelectImage(pickedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: pickedImage == null
                ? Text(
                    "no image yet!!",
                    textAlign: TextAlign.center,
                  )
                : Image.file(
                    pickedImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: FlatButton.icon(
                textColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.camera,
                ),
                label: Text('Take a photo'),
                onPressed: _pickeImage,
              ),
            ),
          )
        ],
      ),
    );
  }
}
