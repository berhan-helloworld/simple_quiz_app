import 'dart:convert';

import 'package:flutter_quiz/model/quiz.dart';
import 'package:flutter_quiz/model/results.dart';
import 'package:http/http.dart' as http;

class QuizRepository {
  String uri = "https://opentdb.com/api.php?amount=30";
  Future<List<Results>> loadQuiz() async {
    var response = await http.get(uri);
    var decodedRes = jsonDecode(response.body);
    return Quiz.fromJson(decodedRes).results;
  }
}
