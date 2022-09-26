// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class QuizView extends StatefulWidget {
  final String question;
  final List<dynamic> answers;
  final String correctAnswer;
  int selectedIndex;
  Function? setChoosedAnswers;

  QuizView({
    Key? key,
    required this.answers,
    required this.question,
    required this.correctAnswer,
    required this.selectedIndex,
    this.setChoosedAnswers,
  }) : super(key: key);

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
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
                widget.question,
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
            widget.answers.length,
            (index) {
              return InkWell(
                onTap: () {
                  if (widget.selectedIndex != -1) return;
                  setState(() => widget.selectedIndex = index);
                  widget.setChoosedAnswers!(
                    widget.answers[index],
                    widget.correctAnswer,
                  );
                },
                child: Card(
                  color: getAnswerColor(
                    index: index,
                    rightAnswer: widget.answers[index] == widget.correctAnswer,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      widget.answers[index],
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

  Color getAnswerColor({index, rightAnswer}) {
    if ((widget.selectedIndex % widget.answers.length ==
            index % widget.answers.length) &&
        widget.selectedIndex != -1) {
      if (rightAnswer) {
        return Colors.green;
      }
      return Color(0XFF6a9eda);
    } else {
      Colors.white;
    }

    return Colors.white;
    // ? Color(0XFF6a9eda)
    // : Colors.white,
  }
}
