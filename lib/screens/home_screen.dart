// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/flashcard_provider.dart';
import 'add_flashcard_screen.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcard Quiz App'),
      ),
      body: Consumer<FlashcardProvider>(
        builder: (context, flashcardProvider, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: flashcardProvider.flashcards.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(flashcardProvider.flashcards[index].question),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen()),
                  );
                },
                child: Text('Start Quiz'),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddFlashcardScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
