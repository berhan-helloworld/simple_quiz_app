import 'dart:convert';

import 'package:flutter_quiz/models/quiz.dart';
import 'package:flutter_quiz/models/results.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class QuizRemoteService {
  static var client = http.Client();

  static Future<List<Results>> loadQuiz() async {
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var decodedRes = jsonDecode(response.body);
      return Quiz.fromJson(decodedRes).results;
    } else {
      //show error message
      return null;
    }
  }
}
