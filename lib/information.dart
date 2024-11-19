import 'package:flutter/material.dart';
import 'package:star_wars_wiki/star_wars.dart';

class InformationPage extends StatelessWidget {
  final String name;
  final StarWars type;
  final String item_url;

  const InformationPage({
    super.key,
    required this.type,
    required this.item_url,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            if (type == StarWars.Person) {
              var person = Person.fromJson(snapshot.data!);
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name: ${person.name}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Birth Year: ${person.birth_year}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Hair Color: ${person.hair_color}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Height: ${person.height}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              );
            } else if (type == StarWars.Planet) {
              var planet = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name: ${planet["name"]}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Climate: ${planet["climate"]}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Population: ${planet["population"]}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Terrain: ${planet["terrain"]}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              );
            } else if (type == StarWars.Spaceship) {
              var spaceship = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name: ${spaceship["name"]}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Cost: ${spaceship["cost_in_credits"]} Credits",
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Crew: ${spaceship["crew"]} people",
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Passengers: ${spaceship["passengers"]} people",
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Hyperdrive Rating: ${spaceship["hyperdrive_rating"]}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Length: ${spaceship["length"]} meters",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              );
            }
          }

          return const Center(child: CircularProgressIndicator());
        },
        future: fetchInformation(type, item_url),
      ),
    );
  }
}
