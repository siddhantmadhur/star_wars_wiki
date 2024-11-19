import 'package:flutter/material.dart';

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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
              onPressed: () {
                print("Button being pressed!!");
              },
              child: Text("Interact!!!"),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  Theme.of(context).colorScheme.primary,
                ),
                foregroundColor: WidgetStateProperty.all(
                  Theme.of(context).colorScheme.inversePrimary,
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                minimumSize: WidgetStateProperty.all(
                  const Size.fromHeight(12),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
