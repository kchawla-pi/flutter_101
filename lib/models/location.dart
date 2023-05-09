import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_101/models/location_fact.dart';
import 'package:flutter_101/endpoints.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  final int id;
  final String name;
  final String url;
  final List<LocationFact> facts;
  Location(
      {required this.id,
      required this.name,
      required this.url,
      required this.facts});

  Location.blank()
      : id = 0,
        name = '',
        url = '',
        facts = [];

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  static Future<List<Location>> fetchAll() async {
    var uri = Endpoint.uri('/locations', queryParameters: {});

    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      throw (resp.body);
    }

    List<Location> locations = <Location>[];
    for (var jsonItem in json.decode(resp.body)) {
      locations.add(Location.fromJson(jsonItem));
    }
    return locations;
  }

  static Future<Location> fetchByID(int id) async {
    var uri = Endpoint.uri('/locations/$id', queryParameters: {});
    final resp = await http.get(uri);
    print("URI: $uri");

    if (resp.statusCode != 200) {
      throw (resp.body);
    }
    final Map<String, dynamic> itemMap = json.decode(resp.body);
    return Location.fromJson(itemMap);
  }
}
