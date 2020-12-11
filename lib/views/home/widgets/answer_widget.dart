import 'package:flutter/material.dart';
import 'package:flutter_quiz/controllers/quiz_controller.dart';
import 'package:flutter_quiz/controllers/score_controlle.dart';
import 'package:flutter_quiz/models/results.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AnswerWidget extends StatelessWidget {
  final quizController = Get.find<QuizController>();
  final scoreController = Get.find<ScoreController>();

  final List<Results> _results;
  final int index;
  final String m;

  AnswerWidget(this._results, this.index, this.m);

  Color ansColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: FlatButton(
          onPressed: () {
            if (m == _results[index].correctAnswer) {
              scoreController.addScore();

              _showSnackbar("Correct!", Colors.green);
              _goToNextQuestion();
            } else {
              _showSnackbar("Wrong!", Colors.red);
              _goToNextQuestion();
            }
          },
          child: Text(
            m,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  void _showSnackbar(String msg, Color bgColor) {
    return Get.snackbar(
      "Your Answer is: ",
      msg,
      backgroundColor: bgColor,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: false,
      mainButton: FlatButton(onPressed: () {}, child: Text("Next")),
    );
  }

  void _goToNextQuestion() {
    quizController.nextPage();
  }
}
