import 'package:flutter/material.dart';
import 'package:places/screens/add_place_screen.dart';
import 'package:places/screens/places_screen.dart';
import 'package:provider/provider.dart';
import './providers/greate_places.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatePlaces(),
      child: MaterialApp(
        title: 'places',
        theme:
            ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.amber),
        initialRoute: PlacesScreen.routeName,
        routes: {
          PlacesScreen.routeName: (_) => PlacesScreen(),
          AddPlaceScreen.routeName: (_) => AddPlaceScreen(),
        },
      ),
    );
  }
}
