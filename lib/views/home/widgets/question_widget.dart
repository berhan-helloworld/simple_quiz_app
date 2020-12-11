import 'package:flutter/material.dart';
import 'package:flutter_quiz/controllers/quiz_controller.dart';
import 'package:flutter_quiz/models/results.dart';
import 'package:flutter_quiz/views/congrats/congrats.dart';
import 'package:flutter_quiz/views/home/widgets/answer_widget.dart';
import 'package:get/get.dart';

class QuestionWidget extends StatelessWidget {
  final quizController = Get.put(QuizController());
  final List<Results> _results;
  QuestionWidget(
    this._results, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: quizController.controller,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _results.length,
      itemBuilder: (context, index) {
        if (index == 29) {
          return Congrats();
        } else {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            color: Colors.white,
            elevation: 20.0,
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      _results[index].question,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FilterChip(
                            backgroundColor: Colors.grey[100],
                            label: Text(_results[index].category),
                            onSelected: (b) {},
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FilterChip(
                            backgroundColor: Colors.grey[100],
                            label: Text(
                              _results[index].difficulty,
                            ),
                            onSelected: (b) {},
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.grey[100],
                child: Text(_results[index].type.startsWith("m") ? "M" : "B"),
              ),
              children: _results[index].allAnswers.map((m) {
                return AnswerWidget(_results, index, m);
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
