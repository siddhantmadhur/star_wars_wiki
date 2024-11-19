import 'dart:convert';

import 'package:http/http.dart' as http;

class SearchObject {
  final String name;
  final String url;

  SearchObject({
    required this.name,
    required this.url,
  });

  SearchObject.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        url = json['url'] as String;
}

class Person extends SearchObject {
  final String gender;
  final String hair_color;
  final String birth_year;
  final String height;

  Person({
    required super.name,
    required super.url,
    required this.gender,
    required this.hair_color,
    required this.birth_year,
    required this.height,
  });

  Person.fromJson(Map<String, dynamic> json)
      : gender = json['gender'] as String,
        hair_color = json['hair_color'] as String,
        birth_year = json['birth_year'] as String,
        height = json['height'] as String,
        super.fromJson(json);
}

enum StarWars {
  Person,
  Planet,
  Spaceship,
}

Future<List<Map<String, dynamic>>> SearchStarWars(StarWars type) async {
  Uri url;
  switch (type) {
    case StarWars.Person:
      url = Uri.parse("https://swapi.dev/api/people/");
      break;
    case StarWars.Planet:
      url = Uri.parse("https://swapi.dev/api/planets/");
      break;
    case StarWars.Spaceship:
      url = Uri.parse("https://swapi.dev/api/starships/");
      break;
  }
  var res = await http.get(url);
  var body = (await jsonDecode(res.body)) as Map<String, dynamic>;
  var results = body["results"] as List<dynamic>;
  List<Map<String, dynamic>> process_results = [];
  for (int i = 0; i < results.length; i++) {
    process_results.add(results[i] as Map<String, dynamic>);
  }
  return process_results;
}

Future<Map<String, dynamic>> fetchInformation(StarWars type, String url) async {
  var res = await http.get(Uri.parse(url));
  var body = (await jsonDecode(res.body)) as Map<String, dynamic>;
  return body;
}
