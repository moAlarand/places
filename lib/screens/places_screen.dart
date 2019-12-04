import 'package:flutter/material.dart';
import 'package:places/providers/greate_places.dart';
import 'package:places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesScreen extends StatefulWidget {
  static const routeName = "places";
  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              //add place
              Navigator.pushNamed(context, AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: Consumer<GreatePlaces>(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            "no places yet!!",
            textAlign: TextAlign.center,
          ),
        ),
        builder: (_, greatePlaces, ch) => greatePlaces.items.length < 1
            ? ch
            : Container(
                child: ListView.builder(
                  itemCount: greatePlaces.items.length,
                  itemBuilder: (_, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          FileImage(greatePlaces.items[index].image),
                    ),
                    title: Text(
                      greatePlaces.items[index].title,
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      ////details
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
