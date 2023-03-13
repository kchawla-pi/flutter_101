import 'package:flutter/material.dart';
import 'package:flutter_101/location_detail.dart';
import 'package:flutter_101/models/location.dart';

import 'package:flutter_101/styles.dart';

class LocationList extends StatelessWidget {
  final List<Location> locations;

  const LocationList(this.locations, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: const Text("Locations", style: Styles.navBarTitle)),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.all(10.0),
              leading: _itemThumbnail(locations[index]),
              title: _itemTile(locations[index]),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LocationDetail(locations[index])));
              },
            );
          },
        ));
  }

  Widget _itemThumbnail(Location location) {
    return Container(
      constraints: const BoxConstraints.tightFor(width: 100.0),
      child: Image.network(location.url, fit: BoxFit.fitWidth),
    );
  }

  Widget _itemTile(Location location) {
    return Text(location.name, style: Styles.textDefault);
  }
}
