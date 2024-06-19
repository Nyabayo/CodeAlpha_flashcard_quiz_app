// providers/flashcard_provider.dart
import 'package:flutter/foundation.dart';
import '../models/flashcard.dart';

class FlashcardProvider with ChangeNotifier {
  List<Flashcard> _flashcards = [];
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
