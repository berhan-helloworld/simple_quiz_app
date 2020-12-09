import 'package:flutter/material.dart';
import 'package:flutter_quiz/provider/score_provider.dart';
import 'package:flutter_quiz/screens/home/home_page.dart';
import 'package:provider/provider.dart';

class Congrats extends StatelessWidget {
  const Congrats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
              "You Have Got: ${context.watch<ScoreProvider>().score.toString()}"),
          SizedBox(
            height: 5,
          ),
          FlatButton(
            child: Text(
              "Try Again",
              style: TextStyle(color: Colors.red[400]),
            ),
            onPressed: () {
              context.watch<ScoreProvider>().resetScore();
              HomePage();
            },
          ),
        ],
      ),
    );
  }
}
