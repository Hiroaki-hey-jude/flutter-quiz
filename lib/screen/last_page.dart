import 'package:flutter/material.dart';
import 'package:quiz/screen/question_page.dart';
import 'package:quiz/screen/start_page.dart';

class LastPage extends StatefulWidget {
  int num = 0;
  var question = [];
  String? userName;

  LastPage(this.num, this.question, this.userName);

  @override
  _LastPageState createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            title: Text('hello'),
          ),
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.question.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.lightBlueAccent,
                child: Column(
                  children: [
                    Text('答え',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),),
                    Text(widget.question[index].text),
                    Card(
                      color: widget.question[index].options[0].isCorrect
                          ? Colors.red
                          : Colors.lightBlueAccent,
                      child: Container(
                        width: double.infinity,
                        child: Text(widget.question[index].options[0].text),
                      ),
                    ),
                    Card(
                      color: widget.question[index].options[1].isCorrect
                          ? Colors.red
                          : Colors.lightBlueAccent,
                      child: Container(
                        width: double.infinity,
                        child: Text(widget.question[index].options[1].text),
                      ),
                    ),
                    Card(
                      color: widget.question[index].options[2].isCorrect
                          ? Colors.red
                          : Colors.lightBlueAccent,
                      child: Container(
                        width: double.infinity,
                        child: Text(widget.question[index].options[2].text),
                      ),
                    ),
                    Card(
                      color: widget.question[index].options[3].isCorrect
                          ? Colors.red
                          : Colors.lightBlueAccent,
                      child: Container(
                        width: double.infinity,
                        child: Text(widget.question[index].options[3].text),
                      ),
                    ),
                  ],
                ),
              );

            }));
  }
}
