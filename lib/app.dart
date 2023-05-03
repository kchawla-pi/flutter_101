import 'package:flutter/material.dart';

import 'package:flutter_101/location_list.dart';
import 'package:flutter_101/mocks/mock_location.dart';

class App extends StatelessWidget {
  final mockLocations = MockLocation.fetchAll();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LocationList(mockLocations));
  }
}
