// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/flashcard_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FlashcardProvider(),
      child: MaterialApp(
        title: 'Flashcard Quiz App',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
