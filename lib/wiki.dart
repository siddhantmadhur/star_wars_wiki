import 'package:flutter/material.dart';
import 'package:star_wars_wiki/results.dart';
import 'package:star_wars_wiki/star_wars.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars Wiki',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Star Wars Wikipedia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _currentPage = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final screens = <Widget>[
    const SearchResult(type: StarWars.Person),
    const SearchResult(type: StarWars.Planet),
    const SearchResult(type: StarWars.Spaceship),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.person), label: "People"),
          NavigationDestination(icon: Icon(Icons.language), label: "Planets"),
          NavigationDestination(
              icon: Icon(Icons.rocket_launch), label: "Ships"),
        ],
        onDestinationSelected: (destination) {
          setState(
            () {
              _currentPage = destination;
            },
          );
        },
        selectedIndex: _currentPage,
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: screens[_currentPage],
    );
  }
}
