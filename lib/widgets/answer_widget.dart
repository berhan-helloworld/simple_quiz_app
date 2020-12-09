import 'package:flutter/material.dart';
import 'package:flutter_quiz/model/results.dart';
import 'package:flutter_quiz/provider/quiz_state.dart';
import 'package:flutter_quiz/provider/score_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AnswerWidget extends StatefulWidget {
  final List<Results> _results;
  final int index;
  final String m;

  AnswerWidget(this._results, this.index, this.m);

  @override
  _AnswerWidgetState createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  Color ansColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizState>(context);
    return ListTile(
      onTap: () {},
      title: FlatButton(
          onPressed: () {
            if (widget.m == widget._results[widget.index].correctAnswer) {
              context.read<ScoreProvider>().addScore();
              setState(() {
                buildShowToast("Correct!", 0);
                ansColor = Colors.green;
                state.nextPage();
              });
            } else {
              setState(() {
                buildShowToast("sorry!", 1);
                ansColor = Colors.red;
                state.nextPage();
              });
            }
          },
          child: Text(
            widget.m,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ansColor,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  Future<bool> buildShowToast(String msg, int ans) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: (ans == 0) ? Colors.green : Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
