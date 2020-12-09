import 'package:flutter/material.dart';
import 'package:flutter_quiz/provider/score_provider.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String _title;

  @override
  final Size preferredSize;

  const MyAppBar(this._title, {Key key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              _title,
              style:
                  TextStyle(fontFamily: "roboto", fontWeight: FontWeight.bold),
            ),
          ),
          Text("Score: ${context.watch<ScoreProvider>().score}/30")
        ],
      ),
      elevation: 0.0,
    );
  }
}
