import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/widgets/quiz_view.dart';

class Quiz extends StatelessWidget {
  Quiz({Key? key}) : super(key: key);

  final List<Widget> pages = [
    QuizView(
        answers: ['aaaaa', 'aaaaa', 'aaaaa'],
        question: 'What is the capital city of Papua New Guinea?'),
  ];

  @override
  Widget build(BuildContext context) {
    double widthMQ = MediaQuery.of(context).size.width;
    double heightMQ = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: double.infinity,
          height: 20,
          child: const ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              value: 0.7,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              backgroundColor: Colors.black26,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0XFFff512f),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0XFFff512f),
              Color(0XFFdd2476),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widthMQ * 0.04,
            vertical: heightMQ * 0.05,
          ),
          child: Column(
            children: [
              Expanded(child: pages[0]),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400],
                    disabledBackgroundColor: Colors.black12,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Play',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
