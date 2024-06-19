// providers/flashcard_provider.dart
import 'package:flutter/foundation.dart';
import '../models/flashcard.dart';

class FlashcardProvider with ChangeNotifier {
  List<Flashcard> _flashcards = [
    Flashcard(question: "What is Flutter?", answer: "UI framework for cross-platform application creation."),
    Flashcard(question: "What is Dart?", answer: "Programming language used with Flutter."),
    Flashcard(question: "What is State Management?", answer: "Technique to manage the state of an application."),
    Flashcard(question: "What is a Widget?", answer: "Basic building block of a Flutter UI."),
    Flashcard(question: "What is a StatelessWidget?", answer: "A widget that does not require mutable state."),
    Flashcard(question: "What is a StatefulWidget?", answer: "A widget that has mutable state."),
    Flashcard(question: "What is a BuildContext?", answer: "Handles the location of a widget in the widget tree."),
    Flashcard(question: "What is setState()?", answer: "A method to update the state of a StatefulWidget."),
    Flashcard(question: "What is hot reload?", answer: "A feature to instantly view changes without restarting the app."),
    Flashcard(question: "What is a Navigator?", answer: "Manages routes and the navigation stack."),
    Flashcard(question: "What is an InheritedWidget?", answer: "A widget that passes data down the widget tree."),
    Flashcard(question: "What is a Future?", answer: "Represents a potential value or error that will be available at some time in the future."),
    Flashcard(question: "What is an Async function?", answer: "A function that returns a Future."),
    Flashcard(question: "What is a Stream?", answer: "Asynchronous sequence of data."),
    Flashcard(question: "What is a Provider?", answer: "A wrapper around InheritedWidget to make state management easier."),
  ];
  int _score = 0;

  List<Flashcard> get flashcards => _flashcards;
  int get score => _score;

  void addFlashcard(Flashcard flashcard) {
    _flashcards.add(flashcard);
    notifyListeners();
  }

  void incrementScore() {
    _score++;
    notifyListeners();
  }

  void resetScore() {
    _score = 0;
    notifyListeners();
  }
}
