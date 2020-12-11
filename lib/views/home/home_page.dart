import 'package:flutter_quiz/controllers/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/views/home/widgets/my_app_bar.dart';
import 'package:flutter_quiz/views/home/widgets/question_widget.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final quizController = Get.put(QuizController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar("Quiz App"),
        body: Obx(() {
          if (quizController.isLoading.value)
            return Center(
              child: CircularProgressIndicator(),
            );
          else
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: QuestionWidget(quizController.quizList),
            );
        }));
  }
}
