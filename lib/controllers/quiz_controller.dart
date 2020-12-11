import 'package:flutter/material.dart';
import 'package:flutter_quiz/models/results.dart';
import 'package:flutter_quiz/services/remote_sevice.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  var quizList = List<Results>().obs;
  PageController controller = PageController();
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchQuiz();
    super.onInit();
  }

  void fetchQuiz() async {
    try {
      isLoading(true);
      var quizs = await QuizRemoteService.loadQuiz();
      if (quizs != null) {
        quizList.value = quizs;
      }
    } finally {
      isLoading(false);
    }
  }

  void nextPage() async {
    await controller.nextPage(
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeOut,
    );
  }
}
