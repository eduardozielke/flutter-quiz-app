import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/choices.dart';

class FinalPage extends StatelessWidget {
  final List<Choices> choosedAnswers;
  const FinalPage({
    Key? key,
    required this.choosedAnswers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0XFFff512f),
              Color.fromARGB(255, 3, 12, 107),
            ],
          ),
        ),
        child: Column(
          children: [Text('a')],
        ),
      ),
    );
  }
}
