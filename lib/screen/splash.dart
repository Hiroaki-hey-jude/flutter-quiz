import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz/screen/question_page.dart';
import 'package:quiz/screen/sign_up_page.dart';
import 'package:quiz/screen/start_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    print(currentUser);
    Timer(Duration(seconds: 3), () {
      if (currentUser == null) {
        print('nullですか');
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SignUpPage()));
      } else {
        print('nullじゃないんですか');
        FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!.uid)
            .get()
            .then((DocumentSnapshot result) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => StartPage()))
                .catchError((err) => print(err)));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text(
          'Flutter Quiz',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
