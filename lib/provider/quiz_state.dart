// Shared Data
import 'package:flutter/material.dart';

class QuizState with ChangeNotifier {
  final PageController controller = PageController();

  void nextPage() async {
    await controller.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }
}
