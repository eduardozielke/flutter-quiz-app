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
      appBar: AppBar(),
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
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () => showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    enableDrag: true,
                    isScrollControlled: true,
                    builder: (context) => buildSheet(context)),
                child: const Text(
                  'Show answers',
                  style: TextStyle(
                    color: Colors.black,
                  ),
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
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widthMQ * 0.02),
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
                    leading: const FlutterLogo(size: 56.0),
                    title: Text(choosedAnswers[index].choosed),
                    subtitle: Text(choosedAnswers[index].rightAnswer),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
