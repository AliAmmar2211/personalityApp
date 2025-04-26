import 'package:flutter/material.dart';
import '../models/personality.dart';

class ResultScreen extends StatelessWidget {
  final Personality result;
  final VoidCallback onRestart;

  const ResultScreen({super.key, required this.result, required this.onRestart});

  @override
  Widget build(BuildContext context) {
    final messages = {
      Personality.Feeler: "You are a Feeler \n 💖\n Empathetic, warm, \nand guided by emotion.",
      Personality.Thinker: "You are a Thinker \n🧠\n Logical, curious,\n and focused on ideas.",
      Personality.Planner: "You are a Planner \n📆\n Organized, strategic,\n and goal-oriented.",
      Personality.Adventurer: "You are an Adventurer\n 🧠 \nSpontaneous, bold,\n and always exploring.",
    };

    return Container(
      color: const Color(0xFF3A506B), // Background color
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
          children: [
            Text(
              messages[result]!,
              textAlign: TextAlign.center, // Center the text
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30), // Add spacing between text and button
            ElevatedButton(
              onPressed: onRestart,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF3A506B),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Restart Test",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}