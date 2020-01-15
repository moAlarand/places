import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:places/helpers/location_helper.dart';
import 'package:places/screens/map_screen.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _onSelectLocationOnMap() async {
    final selectedLocation = await Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapScreen(isSelcting: true,),
      ),
    );
  }

  void _getCurrentLocation() async {
    var location = await Location().getLocation();

    _previewImageUrl = LocationHelper.generatLocationImgUrlPreview(
        location.longitude, location.latitude);

    print(_previewImageUrl);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImageUrl == null
              ? Text(
                  'No Location Chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.location_on,
              ),
              label: Text('Current Location'),
              textColor: Theme.of(context).primaryColor,
              onPressed: _getCurrentLocation,
            ),
            FlatButton.icon(
              icon: Icon(
                Icons.map,
              ),
              label: Text('Select on Map'),
              textColor: Theme.of(context).primaryColor,
              onPressed: _onSelectLocationOnMap,
            ),
          ],
        ),
      ],
    );
  }
}
