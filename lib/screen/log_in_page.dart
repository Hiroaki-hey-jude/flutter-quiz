import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:quiz/global/email_password_auth.dart';
import 'package:quiz/global/enum.dart';
import 'package:quiz/global/reg_exp.dart';
import 'package:quiz/screen/question_page.dart';
import 'package:quiz/screen/start_page.dart';
import 'package:quiz/widget/common_auth.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _logInKey = GlobalKey();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final EmailPasswordAuth _emailPasswordAuth = EmailPasswordAuth();
  bool _isLoading = false;
  int a = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: GestureDetector(
          onTap: () {
            final FocusScopeNode currentScope = FocusScope.of(context);
            if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: LoadingOverlay(
            isLoading: _isLoading,
            child: Container(
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 56,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Log-In',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 2.5,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Form(
                      key: this._logInKey,
                      child: ListView(
                        children: [
                          commonTextFormField(
                              hintText: 'Email',
                              validator: (inputVal) {
                                if (!emailRegex.hasMatch(inputVal.toString()))
                                  return 'Email format is not matching';
                                return null;
                              },
                              textEditingController: this.email),
                          commonTextFormField(
                              hintText: 'Password',
                              validator: (String? inputVal) {
                                if (inputVal!.length < 6)
                                  return 'Password must be at least 6 characters';
                                return null;
                              },
                              textEditingController: this.password),
                          loginAuthButton(context, 'Log-In'),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Or Continue With',
                      style: TextStyle(color: Colors.white24, fontSize: 20.0),
                    ),
                  ),
                  switchAnotherAuthScreen(context, "Don't you have an account? ", 'sign-up'),
                ],
              ),
            ),
          ),
        ),
      );
  }

  Widget loginAuthButton(BuildContext context, String buttonName) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
            MediaQuery
                .of(context)
                .size
                .width - 60,
            40.0,
          ),
          elevation: 5.0,
          primary: Color.fromRGBO(57, 60, 80, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 25.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        onPressed: () async {
          if (this._logInKey.currentState!.validate()) {
            SystemChannels.textInput.invokeMethod('TextInput.hide');

            if (mounted) {
              setState(() {
                this._isLoading = true;
              });
            }

            final EmailLogInResults emailLogInResults = await _emailPasswordAuth
                .logInWithEmailAndPassword(
                email: this.email.text, pwd: this.password.text);
            String message = '';
            if (emailLogInResults == EmailLogInResults.LogInCompleted)
              Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (_) => StartPage()), (
                  route) => false); // need to start from here
            else if (emailLogInResults == EmailLogInResults.EmailNotVerified) {
              message =
              'Email not verified. \nPlease Verify your Email and then log in';
            } else
            if (emailLogInResults == EmailLogInResults.EmailPasswordInvalid) {
              message = 'Email And Password Invalid';
            } else
              message = 'Sing in not completed';

            if (message != '')
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)));

            if (mounted) {
              setState(() {
                this._isLoading = false;
              });
            }

            print('validated');
          } else
            print('not validated');
        },
      ),
    );
  }
}