import 'package:flutter/material.dart';
import 'package:personalitytest/models/personality.dart';
import 'data/questions.dart';
import 'screens/start_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int currentQuestionIndex = 0;
  Map<String, int> personalityScores = {
    'Thinker': 0,
    'Feeler': 0,
    'Planner': 0,
    'Adventurer': 0,
  };

  void startQuiz() {
  setState(() {
    currentQuestionIndex = 1; // Start from the first question
    personalityScores = {
      'Thinker': 0,
      'Feeler': 0,
      'Planner': 0,
      'Adventurer': 0,
    };
  });
}

  void answerQuestion(String personality) {
  setState(() {
    personalityScores[personality] = personalityScores[personality]! + 1;

    if (currentQuestionIndex < questions.length) {
      currentQuestionIndex++; // Move to the next question
    } else {
      currentQuestionIndex = -1; // Show the result screen
    }
  });
}

 @override
Widget build(BuildContext context) {
  Widget screen;

  if (currentQuestionIndex == -1) {
    // Show the result screen
    String resultKey = personalityScores.entries.reduce((a, b) => a.value > b.value ? a : b).key;
    Personality result = Personality.values.firstWhere((p) => p.toString().split('.').last == resultKey);
    screen = ResultScreen(result: result, onRestart: startQuiz);
  } else if (currentQuestionIndex == 0) {
    // Show the start screen
    screen = StartScreen(onStart: startQuiz);
  } else {
    // Show the question screen
    screen = QuestionScreen(
      question: questions[currentQuestionIndex -1],
      onAnswerSelected: answerQuestion,
    );
  }

  return Container(

      child: screen,
    );
}
}