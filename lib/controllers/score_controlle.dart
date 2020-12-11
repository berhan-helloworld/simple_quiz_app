import 'package:get/get.dart';

class ScoreController extends GetxController {
  var score = 0.obs;
  void addScore() {
    score.value++;
  }

  void resetScore() {
    score.value = 0;
  }
}
