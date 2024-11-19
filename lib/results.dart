import 'package:flutter/material.dart';
import 'package:star_wars_wiki/star_wars.dart';
import 'package:star_wars_wiki/information.dart';

class SearchResult extends StatefulWidget {
  final StarWars type;

  const SearchResult({super.key, required this.type});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: SearchStarWars(widget.type),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState != ConnectionState.waiting) {
              var results = snapshot.data!;
              return ListView.builder(
                itemBuilder: (context, index) {
                  var item = results[index];
                  return ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InformationPage(
                          type: widget.type,
                          item_url: item["url"],
                          name: item["name"],
                        ),
                      ),
                    ),
                    title: Text(
                      item["name"],
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                },
                itemCount: results.length,
              );
            }

            if (snapshot.hasError) {
              return Text(
                "An error occurred: ${snapshot.error}",
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
