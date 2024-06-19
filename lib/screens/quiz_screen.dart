// screens/quiz_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/flashcard_provider.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  bool _showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Consumer<FlashcardProvider>(
        builder: (context, flashcardProvider, child) {
          if (flashcardProvider.flashcards.isEmpty) {
            return Center(
              child: Text('No flashcards available'),
            );
          }

          final flashcard = flashcardProvider.flashcards[_currentIndex];

          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  flashcard.question,
                  style: TextStyle(fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
                if (_showAnswer)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      flashcard.answer,
                      style: TextStyle(fontSize: 18.0, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showAnswer = !_showAnswer;
                    });
                  },
                  child: Text(_showAnswer ? 'Hide Answer' : 'Show Answer'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_currentIndex < flashcardProvider.flashcards.length - 1) {
                      setState(() {
                        _currentIndex++;
                        _showAnswer = false;
                      });
                    } else {
                      _showResult(context);
                    }
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showResult(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Quiz Finished'),
          content: Text('Your score is ${Provider.of<FlashcardProvider>(context, listen: false).score}'),
          actions: [
            TextButton(
              onPressed: () {
                Provider.of<FlashcardProvider>(context, listen: false).resetScore();
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
