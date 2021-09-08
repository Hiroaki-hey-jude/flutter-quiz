import 'package:flutter/material.dart';
import 'package:quiz/screen/question_page.dart';

class LastPage extends StatefulWidget {
  int num = 0;
  var question = [];

  LastPage(this.num, this.question);

  @override
  _LastPageState createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 50, 5, 10),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('答え',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                    for(int i = 0; i < widget.question.length; i++)
                      Text('${i+1}. ${widget.question[i].solution}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text(
              'おめでとう!\n${widget.num}個成功したよ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => QuestionPage()),
                    (route) => false);
              },
              child: Text(
                'もう一回プレイする',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
