import 'package:flutter/material.dart';
import 'package:quiz/model/option.dart';
import 'package:quiz/screen/last_page.dart';
import '../model/question.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final questions = [
    Question(
      text: 'Flutterはどのプログラミング言語を使ってアプリを作りますか？',
      options: [
        Option(code: 'A', text: 'C++', isCorrect: false),
        Option(code: 'B', text: 'Python', isCorrect: false),
        Option(code: 'C', text: 'Dart', isCorrect: true),
        Option(code: 'D', text: 'Kotlin', isCorrect: false),
      ],
      solution: 'FlutterはDartというプログラミン言語を採用しています。',
    ),
    Question(
      text: 'Flutterの状態管理で有名なものは何か',
      options: [
        Option(code: 'A', text: 'Future', isCorrect: false),
        Option(code: 'B', text: 'Riverpod', isCorrect: true),
        Option(code: 'C', text: 'Cube', isCorrect: false),
        Option(code: 'D', text: 'Stream', isCorrect: false),
      ],
      solution: 'Riverpod',
    ),
    Question(
      text: '子要素を縦に配列したい時に使えるWidgetは何ですか？',
      options: [
        Option(code: 'A', text: 'Row', isCorrect: false),
        Option(code: 'B', text: 'Wrap', isCorrect: false),
        Option(code: 'C', text: 'ListView', isCorrect: true),
        Option(code: 'D', text: 'Text', isCorrect: false),
      ],
      solution: '正解はListViewです。',
    ),
  ];
  int questionNum = 0;
  int numOfCorrectAnswer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.blueAccent,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 90, 15, 15),
                  child: Text(
                    questions[questionNum].text!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      answerButton(0),
                      answerButton(1),
                      answerButton(2),
                      answerButton(3),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget answerButton(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            if (questions[questionNum].options![index].isCorrect == true) {
              numOfCorrectAnswer++;
            }
            if (questionNum + 1 < questions.length) {
              setState(() {
                questionNum++;
              });
            } else {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LastPage(numOfCorrectAnswer, questions)));
            }
          },
          child: Text(
            questions[questionNum].options![index].text!,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
