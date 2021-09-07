import 'package:flutter/material.dart';

class LastPage extends StatefulWidget {
  int num = 0;
  LastPage(this.num);
  @override
  _LastPageState createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Container(
          child: Text('おめでとう${widget.num}個成果したよ'),
        ),
      ),
    );
  }
}
