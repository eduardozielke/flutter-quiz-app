import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/choices.dart';
import 'package:flutter_quiz_app/pages/home.dart';
import 'package:flutter_quiz_app/widgets/quiz_button.dart';

class FinalPage extends StatelessWidget {
  final List<Choices> choosedAnswers;
  const FinalPage({
    Key? key,
    required this.choosedAnswers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthMQ = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, elevation: 0),
      body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 100),
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
            children: [
              Expanded(child: SizedBox()),
              QuizButton(
                buttonText: 'Back to menu',
                width: widthMQ * 0.8,
                backgroundColor: Colors.white,
                textColor: Colors.black,
                disabled: true,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const Home(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              QuizButton(
                buttonText: 'Show answers',
                backgroundColor: Colors.white,
                textColor: Colors.black,
                //TODO Fix disabled
                disabled: true,
                width: widthMQ * 0.8,
                onPressed: () => showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  enableDrag: true,
                  isScrollControlled: true,
                  builder: (context) => buildSheet(context),
                ),
              ),
            ],
          )),
    );
  }

  Widget makeDismissible({required Widget child, required context}) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  Widget buildSheet(context) {
    double widthMQ = MediaQuery.of(context).size.width;

    return makeDismissible(
      context: context,
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.4,
        builder: (_, controller) => Container(
          decoration: const BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widthMQ * 0.02,
              vertical: 15,
            ),
            child: ListView.separated(
              controller: controller,
              separatorBuilder: (context, index) => const SizedBox(height: 2),
              padding: const EdgeInsets.only(bottom: 40),
              itemCount: choosedAnswers.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: getIcon(choosedAnswers[index].isCorrect),
                    title: Text(choosedAnswers[index].question),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          choosedAnswers[index].rightAnswer,
                          style: const TextStyle(color: Colors.green),
                        ),
                        if (!choosedAnswers[index].isCorrect)
                          Text(
                            choosedAnswers[index].choosed,
                            style: const TextStyle(color: Colors.red),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget getIcon(bool isCorrect) {
    if (isCorrect) {
      return const SizedBox(
        width: 30,
        height: double.infinity,
        child: Center(
          child: Icon(
            Icons.check,
            color: Colors.green,
            size: 40,
          ),
        ),
      );
    }
    return const SizedBox(
      width: 30,
      height: double.infinity,
      child: Center(
        child: Icon(
          Icons.close,
          color: Colors.red,
          size: 40,
        ),
      ),
    );
  }
}
