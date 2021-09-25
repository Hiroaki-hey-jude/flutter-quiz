import 'package:flutter/material.dart';
import 'package:quiz/screen/log_out_page.dart';

class CustomizePage extends StatefulWidget {
  const CustomizePage({Key? key}) : super(key: key);

  @override
  _CustomizePageState createState() => _CustomizePageState();
}

class _CustomizePageState extends State<CustomizePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('設定'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_sharp),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: Container(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogOutPage(),
                    ),
                  );
                },
                child: Ink(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 17,
                  color: Colors.lightBlueAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          'アカウント管理',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_outlined)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
