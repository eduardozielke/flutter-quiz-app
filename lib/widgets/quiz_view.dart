// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class QuizView extends StatelessWidget {
  final String question;
  final List<dynamic> answers;
  final String correctAnswer;
  Function? setChoosedAnswers;

  QuizView({
    Key? key,
    required this.answers,
    required this.question,
    required this.correctAnswer,
    this.setChoosedAnswers,
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
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          children: List.generate(
            answers.length,
            (index) {
              return InkWell(
                onTap: () {
                  setChoosedAnswers!(answers[index], correctAnswer);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      answers[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    ),
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
