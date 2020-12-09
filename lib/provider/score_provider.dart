import 'package:flutter/foundation.dart';

class ScoreProvider with ChangeNotifier {
  int _score = 0;

  int get score => _score;

  void addScore() {
    _score++;
    notifyListeners();
  }

  void resetScore() {
    _score = 0;
    notifyListeners();
  }
}
