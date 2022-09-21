import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quiz_app/models/api_response.dart';
import 'package:flutter_quiz_app/models/categories.dart';
import 'package:flutter_quiz_app/service/quiz_service.dart';
import 'package:flutter_quiz_app/widgets/multi_select.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> categories = [];
  double numberOfQuestions = 5;
  var chosenDifficulty = 'easy';

  List<Widget> difficulties = const <Widget>[
    Text('Easy'),
    Text('Medium'),
    Text('Hard')
  ];

  List<String> difficultiesList = const [
    'easy',
    'medium',
    'hard',
  ];

  final List<bool> selectedDifficulty = <bool>[true, false, false];

  void _showMultiSelect() async {
    final List<String> items = categoriesMap.keys.toList();

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );

    if (results != null) {
      setState(() {
        categories = results;
      });
    }
  }

  getQuiz() async {
    print(chosenDifficulty);
    await QuizService().getQuizList(
      limit: numberOfQuestions.round(),
      categories: categories,
      difficulty: chosenDifficulty,
    );
  }

  int segmentedControlGroupValue = 0;
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Padding(padding: EdgeInsets.all(15), child: Text("Easy")),
    1: Padding(padding: EdgeInsets.all(15), child: Text("Medium")),
    2: Padding(padding: EdgeInsets.all(15), child: Text("Hard")),
  };

  @override
  Widget build(BuildContext context) {
    double widthMQ = MediaQuery.of(context).size.width;
    double heightMQ = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizzes', style: TextStyle(fontSize: 30)),
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
            horizontal: widthMQ * 0.08,
            vertical: heightMQ * 0.05,
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: _showMultiSelect,
                      child: const Text(
                        'Select Your Favorite Topics',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Wrap(
                      spacing: 6,
                      children: categories
                          .map((e) => Chip(
                                backgroundColor: Colors.white,
                                label: Text(e),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Select a difficulty',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    CupertinoSlidingSegmentedControl(
                      backgroundColor: Colors.red[200]!,
                      groupValue: segmentedControlGroupValue,
                      children: myTabs,
                      onValueChanged: (i) {
                        setState(() {
                          chosenDifficulty = difficultiesList[i!];
                          segmentedControlGroupValue = i;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Number of questions ${numberOfQuestions.round().toString()}',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Slider(
                      value: numberOfQuestions,
                      max: 20,
                      activeColor: Colors.white,
                      inactiveColor: Colors.black26,
                      onChanged: (double value) {
                        setState(() {
                          numberOfQuestions = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400],
                    disabledBackgroundColor: Colors.black12,
                  ),
                  onPressed: numberOfQuestions != 0 ? getQuiz : null,
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


// Container(
//                       padding: EdgeInsets.zero,
//                       height: 42,
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                       ),
//                       child: ToggleButtons(
//                         direction: Axis.horizontal,
//                         onPressed: (int index) {
//                           setState(() {
//                             chosenDifficulty = difficultiesList[index];
//                             for (int i = 0;
//                                 i < selectedDifficulty.length;
//                                 i++) {
//                               selectedDifficulty[i] = i == index;
//                             }
//                           });
//                         },
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(8)),
//                         selectedBorderColor: Colors.red[700],
//                         selectedColor: Colors.white,
//                         fillColor: Colors.red[200],
//                         color: Colors.black,
//                         constraints: const BoxConstraints(
//                           minHeight: 40.0,
//                           minWidth: 80.0,
//                         ),
//                         isSelected: selectedDifficulty,
//                         children: difficulties,
//                       ),
//                     ),