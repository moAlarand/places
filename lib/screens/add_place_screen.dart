import 'package:flutter/material.dart';
import 'package:places/widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = "addPlaces";
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  void _onSave() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("new place"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _onSave,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: "title"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ImageInput(),
                ],
              ),
            ),
          ),
          RaisedButton.icon(
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.add),
            label: Text("add new place"),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
