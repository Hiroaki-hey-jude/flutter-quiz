import 'package:quiz/model/option.dart';

class Question {
  String? text;
  List<Option>? options;
  String? solution;

  Question({this.text, this.options, this.solution});

  final questions = [
    Question(
      text: 'Flutterはどのプログラミング言語を使ってアプリを作るますか',
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
}