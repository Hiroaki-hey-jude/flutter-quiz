import 'package:flutter/material.dart';
import 'package:quiz/model/option.dart';
import '../model/question.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final questions = [
    Question(
      text: 'Flutterはどのプログラミング言語を使ってアプリを作りますか',
      options: [
        Option(code: 'A', text: 'C++', isCorrect: false),
        Option(code: 'B', text: 'Python', isCorrect: false),
        Option(code: 'C', text: 'Dart', isCorrect: true),
        Option(code: 'D', text: 'Kotlin', isCorrect: false),
      ],
      solution: 'FlutterはDartというプログラミン言語を採用しています。',
    ),
    Question(
      text: '子要素を縦に配列したい時に使えるWidgetは何ですか',
      options: [
        Option(code: 'A', text: 'Row', isCorrect: false),
        Option(code: 'B', text: 'Wrap', isCorrect: false),
        Option(code: 'C', text: 'ListView', isCorrect: true),
        Option(code: 'D', text: 'Text', isCorrect: false),
      ],
      solution: 'FlutterはDartというプログラミン言語を採用しています。',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blueAccent,
        child: ListView.builder(
          //scrollDirection: Axis.horizontal,
          itemCount: questions.length,
          itemBuilder: (context, index){
            return Column(
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.3,
                    child: Text(questions[index].text!,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.7,
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          child: Text(questions[index].options![0].text!),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(questions[index].options![1].text!),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(questions[index].options![2].text!),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(questions[index].options![3].text!),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
