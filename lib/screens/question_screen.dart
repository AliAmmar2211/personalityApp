import 'package:flutter/material.dart';
import '../models/question.dart';

class QuestionScreen extends StatefulWidget {
  final Question question;
  final void Function(String) onAnswerSelected;

  const QuestionScreen({
    super.key,
    required this.question,
    required this.onAnswerSelected,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.question.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 25),
          ...widget.question.answers.map((answer) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15), // Add spacing between buttons
              child: ElevatedButton(
                onPressed: () => widget.onAnswerSelected(
                  answer.personality.toString().split('.').last,
                ),
                child: Text(answer.text),
              ),
            );
          }),
        ],
      ),
    );
  }
}
