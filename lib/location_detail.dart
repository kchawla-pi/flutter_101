import 'package:flutter/material.dart';
import 'package:flutter_101/models/location.dart';
import 'package:flutter_101/models/location_fact.dart';

class LocationDetail extends StatelessWidget {
  final Location location;

  LocationDetail(this.location);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(location.name)),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderFacts(location),
        ));
  }

  List<Widget> _renderFacts(Location location) {
    var result = List<Widget>.empty(growable: true);
    for (int i = 0; i < location.facts.length; i++) {
      result.add(_sectionTitle(location.facts[i].title));
      result.add(_sectionText(location.facts[i].text));
    }
    return result;
  }

  Widget _bannerImage(String url, double height) {
    return Container(
      child: Image.network(url, )
    );
  }

  Widget _sectionTitle(String titleText) {
    return Text(titleText);
  }

  Widget _sectionText(String text) {
    return Text(text);
  }

  Widget _section(String title, Color color) {
    return Container(
      decoration: BoxDecoration(color: color),
      child: Text(title),
    );
  }
}
