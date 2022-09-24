import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/widgets/quiz_view.dart';

class QuizPage extends StatefulWidget {
  final List<QuizView> pages;
  const QuizPage({Key? key, required this.pages}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    double widthMQ = MediaQuery.of(context).size.width;
    double heightMQ = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: double.infinity,
          height: 20,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              value: selectedPage * 0.1,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
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
              Expanded(child: widget.pages.elementAt(selectedPage)),
              SizedBox(
                height: 45,
                width: widthMQ * 0.86,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400],
                    disabledBackgroundColor: Colors.black12,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedPage++;
                    });
                  },
                  child: const Text(
                    'Next',
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
