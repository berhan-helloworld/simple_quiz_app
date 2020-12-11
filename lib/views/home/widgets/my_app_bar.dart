import 'package:flutter/material.dart';
import 'package:flutter_quiz/controllers/score_controlle.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final scoreController = Get.put(ScoreController());
  final String _title;

  @override
  final Size preferredSize;

  MyAppBar(this._title, {Key key})
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
          Obx(() => Text("Score: ${scoreController.score.value}/30"))
        ],
      ),
      elevation: 0.0,
    );
  }
}
