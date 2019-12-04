import 'package:flutter/material.dart';
import 'package:places/models/place.dart';

class GreatePlaces extends ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(Place place) {
    _items.add(place);
    notifyListeners();
  }
}
