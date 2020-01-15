import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:places/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelcting;

  MapScreen({
    this.initialLocation = const PlaceLocation(latitude: 30, longitude: 32),
    this.isSelcting: false,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickedLocation;

  @override
  void initState() {
    if (_pickedLocation == null) {
      Location().getLocation().then(
            (myLocation) => _onSelectLocation(
              LatLng(myLocation.latitude, myLocation.longitude),
            ),
          );
    }

    super.initState();
  }

  void _onSelectLocation(position) {
    _pickedLocation = position;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Map"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 9
        ),
        onTap: widget.isSelcting ? _onSelectLocation : null,
        markers: _pickedLocation == null
            ? null
            : {
                Marker(
                  markerId: MarkerId("m1"),
                  position: _pickedLocation,
                )
              },
      ),
    );
    
  }
}
