import 'package:flutter/material.dart';
import 'package:flutter_101/location_detail.dart';
import 'package:flutter_101/models/location.dart';

import 'package:flutter_101/styles.dart';

class LocationList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  List<Location> locations = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: const Text("Locations", style: Styles.navBarTitle)),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: _listViewItemBuilder,
        ));
  }

  loadData() async {
    final locations = await Location.fetchAll();
    setState(() {
      this.locations = locations;
    });
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    final location = locations[index];
    return ListTile(
      contentPadding: const EdgeInsets.all(10.0),
      leading: _itemThumbnail(location),
      title: _itemTile(location),
      onTap: () => _naviagteToLocationDetail(context, location.id),
    );
  }

  void _naviagteToLocationDetail(context, int index) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LocationDetail(index)));
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
