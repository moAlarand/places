import 'dart:io';

import 'package:flutter/cupertino.dart';

class Location {
  final double latitiude;
  final double longitiude;
  final String address;

  Location({
    @required this.longitiude,
    @required this.latitiude,
    this.address,
  });
}

class Place {
  final String id;
  final String title;
  final File image;
  final Location location;

  Place({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.location,
  });
}
