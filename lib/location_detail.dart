import 'package:flutter/material.dart';
import 'package:flutter_101/models/location.dart';
import 'package:flutter_101/styles.dart';

class LocationDetail extends StatefulWidget {
  final int locationID;

  const LocationDetail(this.locationID, {super.key});

  @override
  State<StatefulWidget> createState() => _LocationDetailState(locationID);
}

class _LocationDetailState extends State<LocationDetail> {
  final int locationID;
  Location location = Location.blank();

  _LocationDetailState(this.locationID);

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(location.name, style: Styles.navBarTitle)),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context, location),
        )));
  }

  loadData() async {
    final location = await Location.fetchByID(this.locationID);
    if (mounted) {
      setState(() {
        this.location = location;
      });
    }
  }

  List<Widget> _renderBody(BuildContext context, Location location) {
    var result = List<Widget>.empty(growable: true);
    result.add(_bannerImage(location.url, 170.0));
    result.addAll(_renderFacts(context, location));
    return result;
  }

  List<Widget> _renderFacts(BuildContext context, Location location) {
    var result = List<Widget>.empty(growable: true);
    for (int i = 0; i < location.facts.length; i++) {
      result.add(_sectionTitle(location.facts[i].title));
      result.add(_sectionText(location.facts[i].text));
    }
    return result;
  }

  Widget _bannerImage(String url, double height) {
    Image image;
    try {
      if (url.isNotEmpty) {
        image = Image.network(url, fit: BoxFit.fitWidth);
      }
    } catch (e) {
      print("Could not load image from URL: $url");
    }
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: Image.network(url, fit: BoxFit.fitWidth),
    );
  }

  Widget _sectionTitle(String titleText) {
    return Container(
        padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
        child: Text(
          titleText,
          textAlign: TextAlign.left,
          style: Styles.headerLarge,
        ));
  }

  Widget _sectionText(String text) {
    return Container(
        padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
        child: Text(text, style: Styles.textDefault));
  }
}

//   Widget _section(String title, Color color) {
//     return Container(
//       decoration: BoxDecoration(color: color),
//       child: Text(title),
//     );
//   }
// }
