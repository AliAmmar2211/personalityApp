// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import '../data/questions.dart';
import '../models/personality.dart';

class QuizController extends GetxController {
  var currentQuestionIndex = 0.obs;
  var result = Rxn<Personality>();

  void startTest() {
    currentQuestionIndex.value = 0;
    result.value = null;
  }

  void answerQuestion(Personality personality) {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
    } else {
      result.value = personality; // Simplified to show the last selected personality
    }
  }
}