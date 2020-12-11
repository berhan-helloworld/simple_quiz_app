import 'package:flutter/material.dart';
import 'package:flutter_quiz/controllers/score_controlle.dart';
import 'package:flutter_quiz/views/home/home_page.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class Congrats extends StatelessWidget {
  final scoreController = Get.find<ScoreController>();
  Congrats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You Have Got: ${scoreController.score.value.toString()} out of $numberOfQuestions",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            elevation: 10.0,
            child: Text(
              "Try Again",
            ),
            onPressed: () {
              scoreController.resetScore();
              Get.offAll(HomePage());
            },
          ),
        ],
      ),
    );
  }
}
