import 'package:flutter/material.dart';
import 'package:quiz/screen/question_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);


  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final _form = GlobalKey<FormState>();
  TextEditingController _textEditingController = TextEditingController();
  String? name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: SafeArea(
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
                    'Flutter Quiz',
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
                  child: Form(
                      key: _form,
                      child: Container(
                        child: TextFormField(
                          controller: _textEditingController,
                          validator: (value) {
                            print("onValid");
                            print(_textEditingController.text);
                          },
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
                      if (_form.currentState!.validate()) {
                        name = _textEditingController.text;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuestionPage(userName: name),
                          ),
                        );
                      }
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
      ),
    );
  }
}
