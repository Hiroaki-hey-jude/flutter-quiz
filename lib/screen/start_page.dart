import 'package:flutter/material.dart';
import 'package:quiz/screen/question_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final _form = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  String? _name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 3.5,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    'Q',
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Text(
                  'Quiz Men',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.amber,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Form(child: Container(
                  key: _form,
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xff005dff),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff000000),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff000000),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      hintText: 'ニックネーム',
                    ),
                    // onSaved: (value) {
                    //   print('何が起きてるのですか');
                    //   _name = value;
                    // },
                  ),
                )),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionPage(),
                      ),
                    );
                    // print(_name);
                    // _form.currentState!.save();
                  },
                  child: Text(
                    '始める',
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
