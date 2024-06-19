// screens/add_flashcard_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/flashcard.dart';
import '../providers/flashcard_provider.dart';

class AddFlashcardScreen extends StatefulWidget {
  @override
  _AddFlashcardScreenState createState() => _AddFlashcardScreenState();
}

class _AddFlashcardScreenState extends State<AddFlashcardScreen> {
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Flashcard'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _questionController,
              decoration: InputDecoration(labelText: 'Question'),
            ),
            TextField(
              controller: _answerController,
              decoration: InputDecoration(labelText: 'Answer'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final question = _questionController.text;
                final answer = _answerController.text;

                if (question.isNotEmpty && answer.isNotEmpty) {
                  Provider.of<FlashcardProvider>(context, listen: false)
                      .addFlashcard(Flashcard(question: question, answer: answer));

                  Navigator.pop(context);
                }
              },
              child: Text('Add Flashcard'),
            ),
          ],
        ),
      ),
    );
  }
}
