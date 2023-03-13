import 'package:flutter/material.dart';
import 'package:flutter_101/location_list.dart';
import 'package:flutter_101/mocks/mock_location.dart';

void main(List<String> args) {
  final mockLocations = MockLocation.fetchAll();

  return runApp(MaterialApp(home: LocationList(mockLocations)));
}
