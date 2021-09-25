import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogOutPage extends StatelessWidget {
  const LogOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('アカウント管理'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Container(
                color: Colors.lightBlue,
                width: MediaQuery.of(context).size.width-20,
                height: MediaQuery.of(context).size.height/20,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('アカウント:',
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 10
                      ),),
                      SizedBox(width: 3),
                      Text(currentUser!.email.toString()),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Container(
                width: MediaQuery.of(context).size.width-20,
                height: MediaQuery.of(context).size.height/20,
                child: ElevatedButton(
                  onPressed: () async{
                    await FirebaseAuth.instance.signOut();
                  },
                  child: Text('サインアウト'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
