// screens/quiz_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flip_card/flip_card.dart';
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
        title: Text('Flashcards App'),
      ),
      body: Consumer<FlashcardProvider>(
        builder: (context, flashcardProvider, child) {
          if (flashcardProvider.flashcards.isEmpty) {
            return Center(
              child: Text('No flashcards available'),
            );
          }

          final flashcard = flashcardProvider.flashcards[_currentIndex];
          int totalQuestions = flashcardProvider.flashcards.length;

          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Question ${_currentIndex + 1} of $totalQuestions Completed',
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                LinearProgressIndicator(
                  value: (_currentIndex + 1) / totalQuestions,
                  backgroundColor: Colors.grey[200],
                  color: Colors.pinkAccent,
                ),
                SizedBox(height: 20),
                FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        flashcard.question,
                        style: TextStyle(fontSize: 24.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  back: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        flashcard.answer,
                        style: TextStyle(fontSize: 24.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Tap to see Answer',
                  style: TextStyle(color: Colors.grey, fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
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
                      icon: Icon(Icons.thumb_up),
                      label: Text('Correct'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    ),
                    ElevatedButton.icon(
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
                      icon: Icon(Icons.thumb_down),
                      label: Text('Wrong'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    ),
                  ],
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
