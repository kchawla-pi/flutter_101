import 'package:flutter/material.dart';

import 'package:flutter_101/location_detail.dart';
import 'package:flutter_101/mocks/mock_location.dart';
import 'package:flutter_101/models/location.dart';
void main() {
  final Location mockLocation = MockLocation.fetchAny();
  return runApp(MaterialApp(home: LocationDetail(mockLocation)));
}
