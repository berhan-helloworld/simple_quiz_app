import 'dart:math';
import 'package:flutter_quiz/model/results.dart';
import 'package:flutter_quiz/provider/quiz_state.dart';
import 'package:flutter_quiz/widgets/my_app_bar.dart';
import 'package:flutter_quiz/widgets/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_quiz/api/quiz_repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar("Quiz App"),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => QuizState(),
        child: FutureBuilder<List<Results>>(
            future: QuizRepository().loadQuiz(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Press button to start.');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.pink,
                    ),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) return onError(snapshot);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: QuestionWidget(snapshot.data),
                  );
              }
              return null;
            }),
      ),
    );
  }

  Padding onError(AsyncSnapshot snapshot) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Error: ${snapshot.error}',
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            child: Text("Try Again"),
            onPressed: () {
              //QuizRepository().loadQuiz();
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
