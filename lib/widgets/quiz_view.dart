import 'package:flutter/material.dart';

class QuizView extends StatelessWidget {
  final String question;
  final List<String> answers;

  const QuizView({
    Key? key,
    required this.answers,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Center(
              child: Text(
                question,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: answers.length,
          children: List.generate(
            4,
            (index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    answers[0],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
