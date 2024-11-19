import 'package:flutter/material.dart';
import 'package:star_wars_wiki/results.dart';
import 'package:star_wars_wiki/star_wars.dart';


void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Flutter Workshop"),
        ),
        body: TextButton(
          child: Text("Interact!!!"),
          onPressed: () {},
        ),
      ),
    );
  }
}
