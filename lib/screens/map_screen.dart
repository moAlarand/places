import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:places/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  bool isSelcting;

  MapScreen({
    this.initialLocation = const PlaceLocation(
      latitude: 30.1245,
      longitude: 32.457,
    ),
    this.isSelcting: false,
  });
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickedLocation;

  void _onSelectLocation(position) {
    _pickedLocation = position;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your map"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
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
