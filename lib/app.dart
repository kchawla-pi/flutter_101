import 'package:flutter/material.dart';

import 'package:flutter_101/location_list.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LocationList());
  }
}
